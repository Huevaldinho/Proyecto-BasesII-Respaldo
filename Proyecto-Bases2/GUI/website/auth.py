
#Contiene las paginas a las que el cliente/empleado puede navegar (routes o cli) de la parte de autenticacion
#Tambien lo necesario para renderizar los templates
from flask import Blueprint,render_template,request,flash,redirect, session,url_for
from website.validaciones import *
from website.conexion.conexionServidores import *



auth = Blueprint('auth',__name__)



#Funcion que valida datos del inicio de sesion
def validacionesIniciarSesion(correo,contrasenna):
    #Si el correo no es valido entonces envia un mensaje que es muestra en un bloque hecho en el template base.
    if  validarCorreo(correo)==False:
        return flash('Formato de correo electronico es incorrecto.',category='error')
    elif validarContrasenna(contrasenna)==False:#Si la contrasenna no es valida entonces envia un mensaje que es muestra en un bloque hecho en el template base.
        return flash('Formato de contraseña es incorrecto.',category='error')
    return True#Todo bien con los formatos
        

def validacionesRegistrarse(nombre,apellido1,apellido2,cedula,correo,celular,fechaNacimiento,contrasenna1,contrasenna2):
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
    #Celular
    elif validarCelular(celular)==False:
        return flash('Formato de celular es incorrecto.',category='error')
    #Fecha nacimiento 
    elif validarFechaNacimiento(fechaNacimiento)==False:
        return flash('La fecha ingresada es invalida.',category='error')
    #Contrasenas
    elif validarContrasenna(contrasenna1)==False:
        return flash('Formato la contraseña es incorrecto.',category='error')
    elif validarContrasenna(contrasenna2)==False:
        return flash('Formato la contraseña es incorrecto.',category='error')
    elif (contrasenna1!=contrasenna2):
        return flash('Las contraseñas no coinciden.',category='error')
    return True#Todo bien con los formatos

"""
Ruta para iniciar sesion
methods=['GET','POST'] para los requests del servidor-frontEnd
GET pasa info de server a la parte grafica.
POST info al servidor desde la parte grafica.
"""
@auth.route('/iniciarSesion',methods=['GET','POST'])                                                    
def iniciarSesion():
    """
        Iniciar sesion requiere que se haya seleccionado el pais.
        Se validan formatos de correo y contrasenna.
        Se valida que exista el cliente/empleado en las tablas correspondientes
        segun se haya seleccionado en el radio buton.
    """
    if not session.get('pais'):
        return redirect(url_for('cli.pais'))

    session["correo"] =None
    #Si el request de la intefaz es de tipo post entonces saca la info de la pagina y la envia al server
    if request.method == 'POST':
        correo = request.form.get('correo')#extrae el correo ingresado
        contrasenna = request.form.get('contrasenna')#extra la contrasenna ingresadad
        #Llama a funcion que valida los datos ingresados en el inicio de sesion(uso otra funcion para no tener mucha cosa aqui)
        validacionFormatos = validacionesIniciarSesion(correo,contrasenna)
        
        if validacionFormatos==None:
            validacionFormatos #Si es None es porque hubo algun error de formato. Manda flash.
        else:#Si es None es porque los formatos estan bien, hay que validar con base de datos.
            clienteOempleado = request.form.get('options')#Selecciona Cliente o Empleado para saber a cual 
            if (clienteOempleado)==None:
                flash('Debe seleccionar la Cliente o Empleado.',category='error')
                return render_template("iniciarSesion.html",usuario=session['correo'])#Devuelve el template 
            conexion = ConexionServidorSQL()#Crea instancia de server
            #Si se selecciono el radio boton de Cliente
            if (clienteOempleado=="Cliente"):
                #Validar cliente con base de datos
                conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))#Se conecta al servidor del pais seleccionado
                if (conexion.validarContrasennaCliente(contrasenna,correo)):
                    flash('Se ha iniciado sessión correctamente. Bienvenido',category='success')
                    session["correo"] = correo#Guardar sesion
                    #Reridigir a la pagina de sucursal para posteriormente redirigirlo a pagina principal.
                    return redirect(url_for('cli.paginaPrincipal'))
                else:
                    flash('El correo o la contraseña ingresada no coincide con ningún cliente.',category='error')
            else:#Se selecciono el radio boton de empleado
                #Validar empleado con la base de datos
                conexion.conectarServidor(conexion.getNombreBaseDatos(session.get('pais')))#Conecta a la base de datos indicada(pais)
                if (conexion.validarContrasennaEmpleado(contrasenna,correo)):
                    flash('Se ha iniciado sessión correctamente. Bienvenido',category='success')
                    session["correo"] = correo#Guarda sesssion
                    conexion.cerrarConexionServidor()#Cierra la conexion con el server
                    return redirect(url_for('emp.menuEmpleado'))#Redirije al menu empleado
                else:
                    flash('El correo o la contraseña ingresada no conincide ningún administrador registrado.',category='error')
    return render_template("iniciarSesion.html",usuario=session['correo'])#Devuelve el template 

