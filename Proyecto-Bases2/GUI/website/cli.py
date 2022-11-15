#Contiene las paginas a las que el usuario puede navegar (routes o cli)
#Tambien lo necesario para renderizar los templates

import os
from flask import Blueprint,render_template,session,redirect,url_for,flash,request, send_from_directory
from website.validaciones import *
from website.conexion.conexionServidores import *
from website.validaciones import validarNumero
from pathlib import Path

cli = Blueprint('cli',__name__)

"""
Cliente ejemplo:
    Clint_Abbey9788@jiman.org
    pato123


"""
APP_ROOT = os.path.dirname(os.path.abspath(__file__))

def validacionesRegistrarse(nombre,apellido1,apellido2,cedula,correo,fechaNacimiento,contrasenna1,contrasenna2,fechaContratacion,foto):
    #Hacer validaciones de datos y fomatos
    #Nombre
    if validarNombreApellidoCliente(nombre)==False:
        return flash('Formato de nombre es incorrecto.',category='error')
    #Apellido 1
    elif validarNombreApellidoCliente(apellido1)==False:
        return flash('Formato de primer apellido es incorrecto.',category='error')
    #Apellido 2
    elif validarNombreApellidoCliente(apellido2)==False:
        return flash('Formato de segundo apellido es incorrecto.',category='error')
    #Cedula
    elif validarNumero(cedula)==False:
        return flash('Formato de cedula es incorrecto.',category='error')
    #Correo electronico
    elif validarCorreo(correo)==False:
        return flash('Formato de correo electronico es incorrecto.',category='error')
  
    #Fecha nacimiento 
    elif validarFechaNacimiento(fechaNacimiento)==False:
        return flash('La fecha ingresada es invalida.',category='error')

    elif validarFechaContratacion(fechaContratacion)==False:
        return flash('La fecha ingresada es invalida.',category='error')
    
    #Contrasenas
    elif validarContrasenna(contrasenna1)==False:
        return flash('Formato la contraseña es incorrecto.',category='error')
    elif validarContrasenna(contrasenna2)==False:
        return flash('Formato la contraseña es incorrecto.',category='error')
    elif (contrasenna1!=contrasenna2):
        return flash('Las contraseñas no coinciden.',category='error')
    elif validarFoto(foto)==False:
        return flash('Formato de la Foto es incorrecto.',category='error')
    return True#Todo bien con los formatos

def validacionesRegistrarProducto(nombre,descripcion,foto1,foto2,foto3):
    #Hacer validaciones de datos y fomatos
    #Nombre
    if validarNombreProducto(nombre)==False:
        return flash('Formato de nombre es incorrecto.',category='error')
    #Descripcion
    elif validarDescripcionProducto(descripcion)==False:
        return flash('Formato de la descripcion es incorrecto.',category='error')
    elif validarFoto(foto1)==False:
        return flash('Formato de la Foto 1 es incorrecto.',category='error')
    elif validarFoto(foto2)==False:
        return flash('Formato de la Foto 2 es incorrecto.',category='error')
    elif validarFoto(foto3)==False:
        return flash('Formato de la Foto 3 es incorrecto.',category='error')
    return True#Todo bien con los formatos

@cli.route('/',methods=['GET','POST'])#Define la ruta 
def paginaPrincipal():
    
    #Si no ha seleccionado el pais lo redirije para que lo haga.
    if not session.get('pais'):
        return redirect(url_for('cli.pais'))

    #Si el cliente o empleado no ha iniciado sesion lo redirije
    if not session.get("correo"):
        flash('Para ingresar al a pagina principal debe iniciar sesión.',category='advertencia')
        return redirect(url_for('auth.iniciarSesion'))

    #Al cliente se le redirije la pagina principal
    #Al empleado al menu empleado

    #Muestra la pagina principal del cliente
    return render_template("paginaPrincipal.html",usuario=session['correo'])#Cuando se llama a la ruta / lo que hace es ir a tomar el template paginaPrincipal.html

@cli.route('/pais',methods=['GET','POST'])
def pais():
    conexion = ConexionServidorSQL()
    paises=conexion.paises(1)#Obtine nombres de paises para mostrar en combobox.
    session["paises"]=paises 
    if request.method == "GET":
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('pais.html',paises=paises)
    elif request.method=='POST':
        session['pais'] = request.form.get('paisSeleccionado')#Guarda el pais seleccionado (con espacios y tildes) 
        #getNombreBaseDatos es para sacar de la base de datos del pais porque ahirita esta con espacios Costa Rica y 
        #tiene que ser Costa Rica o Panamá y tiene que ser Panama
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        #Redirije la pagina principal
        return redirect(url_for('cli.paginaPrincipal'))

