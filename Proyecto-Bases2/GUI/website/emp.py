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
        
        

        