#Ruta para registrar cliente
@auth.route('/registrarse',methods=['GET','POST'])
def registrarse():
    """
        Registrarse es solo para clientes.
    """
    #Si la pagina hace request de tipo post es porque esta enviando datos
    if request.method == 'POST':
        #saca los datos ingresados por el cliente
        nombre = request.form.get('nombre')
        apellido1 = request.form.get('apellido1')
        apellido2 = request.form.get('apellido2')
        cedula = request.form.get('cedula')
        correo = request.form.get('correo')
        celular = request.form.get('celular')
        fechaNacimiento = request.form.get('fechaNacimiento')
        contrasenna1 = request.form.get('contrasenna1')
        contrasenna2 = request.form.get('contrasenna2')
        #Llama a funcion que valida info ingresada para registrarse.
        validacionFormato = validacionesRegistrarse(nombre,apellido1,apellido2,cedula,correo,celular,fechaNacimiento,contrasenna1,contrasenna2)
        if (validacionFormato==None):
            validacionFormato#Si hay errores con formatos
        else:#Validar con base de datos
            conexion = ConexionServidorSQL()
            conexion.conectarServidor('CostaRica')
            if (conexion.validarCorreoRegistrado(correo)==False):
                #pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento,pCorreo, pCelular, pContrasenna           
                #Crear cuenta en base de datos
                if (conexion.insertarCuentaCliente(nombre,apellido1,apellido2,int(cedula),fechaNacimiento,correo,celular,contrasenna1)):
                    #Guardar sesion
                    session["correo"] = correo
                    flash('Se ha creado cuenta correctamente.',category='success')
                    #Cierra la conexion con el server
                    conexion.cerrarConexionServidor()
                    #Reridigir a la pagina de sucursal para posteriormente redirigirlo a pagina principal.
                    return redirect(url_for('cli.paginaPrincipal'))
                else:
                    flash('No se ha podido crear la cuenta, intente de nuevo.',category='error')
            else:#Correo repetido
                flash('El correo ingresado ya se encuentre registrado.',category='error')
    return render_template("registrarse.html",usuario=session['correo'])#Devuelve el template  

#Ruta para cerrar sesion
@auth.route('/cerrarSesion')
def cerrarSesion():
    session.pop('correo', None)#Elimina la sesion del cliente
    session.pop('pais', None)#Elimina el pais seleccionado por el cliente
    session.pop('paises', None)#Elimina los paises para mostrar en seleccion de pais
    session.pop('sucursal', None)#Elimina la sucural seleccionada por el cliente
    session.pop('ubicacion', None)#Elimina la ubicacion seleccionadad por el cliente
    session.pop('idEmpleadoActualizar', None)#Elimina el idEmpleadoActualizar 
    session.pop('pedido', None)#Elimina el pedido seleccionadad por el cliente
    flash('Se ha cerrado sesión.',category='success') #Envia mensaje de aviso 
    return redirect(url_for('auth.iniciarSesion')) #Redirecciona a iniciarSesion