@cli.route('/carrito', methods=['GET','POST'])
def carrito():
    if 'pedido' not in session.keys():
        session['pedido'] = []
    
    

    if request.method == "POST":
        
        if ('masButton' in request.form.keys()): # Se solicitan mas unidades
            idB = int(request.form['masButton']) #Agarramos el id del producto al que afectaremos
            conexion = ConexionServidorSQL()
            conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))            # conseguimos la cantidad en el inventario del producto al que agregaramos
            cantInvent = conexion.getCantInventario(session['pedido'][idB]['idProducto'],eval(session['sucursal']).get('idSucursal'))
            conexion.cerrarConexionServidor()
            
            if(len(cantInvent) == 0 or session['pedido'][idB].get('cantidad')+1>cantInvent[0]["cantidad"]):
                flash('No hay suficiente existencias',category='error') # Se solicitan mas unidades de las que hay
            else:
                session['pedido'][idB]['cantidad']+=1 # Se realiza el cambio de unidades en el pedido
            
        elif ('menosButton' in request.form.keys()): # Se solicitan menos unidades
            idB = int(request.form['menosButton']) #Agarramos el id del producto al que afectaremos
            if(session['pedido'][idB]['cantidad']-1>=0):
                session['pedido'][idB]['cantidad']-=1 # Se realiza el cambio de unidades en el pedido
        elif('removeButton' in request.form.keys()): # Se solicita eliminar un producto
            idB = int(request.form['removeButton']) #Agarramos el id del producto al que afectaremos
            session['pedido'].remove(session['pedido'][idB]) # Se elimina el producto en el pedido
        elif (request.form.get('submitButton') == 'comprar'):# Se realiza la compra
            if(session['pedido']!=[]): # Revisamos que haya un pedido
                session['idMetodoPago'] = request.form.get('metodoSeleccionado')
                comprar()   
                return redirect(url_for('cli.factura'))
        elif (request.form.get('submitButton') == 'domicilio'): #Se hara una compra a domicilio
            if(session['pedido']!=[]): # Revisamos que haya un pedido
                session['idMetodoPago'] = request.form.get('metodoSeleccionado')
                return redirect(url_for('cli.ubicacionDomicilio'))
        
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    pedidos = [conexion.readProducto(x.get("idProducto"))[0] for x in session['pedido']] #Pedidos del carrito a mostrar
    path  = "images\A"
    paths = []
    for p in pedidos:
        paths += [path[:-1]+p['nombre']]

    image_names = ['1.jpg', '2.jpg', '3.jpg']
    cantidad = [x.get("cantidad") for x in session['pedido']] #Cantidad de unidades por pedido
    length = len(session['pedido']) #Cantidades de productos a mostrar
    #subtotal de la compra
    subTotal = sum([x.get("cantidad")*conexion.readProducto(x.get("idProducto"))[0].get("precio") for x in session['pedido']])             
    metodos =  conexion.readMetodoPago() #metodos de pago disponibles
    conexion.cerrarConexionServidor()
    return render_template('carrito.html',pedidos = pedidos, cantidad = cantidad, paths = paths, image_names=image_names,
                    length = length, subTotal =subTotal, metodos = metodos)

def comprar(latitud = None, longitud = None):
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    session['idFactura'] = conexion.comprar((eval(session['sucursal']).get('idSucursal')),
    conexion.getIdCliente(session['correo'])[0].get('idCliente'), 1,
    session['idMetodoPago'], session['pedido'],latitud, longitud)
    conexion.cerrarConexionServidor()
    session['pedido']=[]
        
@cli.route('/ubicacionCliente',methods=['GET','POST'])
def ubicacionCliente():
    if not session.get('correo'):    #Valida que haya iniciado sesion
        flash('Para seleccionar la ubicacion debe iniciar sesion.',category='advertencia')
        return redirect(url_for('auth.iniciarSesion'))
    if request.method == 'POST':
        #Guarda la ubicacion en la session.
        session['ubicacion'] = request.get_json()#En formato json, ubicacion['latitud'] y ubicacion['longitud'] es float 
        print('Se ha guardado la ubicacion correctamente:',session['ubicacion'])
        return "http://127.0.0.1:5000/"
    elif request.method =='GET':#Se pide el template
        return render_template('ubicacionCliente.html')

@cli.route('/ubicacionDomicilio',methods=['GET','POST'])
def ubicacionDomicilio():
    if not session.get('correo'):    #Valida que haya iniciado sesion
        flash('Para seleccionar la ubicacion debe iniciar sesion.',category='advertencia')
        return redirect(url_for('auth.iniciarSesion'))
    if request.method == 'POST':
        #Guarda la ubicacion en la session.
        session['ubicacion'] = request.get_json()#En formato json, ubicacion['latitud'] y ubicacion['longitud'] es float 
        print('Se ha guardado la ubicacion correctamente:',session['ubicacion'])
        
        comprar(session['ubicacion']['latitud'],session['ubicacion']['longitud'] )
        return 'factura'
        
    elif request.method =='GET':#Se pide el template
        return render_template('ubicacionDomicilio.html')

@cli.route('/factura',methods=['GET'])
def factura():
    if request.method == "GET":
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
        factInfo = conexion.getInfoCompra(session['idFactura'])
        conexion.cerrarConexionServidor()
        return render_template('factura.html', factInfo = factInfo)

