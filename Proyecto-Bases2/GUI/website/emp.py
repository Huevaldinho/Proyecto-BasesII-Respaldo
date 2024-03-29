#Contiene las paginas a las que el usuario puede navegar (routes o emp)
#Tambien lo necesario para renderizar los templates

from flask import Blueprint,render_template,session,redirect,url_for,flash,request
from website.conexion.conexionServidores import *
from website.validaciones import validarNumero

emp = Blueprint('emp',__name__)

"""
    
Empleado ejemplo:
    Correo:ERetana@gmail.com
    Contra:gym800
"""


@emp.route('/menuEmpleado')
def menuEmpleado():
    if not session.get('correo'):
        flash('Para ingresar al a pagina principal debe iniciar sesión.',category='advertencia')
        return redirect(url_for('auth.iniciarSesion'))
    return render_template("menuEmpleado.html",usuario=session['correo'])#Devuelve el template 

@emp.route('/pedidosRealizados',methods=['GET','POST'])
def pedidosRealizados():
    if not session.get('pais'):#Valida que haya seleccionado pais.
        flash('Para poder ver los pedidos realizados es necesario seleccionar un pais.',category='error')
        return redirect(url_for('cli.pais'))
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursales()#Obtiene las sucursales del pais seleccionado
    session['sucursales'] = sucursales#guarda en la session las sucursales 
    if request.method=='GET':#Solo manda las sucursales
        return render_template('pedidosRealizados.html',sucursales=sucursales,pedidos=[])
    elif request.method=='POST':
        idSucursal = int(request.form.get('sucursalSeleccionada'))
        pedidos = conexion.verPedidosRealizados(idSucursal)
        conexion.cerrarConexionServidor()
        return render_template('pedidosRealizados.html',sucursales=sucursales,pedidos=pedidos)
        
@emp.route('/otorgarBono',methods=['GET','POST'])
def ortorgarBono():
    if request.method=='GET':
        #Llamar base para otorgar el bono
        conexion = ConexionServidorSQL()
        conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
        if (conexion.ortorgarBonos()):
            flash('Se han ortorgado los bonos correctamente.',category='success')
            conexion.cerrarConexionServidor()
        else:
            flash('No se ha podido otorgar los bonos',category='error')
        return redirect(url_for('emp.menuEmpleado'))

@emp.route('/verBonos',methods=['GET','POST'])
def verBonos():
    conexion = ConexionServidorSQL()
    conexion.conectarServidor(conexion.getNombreBaseDatos(session['pais']))#Se conecta al servidor del pais
    sucursales=conexion.getSucursales()#Obtiene las sucursales del pais seleccionado
    session['sucursales'] = sucursales#guarda en la session las sucursales 
    if request.method=='GET':
        return render_template('verBonos.html',sucursales=sucursales)
    elif request.method=='POST':
        #Sacar datos ingresados
        if (request.form.get('fechaInicialCheck') != None):
            fechaInicio = request.form.get('fechaInicialSeleccionada')
        else:
            fechaInicio = None
        if (request.form.get('fechaFinalCheck') != None):
            fechaFin = request.form.get('fechaFinalSeleccionada')
        else:
            fechaFin = None
        if (request.form.get('sucursalCheck') != None):
            idSucursal = eval(request.form.get('sucursalSeleccionada')).get('idSucursal') 
        else:
            idSucursal = None
        idEmpleado = request.form.get('idEmpleado')
        if (idEmpleado==''):
            idEmpleado=None
        bonos = conexion.verBonosOtorgados(idEmpleado,fechaInicio,fechaFin,idSucursal,1)
        return render_template('verBonos.html',bonos=bonos,sucursales=sucursales)