@cli.route('/consultarSucursal',methods=['GET','POST'])
def consultarSucursal():
    if not session['pais']:#Valida que haya seleccionado el pais
        flash('Debe seleccionar el pais para poder consultar las sucursales.',category='error')
        return redirect(url_for('cli.pais'))
    elif not session.get('ubicacion'):#Valida que haya selecionado la ubicacion
        flash('Debe seleccionar su ubicación para poder consultar las sucursales.',category='error')
        return redirect(url_for('cli.ubicacionCliente'))
    else:
        conexion =ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))
        infoSucursales = conexion.consultarSupermercado(session['ubicacion'].get('latitud'),session['ubicacion'].get('longitud'))
        if not infoSucursales:#Si no se pasa la ubicacion
            flash('Debe seleccionar su ubicación para poder consultar las sucursales.',category="error")
        #Cierra la conexion
        conexion.cerrarConexionServidor()   
        return render_template('consultarSucursal.html',infoSucursales=infoSucursales)

@cli.route('/sucursalExistencias',methods=['GET','POST'])
def sucursalExistencias():
    """
        Ingresa idProducto, ubicación del cliente y le devuelve la sucursal 
        con existencias del producto indicado y más cercana a la ubicación del cliente.
    """
    if request.method=='GET':
        print('UBICACION EN GET: ',session.get('ubicacion'))
        if not session.get('correo'):#Valida que haya iniciado sesion
            flash('Debe iniciar sesión para consultar sucursal con existencias más cercana.',category='warning')
            return redirect(url_for('auth.iniciarSesion'))
        elif not session.get('ubicacion'):#Valida que haya seleccionado ubicacion
            flash('Debe seleccionar su ubicación para consultar sucursal con existencias más cercana.',category='warning')
            return redirect(url_for('cli.ubicacionCliente'))
        else:
            return render_template('sucursalExistencias.html',ubicacion=session.get('ubicacion'),sucursal=None)
    elif request.method=='POST':
        idProductoIngresado = request.form.get('idProducto')
        if idProductoIngresado=='' or validarNumero(idProductoIngresado)==False:
            flash('Debe ingresar el id del producto a consultar (solo numeros enteros).',category='error')
        #Pedir sucursal mas cercana con el producto consultado
        conexion =ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))
        sucuralExistencias = conexion.getSucursalCercanaExistencias(session.get('ubicacion').get('latitud'),session.get('ubicacion').get('longitud'),int(idProductoIngresado))
        sucursal = {}
        if len(sucuralExistencias)!=0:
            sucursal=sucuralExistencias[0]
        conexion.cerrarConexionServidor()
        return render_template('sucursalExistencias.html',ubicacion=session.get('ubicacion'),sucursal=sucursal)

@cli.route('/ingresarProducto',methods=['GET','POST'])
def ingresarProducto(): #TODO Pasa parametro pais
    #Si la pagina hace request de tipo post es porque esta enviando datos
    
    if request.method =='GET':#Se pide el template
        return render_template('ingresarProducto.html') 

    if request.method == 'POST':
        #saca los datos ingresados por el empleado
        nombre = request.form.get('nombre')
        descripcion = request.form.get('descripcion')
        idCategoria =  request.form.get('idCategoria')
        precio = request.form.get('precio')
        lista = list()
        dire=os.getcwd()
        rut = Path(dire,"img")
        rut.mkdir(parents=True, exist_ok=True)
        print(nombre,descripcion,idCategoria,precio,dire,rut)
        for file in request.files.getlist("file"):
            print(file)
            ArchivoName = file.filename
            destination = Path(rut,ArchivoName)
            print(destination,"ESTE ES MI DESTINO")
            lista.append(destination)
            file.save(destination)
        print(lista)
        #Llama a funcion que valida info ingresada para registrarse.)
        validacionFormato = validacionesRegistrarProducto
        (nombre,descripcion,str(lista[0]),str(lista[1]),str(lista[2]))
        if (validacionFormato==None):
            validacionFormato#Si hay errores con formatos
        else:#Validar con base de datos
            conexion = ConexionServidorSQL()
            conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
            if (conexion.createProducto(int(idCategoria),nombre,descripcion,int(precio),str(lista[0]),str(lista[1]),str(lista[2]))):
                 flash('Se ha ingresado el producto.',category='success')  

            else:
                flash('No se ha podido ingresar el producto, intente de nuevo.',category='error')   
        
        conexion.cerrarConexionServidor() 
    return render_template('ingresarProducto.html')

@cli.route('/proveedorBuscar',methods=['GET','POST'])
def proveedorBuscar():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))
    productos = conexion.getProductos() #Productos
    paises = conexion.getPaises()
    provincias = conexion.getProvincias()
    cantones = conexion.getCantones()
    distritos = conexion.getDistritos()
    conexion.cerrarConexionServidor()
    conexion = ConexionServidorSQL()   
    resultados = None
    if request.method == "GET":
        return render_template('proveedorBuscar.html',paises = paises, provincias = provincias,
        cantones = cantones, distritos = distritos, productos = productos, resultados = resultados) 

    elif request.method=='POST':
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))
        if ('actuProvincia' in request.form.keys()): #Actualizamos las provincias segun el pais
            provincias = conexion.getProvincias(eval(request.form.get('PaisSeleccionado')).get('idPais'))
            return render_template('proveedorBuscar.html',paises = [eval(request.form.get('PaisSeleccionado'))],provincias = provincias,
            cantones = cantones, distritos = distritos, productos = productos, resultados = resultados) 
        elif ('actuCanton' in request.form.keys()): #Actualizamos los cantones segun la provincia
            cantones = conexion.getCantones(eval(request.form.get('ProvinciaSeleccionado')).get('idProvincia'))
            return render_template('proveedorBuscar.html',paises = [eval(request.form.get('PaisSeleccionado'))],
            provincias = [eval(request.form.get('ProvinciaSeleccionado'))],
            cantones = cantones, distritos = distritos, productos = productos, resultados = resultados) 
        elif ('actuDistrito' in request.form.keys()): #Actualizamos los distritos segun el canton
            distritos = conexion.getDistritos(eval(request.form.get('CantonSeleccionado')).get('idCanton'))
            return render_template('proveedorBuscar.html',paises = [eval(request.form.get('PaisSeleccionado'))],
            provincias = [eval(request.form.get('ProvinciaSeleccionado'))],
            cantones = [eval(request.form.get('CantonSeleccionado'))],
            distritos = distritos, productos = productos, resultados = resultados) 
        else: #Realizamos la consutla del proveedor
            idPais = eval(request.form.get('PaisSeleccionado')).get('idPais') if request.form.get('paisCheck') != None else None
            idProvincia = eval(request.form.get('ProvinciaSeleccionado')).get('idProvincia') if request.form.get('provinciaCheck') != None else None
            idCanton = eval(request.form.get('CantonSeleccionado')).get('idCanton') if request.form.get('cantonCheck') != None else None
            idDistrito = eval(request.form.get('DistritoSeleccionado')).get('idDistrito') if request.form.get('distritoCheck') != None else None
            idProducto = eval(request.form.get('ProductoSeleccionado').replace('Decimal','')).get('idProducto') if request.form.get('productoCheck') != None else None
            nombreProveedor = request.form.get('nombreProveedor') if request.form.get('proveedorCheck') != None else None
            
            resultados = conexion.buscarProveedores(idProducto, nombreProveedor, idPais, idProvincia,  idCanton, idDistrito)
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        
    return render_template('proveedorBuscar.html',paises = paises, provincias = provincias,
        cantones = cantones, distritos = distritos, productos = productos, resultados = resultados) 

@cli.route('/gananciasNetas',methods=['GET','POST'])
def gananciasNetas():
    conexion = ConexionServidorSQL()

    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursales()
    categorias = conexion.getCategorias()
    
    if request.method == "GET":
         return render_template('gananciasNetas.html',sucursales=sucursales,categorias=categorias, resultado=None)
    
    elif request.method=='POST':

        if (request.form.get('fechaInicialCheck') != None):
            fechaInicio = request.form.get('fechaInicialSeleccionada')
        else:
            fechaInicio = None

        if (request.form.get('fechaFinalCheck') != None):
            fechaFinal = request.form.get('fechaFinalSeleccionada')
        else:
            fechaFinal = None

        if (request.form.get('sucursalCheck') != None):
            idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') 
        else:
            idSucursal = None

        if (request.form.get('categoriaCheck') != None):
            idCategoria = eval(request.form.get('categoriaSeleccionada')).get('idCategoria')
        else:
            idCategoria = None

        idPais = session['paises'].index(session['pais'])+1
        resultado = conexion.getGananciasNetas(fechaInicio, fechaFinal, idPais, idSucursal, idCategoria)
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('gananciasNetas.html',sucursales=sucursales,categorias=categorias, resultado = resultado)

@cli.route('/consultaClientes',methods=['GET','POST'])
def consultaClientes():

    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    
    if request.method == "GET":
         return render_template('consultaClientes.html',resultado=None)
    
    elif request.method=='POST':

        if (request.form.get('cedulaCheck') != None):
            cedula =request.form.get('cedula')
        else:
            cedula = None
        
        if (request.form.get('idClienteCheck') != None):
            idCliente = request.form.get('idCliente')
        else:
            idCliente=None

        resultado = conexion.consultaCliente(cedula,idCliente)

        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('consultaClientes.html' ,resultado = resultado)

@cli.route('/updateCliente',methods=['GET','POST'])#TODO ver como conseguir los datos anteriores
def updateCliente():
    """
        
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos

    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    resultado=conexion.consultaClienteCorreo(session.get('correo'))[0]
    print(resultado)
    if request.method == "GET":
        return render_template('updateCliente.html',resultado=resultado)

    if request.method == 'POST':
        
        if (request.form.get('nombreCheck') != None):
            nombre = request.form.get('nombre')
        else:
            nombre = None

        if (request.form.get('apellido1Check') != None):
            apellido1 = request.form.get('apellido1')
        else:
            apellido1 = None

        if (request.form.get('apellido2Check') != None):
            apellido2 = request.form.get('apellido2')
        else:
            apellido2 = None

        if (request.form.get('cedulaCheck') != None):
            cedula = request.form.get('cedula')
        else:
            cedula = None

        if (request.form.get('correoCheck') != None):
            correo = request.form.get('correo')
        else:
            correo = None

        if (request.form.get('fechaNCheck') != None):
            fechaNacimiento = request.form.get('fechaNacimiento')
        else:
            fechaNacimiento = None

        if (request.form.get('celularCheck') != None):
            celular = request.form.get('celular')
        else:
            celular = None
       
        resultado=conexion.updateCliente(int(resultado['idCliente']),cedula, nombre, apellido1, apellido2, 
                fechaNacimiento, correo,celular)
        if (resultado!={}):
            flash('Se ha actualizado correctamente.',category='success')  
        else:
            flash('No se ha podido actualizar, intente de nuevo.',category='error')      
        conexion.cerrarConexionServidor()
        return render_template("updateCliente.html",resultado=resultado)#Devuelve el template  

@cli.route('/deleteCliente',methods=['GET','POST'])
def deleteCliente():
    """
        
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    if request.method == "GET":
         return render_template('deleteCliente.html')

    if request.method == 'POST':
        #saca los datos ingresados por el cliente
        
        idCliente=request.form.get('idCliente')
        if (idCliente==''):
              flash('Debe ingresar el ID del cliente que desea modificar',category='error')

        elif(conexion.getExisteCliente(idCliente)):
        #Buscar que el id exista, si verificar que si le ingresaron un num
          
            #Actualizar la base de datos
            if (conexion.deleteCliente(idCliente)):
                flash('Se ha cambiado el estado correctamente.',category='success')  
            else:
                flash('No se ha podido actualizar, intente de nuevo.',category='error')
        else:
            flash('El ID del cliente no existe',category='error')     
        conexion.cerrarConexionServidor()
        return render_template('deleteCliente.html')#Devuelve el template  

@cli.route('/consultaEmpleados',methods=['GET','POST'])
def consultaEmpleados():
    conexion = ConexionServidorSQL()

    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursal(session['pais'])
    puestos = conexion.getPuesto()
    if request.method == "GET":
         return render_template('consultaEmpleados.html',sucursales=sucursales,puestos=puestos, resultado=None)
    
    elif request.method=='POST':

        if (request.form.get('fechaInicialCheck') != None):
            fechaInicio = request.form.get('fechaInicialSeleccionada')
        else:
            fechaInicio = None

        if (request.form.get('fechaFinalCheck') != None):
            fechaFinal = request.form.get('fechaFinalSeleccionada')
        else:
            fechaFinal = None

        if (request.form.get('sucursalCheck') != None):
            idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') 
        else:
            idSucursal = None

        if (request.form.get('puestoCheck') != None):
            idPuesto = eval(request.form.get('puestoSeleccionado')).get('idPuesto')
        else:
            idPuesto = None
        
        idEmpleado = request.form.get('idEmpleado')
        if (idEmpleado==''):
            idEmpleado=None

        resultado = conexion.consultaEmpleado(idSucursal, idPuesto , fechaInicio,fechaFinal , idEmpleado )

        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('consultaEmpleados.html',sucursales=sucursales,puestos=puestos, resultado = resultado)

@cli.route('/ingresarEmpleado',methods=['GET','POST'])
def ingresarEmpleado():
    """
        
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    sucursales=conexion.getSucursal(session['pais'])
    puestos = conexion.getPuesto()
    if request.method == "GET":
         return render_template('ingresarEmpleado.html',sucursales=sucursales,puestos=puestos, resultado=None)

    if request.method == 'POST':
        #saca los datos ingresados por el cliente
        nombre = request.form.get('nombre')
        apellido1 = request.form.get('apellido1')
        apellido2 = request.form.get('apellido2')
        cedula = request.form.get('cedula')
        correo = request.form.get('correo')
        fechaNacimiento = request.form.get('fechaNacimiento')
        contrasenna1 = request.form.get('contrasenna1')
        contrasenna2 = request.form.get('contrasenna2')
        idPuesto = eval(request.form.get('puestoSeleccionado')).get('idPuesto')
        idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') 
        fechaContratacion=request.form.get('fechaContratacion')
        lista = list()
        ruta=os.getcwd()
        path = Path(ruta,"images")
        path.mkdir(parents=True, exist_ok=True)
        print(nombre,apellido1,apellido2,cedula,correo,fechaNacimiento,idPuesto,idSucursal,fechaContratacion)
        for file in request.files.getlist("file"):
            print(file)
            filename = file.filename
            destination = Path(path,filename)
            print(destination,"ESTE ES MI DESTINO")
            lista.append(destination)
            file.save(destination)
        print(lista)
        #Llama a funcion que valida info ingresada para registrarse.
        validacionFormato = validacionesRegistrarse
        (nombre,apellido1,apellido2,cedula,correo,fechaNacimiento,contrasenna1,contrasenna2,fechaContratacion,str(lista[0]))
        if (validacionFormato==None):
            validacionFormato#Si hay errores con formatos
        else:#Validar con base de datos
            
            if (conexion.validarCorreoEmpleadoRegistrado(correo)==False):
                #pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento,pCorreo, pCelular, pContrasenna           
                #Crear cuenta en base de datos
                if (conexion.insertarCuentaEmpleado(int(idPuesto), int(idSucursal), nombre, apellido1, apellido2, int(cedula),
                    fechaContratacion, fechaNacimiento, correo, str(lista[0]), contrasenna1)):
                    flash('Se ha creado cuenta correctamente.',category='success')  

                else:
                    flash('No se ha podido crear la cuenta, intente de nuevo.',category='error')
            else:#Correo repetido
                flash('El correo ingresado ya se encuentre registrado.',category='error')
        conexion.cerrarConexionServidor()
        return render_template("ingresarEmpleado.html",sucursales=sucursales,puestos=puestos, resultado=None)#Devuelve el template  

@cli.route('/actualizarEmp',methods=['GET','POST'])#TODO ver como conseguir los datos anteriores
def actualizarEmp():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    sucursales=conexion.getSucursal(session['pais'])
    puestos = conexion.getPuesto()
    resultado=conexion.readEmpleadoG(session.get('idEmpleadoActualizar'))[0]
    if request.method == "GET":
         return render_template('actualizarEm.html',sucursales=sucursales,puestos=puestos, resultado=resultado)
    if request.method == 'POST':
        if (request.form.get('nombreCheck') != None):
            nombre = request.form.get('nombre')
        else:
            nombre = None
        if (request.form.get('apellido1Check') != None):
            apellido1 = request.form.get('apellido1')
        else:
            apellido1 = None
        if (request.form.get('apellido2Check') != None):
            apellido2 = request.form.get('apellido2')
        else:
            apellido2 = None
        if (request.form.get('cedulaCheck') != None):
            cedula =int(request.form.get('cedula'))
        else:
            cedula = None
        if (request.form.get('correoCheck') != None):
            correo = request.form.get('correo')
        else:
            correo = None
        if (request.form.get('sucursalCheck') != None):
            idSucursal = int(eval(request.form.get('sucursalSeleccionada')).get('idSucursal'))
        else:
            idSucursal = None
        if (request.form.get('puestoCheck') != None):
            idPuesto = int(eval(request.form.get('puestoSeleccionado')).get('idPuesto'))
        else:
            idPuesto = None
        if (request.form.get('fechaNCheck') != None):
            fechaNacimiento = request.form.get('fechaNacimiento')
        else:
            fechaNacimiento = None
        if (request.form.get('fechaContratacionCheck') != None):
            fechaContratacion = request.form.get('fechaContratacion')
        else:
            fechaContratacion = None
        #Buscar que el id exista, si verificar que si le ingresaron un num
        foto=None
        if (request.form.get('fotoCheck') != None):
            lista = list()
            ruta=os.getcwd()
            path = Path(ruta,"images")
            path.mkdir(parents=True, exist_ok=True)
            for file in request.files.getlist("file"):
                filename = file.filename
                destination = Path(path,filename)
                lista.append(destination)
                file.save(destination)
            foto=str(lista[0])
            #Actualizar la base de datos
        if (conexion.updateEmpleado(int(session.get('idEmpleadoActualizar')),idPuesto, idSucursal,cedula, nombre, apellido1, apellido2, 
            fechaContratacion, fechaNacimiento, correo, foto)):
            flash('Se ha actualizado correctamente.',category='success')  
        else:
            flash('No se ha podido actualizar, intente de nuevo.',category='error')
        conexion.cerrarConexionServidor()
        return render_template("actualizarEm.html",sucursales=sucursales,puestos=puestos, resultado=resultado)#Devuelve el template  
            
@cli.route('/updateEmpleado',methods=['GET','POST'])#TODO ver como conseguir los datos anteriores
def updateEmpleado():
    """
        
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos

   
    if request.method == "GET":
         return render_template('updateEmpleado.html')
    elif request.method == 'POST':
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
        idEmpleado=request.form.get('idEmpleado')
        if (idEmpleado==''):
            flash('Debe ingresar el ID del empleado que desea modificar',category='error')
           
        elif(conexion.getExisteEmpleado(idEmpleado)):
            session['idEmpleadoActualizar']=idEmpleado #Aqui se enviar para el otro lado
            conexion.cerrarConexionServidor()  
            return redirect(url_for('cli.actualizarEmp')) 
        else:
            flash('EL ID del empleado no existe',category='error')  
        conexion.cerrarConexionServidor()
        return render_template("updateEmpleado.html")

@cli.route('/deleteEmpleado',methods=['GET','POST'])
def deleteEmpleado():
    """
        
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
    if request.method == "GET":
         return render_template('deleteEmpleado.html')

    if request.method == 'POST':
        #saca los datos ingresados por el cliente
        
        idEmpleado=request.form.get('idEmpleado')
        if (idEmpleado==''):
              flash('Debe ingresar el ID del empleado que desea modificar',category='error')

        elif(conexion.getExisteEmpleado(idEmpleado)):
        #Buscar que el id exista, si verificar que si le ingresaron un num
          
            #Actualizar la base de datos
            if (conexion.deleteEmpleado(idEmpleado)):
                flash('Se ha cambiado el estado correctamente.',category='success')  
            else:
                flash('No se ha podido actualizar, intente de nuevo.',category='error')
        else:
            flash('El ID del empleado no existe',category='error')         
        conexion.cerrarConexionServidor()
        return render_template("deleteEmpleado.html")#Devuelve el template  

@cli.route('/montoRecolectadoEnvio',methods=['GET','POST'])
def montoRecolectadoEnvio():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursal(session['pais'])
    
    if request.method == "GET":
         return render_template('montoRecolectadoEnvio.html',sucursales=sucursales, resultado=None)
    
    elif request.method=='POST':

        if (request.form.get('fechaInicialCheck') != None):
            fechaInicio = request.form.get('fechaInicialSeleccionada')
        else:
            fechaInicio = None

        if (request.form.get('fechaFinalCheck') != None):
            fechaFinal = request.form.get('fechaFinalSeleccionada')
        else:
            fechaFinal = None

        if (request.form.get('sucursalCheck') != None):
            idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') 
        else:
            idSucursal = None

        idCliente = request.form.get('idCliente')
        if (idCliente==''):
            idCliente=None

        resultado = conexion.montoRecolectadoEnvio(idSucursal, fechaInicio, fechaFinal, idCliente)

        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('montoRecolectadoEnvio.html',sucursales=sucursales, resultado = resultado)

@cli.route('/ponerProductosDescuento',methods=['GET','POST'])
def ponerProductosDescuento():
    
    if request.method == "GET":
        return render_template('productoVencido.html')
    
    elif request.method=='POST':
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
        
        op = int(request.form["flexRadioDefault"])
        porcentaje = request.form.get('porcentaje')
        cant = -1

        if (op == 1):
            if(porcentaje == ""):
                flash('Debe indicar el porcentaje',category='error')
            elif((int(porcentaje)>100 or int(porcentaje)<0)):
                flash('El porcentaje debe estar entre 0 y 100',category='error')
            else:
                cant = conexion.ponerProductoEnDescuento(int(porcentaje))
        else:
            cant = conexion.sacarDeExhibidor()

        if (cant != -1):
            flash('Se actualizaron '+ str(cant) +' lotes',category='success')

        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('productoVencido.html')

@cli.route('/sucursal',methods=['GET','POST'])
def sucursal():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursales()#Obtiene las sucursales del pais seleccionado
    session['sucursales'] = sucursales#guarda en la session las sucursales 
    
    if request.method == "GET":
        return render_template('sucursal.html',sucursales=sucursales, op = 1)
    elif request.method=='POST':
        session['sucursal'] = request.form.get('sucursalSeleccionada') #Guarda la sucursal seleccionado
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        #Reenvia el template de sucursal pero con arreglo de sucursales del pais
        return redirect(url_for('cli.home'))

@cli.route('/sucursalChoose',methods=['GET','POST'])
def sucursalChoose():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursales()#Obtiene las sucursales del pais seleccionado
    session['sucursales'] = sucursales#guarda en la session las sucursales 
    
    if request.method == "GET":
        return render_template('sucursal.html',sucursales=sucursales, op = 2)
    elif request.method=='POST':
        session['sucursal'] = request.form.get('sucursalSeleccionada') #Guarda la sucursal seleccionado

        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()

        #Reenvia el template de sucursal pero con arreglo de sucursales del pais
        return render_template('paginaPrincipal.html')
        
def existeEnPedido(key):
    for producto in session['pedido']:
        if (producto['idProducto'] == int(key)):
            return True
    return False

@cli.route('/upload/<path> <filename>')
def send_image(path, filename):
    return send_from_directory(path, filename)

@cli.route('/home',methods=['GET','POST'])
def home():
    conexion = ConexionServidorSQL()
    
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    idSucursal = eval(session['sucursal']).get('idSucursal')
    print(conexion.conexionViva())
    productos  = conexion.select("select Producto.idProducto, idCategoria,nombre,descripcion,precio from Producto inner join Inventario on Inventario.idProducto = Producto.idProducto where Inventario.idSucursal = ?",(idSucursal))
    print(productos)
    path  = "images\A"
    paths = []
    for p in productos:
        conexion.getFotosProducto(p['idProducto'])
        paths += [path[:-1]+p['nombre']]
        #p.update({'precioNacional':640.44 * float(p['precio'])}) 
        print(p)
        p.update({'precioNacional': conexion.conversion(1, p['precio'])})
    image_names = ['1.jpg', '2.jpg', '3.jpg']
    #return render_template("gallery.html", path = path, image_names=image_names)
    
    if request.method == "GET":
        return render_template('home.html', productos = productos, paths = paths, image_names=image_names, length = len(productos), pais = session['pais'])
    elif request.method=='POST':
        #Si la session existe lo agrega, si no la crea con el id del producto enviado
        if session.get('pedido'):
            if (existeEnPedido(request.form.get('btn')) == False):
                session['pedido'].append({'idProducto':int(request.form.get('btn')), 'cantidad':1})
        else:
            session['pedido']=[{'idProducto':int(request.form.get('btn')), 'cantidad':1}]
    
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()

        #Reenvia el template de sucursal pero con arreglo de sucursales del pais
        return redirect(url_for('cli.home'))

@cli.route('/buscarProducto',methods=['GET','POST'])
def buscarProducto():

    if request.method == "GET":
        return render_template('buscarProducto.html', productos = None)

    elif request.method=='POST':
        #Realiza todas las conexiones necesarias para obtener los productos
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))
        
        if not session.get('sucursal'):
            flash("Debe escoger la sucursal antes.", category="error")
            return redirect(url_for('cli.sucursalChoose'))
        
        idSucursal = eval(session['sucursal']).get('idSucursal')

        #obtengo la cadena de caracteres por buscar
        cadena = request.form.get('productoNombre')

        #si no se ingresa nada, envía este mensaje
        if (cadena == ''):
            flash('Debe ingresar el nombre del producto a buscar',category='error')
            
            #Cierra la conexion con el servidor
            conexion.cerrarConexionServidor()

            #Reenvia el template con el resultado de la búsqueda
            return render_template('buscarProducto.html', productos = None)
            
        #se le añaden los porcentajes para que entre en sintaxis sql y pueda realizr la busqueda
        cadena = '%'+cadena+'%'

        #obtengo el producto que tiene el nombre indicado
        productos = conexion.select("exec dbo.buscarProducto ?, ?",(idSucursal, cadena))
        
        if (len(productos) == 0):
            flash('No se encontraron coincidencias.',category='error')

            #Cierra la conexion con el servidor
            conexion.cerrarConexionServidor()

            #Reenvia el template con el resultado de la búsqueda
            return render_template('buscarProducto.html', productos = None, paths = None, image_names=None, length = None, pais = None)
        else:
            path  = "images\A"
            paths = []
            for p in productos:
                paths += [path[:-1]+p['nombre']]
                #p.update({'precioNacional':640.44 * float(p['precio'])}) 
                print(p)
                p.update({'precioNacional': conexion.conversion(1, p['precio'])})

            image_names = ['1.jpg', '2.jpg', '3.jpg']
            
            #Cierra la conexion con el servidor
            conexion.cerrarConexionServidor()
    
            #Reenvia el template con el resultado de la búsqueda
            return render_template('buscarProducto.html', productos = productos, paths = paths, image_names=image_names, length = len(productos), pais = session['pais'])

@cli.route('/reporteProductos',methods=['GET','POST'])
def reporteProducto():
    conexion = ConexionServidorSQL()

    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursal(session['pais'])
    productos = conexion.getProductos()
    proveedores = conexion.getProveedor()
    
    if request.method == "GET":
            return render_template('reporteProductos.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = None)

    elif request.method=='POST':

        fechaInicio = request.form.get('fechaInicialSeleccionada') if request.form.get('fechaInicialCheck') != None else None
        fechaFinal = request.form.get('fechaFinalSeleccionada')  if request.form.get('fechaFinalCheck') != None else None
        idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') if request.form.get('sucursalCheck') != None else None
        idProducto = eval(request.form.get('productoSeleccionado').replace('Decimal','')).get('idProducto') if request.form.get('productoCheck') != None else None
        idProveedor = eval(request.form.get('proveedorSeleccionado')).get('idProveedor') if request.form.get('proveedorCheck') != None else None
        idPais = session['paises'].index(session['pais'])+1
        resultado = conexion.reporteProductos(idPais, idProducto,  idSucursal, idProveedor, fechaInicio, fechaFinal)
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('reporteProductos.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = resultado)

@cli.route('/reporteClientes',methods=['GET','POST'])
def reporteClientes():
    conexion = ConexionServidorSQL()

    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursal(session['pais'])
    productos = conexion.getProductos()
    proveedores = conexion.getProveedor()
    
    if request.method == "GET":
            return render_template('reporteClientes.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = None)

    elif request.method=='POST':

        fechaInicio = request.form.get('fechaInicialSeleccionada') if request.form.get('fechaInicialCheck') != None else None
        fechaFinal = request.form.get('fechaFinalSeleccionada')  if request.form.get('fechaFinalCheck') != None else None
        idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') if request.form.get('sucursalCheck') != None else None
        idProducto = eval(request.form.get('productoSeleccionado').replace('Decimal','')).get('idProducto') if request.form.get('productoCheck') != None else None
        idProveedor = eval(request.form.get('proveedorSeleccionado')).get('idProveedor') if request.form.get('proveedorCheck') != None else None
        idPais = session['paises'].index(session['pais'])+1
        resultado = conexion.reporteClientes(idPais, idProducto,  idSucursal, idProveedor, fechaInicio, fechaFinal)
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('reporteClientes.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = resultado)

@cli.route('/reporteVencidos',methods=['GET','POST'])
def reporteVencido():
    conexion = ConexionServidorSQL()

    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursal(session['pais'])
    productos = conexion.getProductos()
    proveedores = conexion.getProveedor()
    
    if request.method == "GET":
            return render_template('reporteVencidos.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = None)

    elif request.method=='POST':

        fechaInicio = request.form.get('fechaInicialSeleccionada') if request.form.get('fechaInicialCheck') != None else None
        fechaFinal = request.form.get('fechaFinalSeleccionada')  if request.form.get('fechaFinalCheck') != None else None
        idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') if request.form.get('sucursalCheck') != None else None
        idProducto = eval(request.form.get('productoSeleccionado').replace('Decimal','')).get('idProducto') if request.form.get('productoCheck') != None else None
        idProveedor = eval(request.form.get('proveedorSeleccionado')).get('idProveedor') if request.form.get('proveedorCheck') != None else None
        idPais = session['paises'].index(session['pais'])+1
        resultado = conexion.reporteVencimientos(idPais, idProducto,  idSucursal, idProveedor, fechaInicio, fechaFinal)
        #Cierra la conexion con el servidor
        conexion.cerrarConexionServidor()
        return render_template('reporteVencidos.html',sucursales=sucursales,productos=productos, proveedores = proveedores, resultado = resultado)
