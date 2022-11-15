import calendar
from datetime import date,datetime
import pyodbc
import psycopg2
from pathlib import Path
import os

class ConexionServidorSQL:
    servidor = None
    cursorSQL = None
    diccServidores = {'CostaRica':'(LocalDB)\CostaRica', 'Panama':'(LocalDB)\Panama', 'Colombia':'(LocalDB)\Colombia'}
    paisesDic = {"Costa Rica":"CostaRica","Panama":"Panama","Colombia":"Colombia"}

    def paises(self,opcion):
        """
            Metodo para obtener los nombres de los paises que se deben mostrar en el combobox de seleccionar
            ubicacion en la parte de la UI.

            Opcion 1: Obtiene los nombres en una lista de los paises (con tildes y espacios)
            Opcion 2: Obtiene los nombres en una lista de las bases de datos (para ir a pegarse al servidor correcpondiente).
        """
        
        if (opcion==1):
            return list(self.paisesDic.keys())
        elif opcion==2:
            return list(self.paises.values())

    def getNombreBaseDatos(self,nombrePais):
        """
            Metodo para sacar el nombre de base de datos a partir de nombre de pais.
            nombrePais: Nombre de pais seleecionado en el combobox, tiene tildes y espacios. 

        """
        return self.paisesDic.get(nombrePais)
        
    #Intenta conectarse al servidor con nombre=nombreServidor
    def conectarServidor(self,nombrePais):
        if type(nombrePais)!=str:
            print('nombreServidor y baseDatos deben ser string')
            return
        try:
            self.servidor = pyodbc.connect(DRIVER="ODBC Driver 17 for SQL Server",
                                        server=self.diccServidores.get(nombrePais),
                                        database=nombrePais,
                                        autocommit=True)
            self.cursorSQL = self.servidor.cursor()
        except Exception as e:
            print( e)
            print("Ha ocurrido un error al intentar conectarse al servidor:",nombrePais)

    #Pregunta si hay conexion al servidor
    def conexionViva(self):
        if self.servidor != None:
            return True
        return False

    #Cierra la conexion del servidor si es que esta conectado
    def cerrarConexionServidor(self):

        if self.cursorSQL!=None and self.servidor!=None:
            self.cursorSQL.close()
            self.servidor.close()

    def select(self, nombreProc, param):
        """
        Funcion: Retorna los resultados del procedimiento con los parametros ingresados
        Param:
            nombreProc(string): Procedimiento a ejecutar (ejm: exec nombProc ?, ?)
            param(tuple): Parametros que recibe el procedimiento (ejm: (param1, param2))
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario los resultados del procedimiento
        """
        try:
            #Llama al procedimiento con los parametros
            self.cursorSQL.execute(nombreProc, param)
            #Crea la lista de diccionarios con los resultado
            col_names = [x[0] for x in self.cursorSQL.description]
            rows = []
            for row in self.cursorSQL:
                rows.append(dict(zip(col_names, row)))
            return rows
        except TypeError:
            print("El procedimiento no devuelve ningun resultado")
        except Exception as e:
                print(e)
                print("Ha ocurrido un error al intentar llamar al procedimiento: ",nombreProc)

    def getIdUsuarioCliente(self,pCorreo):
        """
        Funcion: Retorna el idUsuarioCliente de un correo
        Param:
            pCorreo(string): Correo con el que se buscara el idUsuarioCliente
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario el idUsuarioCliente
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getUsuarioCliente
            return self.select("exec dbo.getUsuarioCliente ?", (pCorreo))
        except:
            #Si no encuentra el proc
            return None

    def getIdUsuarioEmpleado(self,pCorreo):
        """
        Funcion: Retorna el idUsuarioEmpleado de un correo
        Param:
            pCorreo(string): Correo con el que se buscara el idUsuarioEmpleado
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario el idUsuarioEmpleado
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getUsuarioEmpleado
            return self.select("exec dbo.getUsuarioEmpleado ?", (pCorreo))
        except:
            #Si no encuentra el proc
            return None

    def getIdCliente(self,pCorreo):
        """
        Funcion: Retorna el idCliente de un correo
        Param:
            pCorreo(string): Correo con el que se buscara el idCliente
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario el idCliente
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getCliente
            return self.select("exec dbo.getIdCliente ?", (pCorreo))
        except:
            #Si no encuentra el proc
            return None

    def getIdEmpleado(self,pCorreo):
        """
        Funcion: Retorna el idEmpleado de un correo
        Param:
            pCorreo(string): Correo con el que se buscara el idEmpleado
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario el idEmpleado
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getEmpleado
            return self.select("exec dbo.getIdEmpleado ?", (pCorreo))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None
  
    def getNombreProducto(self,pIdProducto):
        """
        Funcion: Retorna el nombre de un producto especifico
        Param:
            pIdProducto(int): Id producto el cual buscar
        Retorna:
            lista de diccionarios: Lista que contendra en el nombre del producto
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getEmpleado
            return self.select("exec dbo.getNombreProducto ?", (pIdProducto))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def getNombreProductoFoto(self,pIdFoto):
        """
        Funcion: Retorna el nombre de un producto especifico
        Param:
            pIdFoto(int): Id foto  del cual buscar
        Retorna:
            lista de diccionarios: lista de diccionarios: Lista que contendra en el nombre del producto
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getEmpleado
            return self.select("exec dbo.getNombreProductoFoto ?", (pIdFoto))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None
    
    def getSucursal(self,pNombrePais, pIdProvincia = None, pIdCanton = None, pIdDistrito = None):
        """
        Funcion: Retorna el idSucursal y nombreSucursal segun la ubicacion
        Param:
            pNombrePais(string): Id del Pais al que pertenece la sucursal
            pIdProvincia(int): Id de la Provincia al que pertenece la sucursal
            pIdCanton(int): Id del Canton al que pertenece la sucursal
            pIdDistrito(int): Id del Distrito al que pertenece la sucursal           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario las sucursales encontradas
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getCliente
            return self.select("exec dbo.getSucursal ?, ?, ?, ?", (pNombrePais, pIdProvincia, pIdCanton, pIdDistrito))
        except:
            #Si no encuentra el proc
            return None

    def getSucursales(self):
        """         
        Retorna:
            lista de diccionarios: Lista de los ids y nombres de las sucursales
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getCliente
            return self.select("select idSucursal, nombreSucursal from Sucursal;", ())
        except:
            #Si no encuentra el proc
            return None

    def getIdProveedor(self, pNombreProducto = None, pNombreProveedor = None, pIdPais = None,
    pIdProvincia = None, pIdCanton = None, pIdDistrito = None, pIdUbicacion = None):
        """
        Funcion: Retorna el id de un proveedor segun su informacion
        Param:
            pnombreProveedor(string): Nombre del proveedor
            pNombreProducto(string): Producto que vende el proveedor
            pIdPais(int): Id del Pais al que pertenece el proveedor
            pIdProvincia(int): Id de la Provincia al que pertenece el proveedor
            pIdCanton(int): Id del Canton al que pertenece el proveedor
            pIdDistrito(int): Id del Distrito al que pertenece el proveedor
            pIdUbicacion(int): Id de la Ubicacion al que pertenece el proveedor              
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario los id's de los proveedores
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getIdProveedores
            return self.select("exec dbo.getIdProveedores ?, ?, ?, ?, ?, ?",
            (pNombreProducto, pNombreProveedor, pIdPais, pIdProvincia, pIdCanton, pIdDistrito))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def getInfoProv(self, pIdProducto = None, pNombreProveedor = None, pIdPais = None,
    pIdProvincia = None, pIdCanton = None, pIdDistrito = None, pIdUbicacion = None):
        """
        Funcion: Retorna la informacion de un proveedor segun su informacion
        Param:
            pnombreProveedor(string): Nombre del proveedor
            pIdProducto(int): Producto que vende el proveedor
            pIdPais(int): Id del Pais al que pertenece el proveedor
            pIdProvincia(int): Id de la Provincia al que pertenece el proveedor
            pIdCanton(int): Id del Canton al que pertenece el proveedor
            pIdDistrito(int): Id del Distrito al que pertenece el proveedor
            pIdUbicacion(int): Id de la Ubicacion al que pertenece el proveedor            
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion del proveedor
        """
        try:
            #Obtenemos los id's de los proveedores
            ids = self.getIdProveedor(pIdProducto, pNombreProveedor, pIdPais, pIdProvincia,
                                    pIdCanton, pIdDistrito, pIdUbicacion)

            #No encontramos proveedores
            if ids==None or len(ids) == 0:
                return None
            info = []

            #Nos conectamos con la base de los proveedores
            pgConnection = ConexionServidorPG()
            pgConnection.conectarServidor()

            #Recorremos los ids conseguidos
            for idP in ids:
                #Llama a readProveedor para conseguir la informacion de un proveedor
                # segun su id
                info += pgConnection.readProveedor(idP.get('idProveedor'))

            #Retorna la informacion de los proveedores encontrados
            return info
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None    

    def getCantInventario(self, pIdProducto = None, pIdSucursal = None):
        """
        Funcion: Retorna la informacion de la cantidad de productos del inventario de una sucursal
        Param:
            pIdProducto(int): Id del producto en inventario a mostrar la cantidad
            pIdSucursal(int): Id de la sucursal a la que pertenece el inventario       
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de la cantidad de productos en un inventario
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getCantidadInventario
            return self.select("exec dbo.getCantidadInventario ?, ?", (pIdProducto, pIdSucursal))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None    

    def setCliente(self,pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento, pCorreo, pCelular):
            """
            Funcion: Inserta un Cliente
            Param:
                pNombre(string)= Nombre del Cliente
                pApellido1(string)= Primer apellido del Cliente
                pApellido2(string)= Segundo apellido del Cliente
                pCedula(int)= Cedula del Cliente
                pFechaNacimiento(string)= FechaNacimiento del Cliente
                pCorreo(string)= Correo del Cliente
                pCelular(string)= Celular del Cliente
            Retorna:
                True: Si se pudo realizar el insert
                False: No se pudo realizar el insert
            """
            try:
                #Inserta el Cliente por medio del CRUDCliente
                self.cursorSQL.execute('exec dbo.CRUDcliente ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
                (0, None, 2, pCedula, pNombre, pApellido1, pApellido2, pFechaNacimiento, pCorreo, pCelular))
                return True #Se pudo insertar el Cliente
            except Exception as e:
                #Si no encuentra el proc
                return False

    def setUsuarioCliente(self,pIdCliente, pContrasenna):
        """
        Funcion: Inserta un usuarioCliente
        Param:
            pContrasenna(string)= Contrasenna del UsuarioCliente
            pIdCliente(int)= id del cliente al que pertenece el usuarioCliente
        Retorna:
            True: Si se pudo realizar el insert
            False: No se pudo realizar el insert
        """
        try:
            #Inserta el Cliente por medio del CRUDCliente
            self.cursorSQL.execute('exec dbo.CRUDUsuarioCliente ?, ?, ?, ?',
                                (0,None, pIdCliente, pContrasenna))
            return True #Se pudo insertar el Cliente
        except:
            #Si no encuentra el proc
            return False

    def setUsuarioEmpleado(self,pIdEmpleado, pContrasenna):
        """
        Funcion: Inserta un usuarioEmpleado
        Param:
            pContrasenna(string)= Contrasenna del UsuarioEmpleado
            pIdEmpleado(int)= id del Empleado al que pertenece el usuarioEmpleado
        Retorna:
            True: Si se pudo realizar el insert
            False: No se pudo realizar el insert
        """
        try:
            #Inserta el Empleado por medio del CRUDEmpleado
            self.cursorSQL.execute('exec dbo.CRUDUsuarioEmpleado ?, ?, ?, ?',
                                (0,None, pIdEmpleado, pContrasenna))
            return True #Se pudo insertar el Empleado
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return False

    def validarContrasennaCliente(self,pContrasenna, pCorreo):
        """
        Funcion: Valida si la contrasenna concuerda con el correo registrado de un UsuarioCliente
        Param:
            pContrasenna(string): Contrasenna para comparar el usuario registrado con su correo
            pCorreo(string): Correo para comparar el usuario registrado con su contrasenna
        Retorna:
            True: Si el correo y la contrasenna concuerdan con algun usuario registrado
            False: Si el correo y la contrasenna no concuerdan con algun usuario registrado
        """
        if (pContrasenna == None or pCorreo==None):
            print('pContrasena o pCorreo es None')
            return False

        #Buscamos id del Usuariocliente que haya sido registrado con el correo
        ids = self.getIdUsuarioCliente(pCorreo)

        if ids==None:
            return False
        
        #Si no se retorna ningun id significa que el correo no fue registrado
        if len(ids) == 0:
            return False
        #Recorremos los ids conseguidos
        for idUsuario in ids:
            #Llama al procedimiento para conseguir la informacion de un UsuarioCliente
            # segun su id
            usuarios = self.select('exec dbo.CRUDUsuarioCliente ?, ?, ?, ?',
                                    (1,idUsuario.get('idUsuarioCliente'), None, None))
            #Recorremos los UsuarioClientes conseguidos
            
            for usuario in usuarios:
                #Comparamos las contrasennas de los UsuarioClientes con el parametro
                if usuario.get('contrasenna') == pContrasenna:
                    #Si coincidio la contrasenna con el parametro
                    return True
        #Ninguna contrasenna coincidio con el correo de algun UsuarioCliente
        return False

    def validarContrasennaEmpleado(self,pContrasenna, pCorreo):
        """
        Funcion: Valida si la contrasenna concuerda con el correo registrado de un UsuarioEmpleado
        Param:
            pContrasenna(string): Contrasenna para comparar el usuario registrado con su correo
            pCorreo(string): Correo para comparar el usuario registrado con su contrasenna
        Retorna:
            True: Si el correo y la contrasenna concuerdan con algun usuario registrado
            False: Si el correo y la contrasenna no concuerdan con algun usuario registrado
        """
        if (pContrasenna == None or pCorreo==None):
            print('pContrasena o pCorreo es None')
            return False

        #Buscamos id del UsuarioEmpleado que haya sido registrado con el correo
        ids = self.getIdUsuarioEmpleado(pCorreo)
        admins=[]
        try:
            #Trae administradores
            admins = self.select('exec dbo.validarAdministrador',())
            
        except Exception as e:
            return False

        if ids==None:
            return False

        #Si no se retorna ningun id significa que el correo no fue registrado
        if len(ids) == 0:
            return False

        idsAdmins = [(x.get('idAdministrador')) for x in admins] #Toma los ids de los administradores de todas las sucursales del pais.
        if ids[0].get('idUsuarioEmpleado') not in idsAdmins:#Si quien inicia sesion no es un admin retorna False
            return False

        #Recorremos los ids conseguidos
        for idUsuario in ids:
            #Llama al procedimiento para conseguir la informacion de un UsuarioEmpleado
            # segun su id
            usuarios = self.select('exec dbo.CRUDUsuarioEmpleado ?, ?, ?, ?',
                                    (1,idUsuario.get('idUsuarioEmpleado'), None, None))
            #Recorremos los UsuarioEmpleados conseguidos
            
            for usuario in usuarios:
                #Comparamos las contrasennas de los UsuarioEmpleados con el parametro
                if usuario.get('contrasenna') == pContrasenna:
                    #Si coincidio la contrasenna con el parametro
                    return True
        #Ninguna contrasenna coincidio con el correo de algun UsuarioEmpleado
        return False

    def validarCorreoClienteRegistrado(self,pCorreo):
        """
        Funcion: Valida si el correo del Cliente se encuentra registrado
        Param:
            pCorreo(string): Correo a validar si ya fue registrado
        Retorna:
            True: Si el correo ya esta registrado
            False: Si el correo no esta registrado
        """
        if (pCorreo==None):
            print('pContrasena o pCorreo es None')
            return False

        #Buscamos id del cliente que haya sido registrado con el correo
        ids = self.getIdCliente(pCorreo)

        if ids==None or len(ids) == 0:
            return False #No existe un idCliente que pertenezca a ese correo
        
        #Si se encuentra al menos un idCliente que pertenezca a ese correo
        return True

    def validarCorreoEmpleadoRegistrado(self,pCorreo):
        """
        Funcion: Valida si el correo del Empleado se encuentra registrado
        Param:
            pCorreo(string): Correo a validar si ya fue registrado
        Retorna:
            True: Si el correo ya esta registrado
            False: Si el correo no esta registrado
        """
        if (pCorreo==None):
            print('pContrasena o pCorreo es None')
            return False

        #Buscamos id del Empleado que haya sido registrado con el correo
        ids = self.getIdEmpleado(pCorreo)

        if ids==None or len(ids) == 0:
            return False #No existe un idEmpleado que pertenezca a ese correo
        
        #Si se encuentra al menos un idEmpleado que pertenezca a ese correo
        return True

    def validarInsertarCuentaCliente(self,pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento,
                            pCorreo, pCelular, pContrasenna):
        """
        Funcion: Valida que los parametros sean correctos para insertar un UsuarioCliente
        Param:
            pNombre(string)= Nombre del UsuarioCliente
            pApellido1(string)= Primer apellido del UsuarioCliente
            pApellido2(string)= Segundo apellido del UsuarioCliente
            pCedula(int)= Cedula del UsuarioCliente
            pFechaNacimiento(string)= FechaNacimiento del UsuarioCliente
            pCorreo(string)= Correo del UsuarioCliente
            pCelular(string)= Celular del UsuarioCliente
            pContrasenna(string)= Contrasenna del UsuarioCliente
        Retorna:
            True: Si los parametros son correctos
            False: Si los parametros no son correctos
        """
        #Validar que los parametros esten completos
        if (pNombre==None or pApellido1==None or pApellido2==None or pCedula==None
            or pFechaNacimiento==None or pCorreo==None or pCelular==None or pContrasenna==None):
            print('Parametros incompletos')
            return False
        #Validar que los tipos de los parametros sean los correctos
        if (type(pNombre)!=str or type(pApellido1)!=str or type(pApellido2)!=str or 
            type(pCedula)!=int or type(pFechaNacimiento)!=str or type(pCorreo)!=str or
            type(pCelular)!=str or type(pContrasenna)!=str):
            print('Los tipos de los parametros son incorrectos')
            return False
        #Validar que el largo de los parametros sean los correctos
        if (len(pNombre)>50 or len(pApellido1)>50 or len(pApellido2)>50 or 
            len(pFechaNacimiento)>2**64-1 or len(pCorreo)>50 or len(pCelular)>20 or
            pCedula > 2**64-1 or len(pContrasenna)>30):
            print('Los parametros son muy largos como para ser almacenados')
            return False
        #Ya existe un UsuarioCliente con ese Correo
        if (self.validarCorreoClienteRegistrado(pCorreo)):
            print('El correo se encuentra actualmente registrado')
            return False
        return True

    def validarInsertarCuentaEmpleado(self,pIdPuesto, pIdSucursal, pNombre, pApellido1, pApellido2, pCedula,
                    pFechaContratacion, pFechaNacimiento, pCorreo, pFoto, pContrasenna):
        """
        Funcion: Valida que los parametros sean correctos para insertar un UsuarioEmpleado
        Param:
            pIdPuesto(int) = Id del puesto del Empleado
            pIdSucursal(int) = Id de la sucursal del Empleado
            pNombre(string)= Nombre del Empleado
            pApellido1(string)= Primer apellido del Empleado
            pApellido2(string)= Segundo apellido del Empleado
            pCedula(int)= Cedula del Empleado
            pFechaContratacion(string)= FechaContratacion del Empleado
            pFechaNacimiento(string)= FechaNacimiento del Empleado
            pCorreo(string)= Correo del Empleado
            pFoto(string)= Foto del Empleado
            pContrasenna(string)= Contrasenna del UsuarioEmpleado
        Retorna:
            True: Si los parametros son correctos
            False: Si los parametros no son correctos
        """
        #Validar que los parametros esten completos
        if (pIdPuesto == None or pIdSucursal == None or pNombre==None or
            pApellido1==None or pApellido2==None or pCedula==None or
            pFechaContratacion==None or pFechaNacimiento==None or
            pCorreo==None or pFoto==None or pContrasenna==None):
            print('Parametros incompletos')
            return False
        #Validar que los tipos de los parametros sean los correctos
        if (type(pIdPuesto)!=int or type(pIdSucursal)!=int or type(pNombre)!=str or
            type(pApellido1)!=str or type(pApellido2)!=str or type(pCedula)!=int or
            type(pFechaNacimiento)!=str or type(pFechaNacimiento)!=str or
            type(pCorreo)!=str or type(pFoto)!=str or type(pContrasenna)!=str):
            print('Los tipos de los parametros son incorrectos')
            return False
        #Validar que el largo de los parametros sean los correctos
        if (pIdPuesto>2**34-1 or pIdSucursal>2**34 or len(pNombre)>100 or
            len(pApellido1)>100 or len(pApellido2)>100 or pCedula>2**64-1 or
            len(pFechaNacimiento)>2**64-1 or len(pFechaNacimiento)>2**64-1 or
            len(pCorreo)>50 or len(pContrasenna)>30):
            print('Los parametros son muy largos como para ser almacenados')
            return False
        #Ya existe un UsuarioEmpleado con ese Correo
        if (self.validarCorreoEmpleadoRegistrado(pCorreo)):
            print('El correo se encuentra actualmente registrado')
            return False
        return True

    def validarIdFactura(self, pIdFactura):
        """
        Funcion: Valida que la factura exista
        Param:
            pIdFactura(int)= Id de la factura
        Retorna:
            True: Si la factura con IdFactura existe
            False: Si la factura con IdFactura no existe
        """
        try:
            #Conseguimos la cantidad de facturas con pIdFactura
            cant = self.select('select count(IdFactura) as cantidad from Factura where idFactura = ?',
                                (pIdFactura))
            if (cant[0].get('cantidad') <=0):
                return False #No existe 
            return True #Si existe 
        except Exception as e:
            return False

    def insertarCuentaCliente(self,pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento,
                            pCorreo, pCelular, pContrasenna):
        """
        Funcion: Inserta un Cliente y su respectivo Usuariocliente a la base de datos
        Param:
            pNombre(string)= Nombre del UsuarioCliente
            pApellido1(string)= Primer apellido del UsuarioCliente
            pApellido2(string)= Segundo apellido del UsuarioCliente
            pCedula(int)= Cedula del UsuarioCliente
            pFechaNacimiento(string)= FechaNacimiento del UsuarioCliente
            pCorreo(string)= Correo del UsuarioCliente
            pCelular(string)= Celular del UsuarioCliente
            pContrasenna(string)= Contrasenna del UsuarioCliente
        Retorna:
            True: Si el Cliente y UsuarioCliente pudieron ser registrados
            False: Si el Cliente y UsuarioCliente no pudieron ser registrados
        """
        if (not self.validarInsertarCuentaCliente(pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento,
                            pCorreo, pCelular, pContrasenna)):
            return False #La cuenta no puede ser registrada porque los parametros son incorrectos
        
        #Insertamos el cliente
        if (not self.setCliente(pNombre, pApellido1, pApellido2, pCedula, pFechaNacimiento, pCorreo, pCelular)):
            return False #No se pudo insertar el cliente
        
        #Buscamos id del cliente que ingresamos con pCorreo
        idC = self.getIdCliente(pCorreo)
        if idC==None or len(idC) == 0:
            return False #No existe un idCliente que pertenezca a ese correo
        
        #Insertamos el usuarioCliente
        if (not self.setUsuarioCliente(idC[0].get('idCliente'), pContrasenna)):
            return False #No se pudo insertar el cliente

        #Se pudo realizar los inserts del Cliente y UsuarioCliente
        return True

    def insertarCuentaEmpleado(self,pIdPuesto, pIdSucursal, pNombre, pApellido1, pApellido2, pCedula,
                    pFechaContratacion, pFechaNacimiento, pCorreo, pFoto, pContrasenna):
        """
        Funcion: Inserta un Empleado y su respectivo UsuarioEmpleado a la base de datos
        Param:
            pIdPuesto(int) = Id del puesto del Empleado
            pIdSucursal(int) = Id de la sucursal del Empleado
            pNombre(string)= Nombre del Empleado
            pApellido1(string)= Primer apellido del Empleado
            pApellido2(string)= Segundo apellido del Empleado
            pCedula(int)= Cedula del Empleado
            pFechaContratacion(string)= FechaContratacion del Empleado
            pFechaNacimiento(string)= FechaNacimiento del Empleado
            pCorreo(string)= Correo del Empleado
            pFoto(string)= Foto del Empleado
            pContrasenna(string)= Contrasenna del UsuarioEmpleado
        Retorna:
            True: Si el Empleado y UsuarioEmpleado pudieron ser registrados
            False: Si el Empleado y UsuarioEmpleado no pudieron ser registrados
        """
        if (not self.validarInsertarCuentaEmpleado(pIdPuesto, pIdSucursal, pNombre, pApellido1, pApellido2, pCedula,
                    pFechaContratacion, pFechaNacimiento, pCorreo, pFoto, pContrasenna)):
            return False #La cuenta no puede ser registrada porque los parametros son incorrectos
        
        #Insertamos el Empleado
        if (not self.setEmpleado(pIdPuesto, pIdSucursal, pNombre, pApellido1, pApellido2, pCedula,
                    pFechaContratacion, pFechaNacimiento, pCorreo, pFoto)):
            return False #No se pudo insertar el Empleado
        
        #Buscamos id del Empleado que ingresamos con pCorreo
        idE = self.getIdEmpleado(pCorreo)
        if idE==None or len(idE) == 0:
            return False #No existe un idEmpleado que pertenezca a ese correo
        
        #Insertamos el usuarioEmpleado
        if (not self.setUsuarioEmpleado(idE[0].get('idEmpleado'), pContrasenna)):

            return False #No se pudo insertar el Empleado

        #Se pudo realizar los inserts del Empleado y UsuarioEmpleado
        return True

    def facturar(self, pIdFactura):
        """
        Funcion: Realiza la facturacion de una compra
        Param:
            pIdFactura(int)= Id de la factura
        Retorna:
            True: Si se pudo realizar la facturación
            False: Si no se pudo realizar la facturación
        """
        if (not self.validarIdFactura(pIdFactura)):
            return False #No existe factura con pIdFactura
        try:
            #Llamamos al proceso de facturar
            self.cursorSQL.execute('exec Facturar ?', (pIdFactura))
            return True #Si se realizo la facturacion
        except Exception as e:
            print(e)
            return False

    def catalogoProv(self, pIdProducto = None, pIdProveedor = None):
        """
        Funcion: Retorna la informacion de los productos y proveedores
        Param:
            pIdProveedor(int): Id del proveedor
            pIdProducto(int): id del Producto que vende el proveedor          
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los productos y proveedores
        """
        try:
            if ((pIdProducto != None and type(pIdProducto) != int)
            or (pIdProveedor != None and type(pIdProveedor) != int)):
                print('Parametros incorrectos')
                return None

            #Retorna los resultados conseguidos del procedimiento getCatalogoProv
            return self.select("exec dbo.getCatalogoProv ?, ?", (pIdProveedor, pIdProducto))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def buscarProveedores(self, pIdProducto = None, pNombreProveedor = None, pIdPais = None,
    pIdProvincia = None, pIdCanton = None, pIdDistrito = None, pIdUbicacion = None):
        """
        Funcion: Retorna el id de un proveedor segun su informacion
        Param:
            pnombreProveedor(string): Nombre del proveedor
            pIdProducto(int): Producto que vende el proveedor
            pIdPais(int): Id del Pais al que pertenece el proveedor
            pIdProvincia(int): Id de la Provincia al que pertenece el proveedor
            pIdCanton(int): Id del Canton al que pertenece el proveedor
            pIdDistrito(int): Id del Distrito al que pertenece el proveedor
            pIdUbicacion(int): Id de la Ubicacion al que pertenece el proveedor              
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario los id's de los proveedores
        """
        try:
            #Retorna los resultados conseguidos del procedimiento getIdProveedores
            prov = self.getInfoProv(pIdProducto, pNombreProveedor, pIdPais, pIdProvincia, pIdCanton, pIdDistrito, pIdUbicacion)
            result = []
            for x in prov:
                result += [{'idProveedor':x['_outidproveedor'], 'nombreProveedor':x['_outnombreproveedor'],
                'celular':x['_outcelular'], 'correo':x['_outcorreo'],'productos':self.catalogoProv(pIdProveedor = x['_outidproveedor'])}]
                # result += [x['productos'] = catalogoProv(x['idProveedor'])]
            return result
            
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None


    def getGananciasNetas (self, fechaInicio, fechaFinal, idPais, idSucursal, idCategoria):
        '''
        Funcion: Obtiene las ganancias netas
        Param:
            fechaInicio(date) = fecha inicial del rango
            fechaFinal(date) = fecha final del rango
            idPais(int)= id del pais
            idSucursal(int)= id de la sucursal
            idCategoria(int)= id de la categoria
        Retorna:
            Las ganancias netas obtenidas, pueden filtrarse por categoria, sucursal, pais y rango de fechas.
        '''
        try:
            #Retorna los resultados conseguidos del procedimiento getGananciasNetas
            return self.select("exec dbo.getGananciasNetas ?, ?, ?, ?, ?", (fechaInicio, fechaFinal, idPais, idSucursal, idCategoria))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def reporteProductos(self, pIdPais = None, pIdProducto = None,
        pIdSucursal = None, pIdProveedor = None, pFechaInc = None, pFechaFin = None):
        """
        Funcion: Retorna el reporte de los productos mas vendidos
        Param:
            pIdPais(int): Id del Pais al que pertenece la sucursal
            pIdProducto(int): Id del producto del reporte
            pIdSucursal(int): Id de la sucursal a la que pertenece el producto vendido
            pIdProveedor(int): Id del proveedor al que pertenece el producto
            pFechaInc(string): Limite inicial en que se vendio el producto            
            pFechaFin(string): Limite final en que se vendio el producto            
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los productos mas vendidos
        """
        try:
            #Retorna los resultados conseguidos del procedimiento ReportesProductos
            return self.select("exec dbo.ReportesProductos ?, ?, ?, ?, ?, ?", (pIdPais, pIdProducto, pIdSucursal, pIdProveedor, pFechaInc, pFechaFin))
        except:
            #Si no encuentra el proc
            return None
    
    def reporteClientes(self, pIdPais = None, pIdProducto = None,
        pIdSucursal = None, pIdProveedor = None, pFechaInc = None, pFechaFin = None):
        """
        Funcion: Retorna el reporte de los clientes
        Param:
            pIdPais(int): Id del Pais al que pertenece la sucursal
            pIdProducto(int): Id del producto que compro el cliente
            pIdSucursal(int): Id de la sucursal a la que pertenece el producto comprado
            pIdProveedor(int): Id del proveedor al que pertenece el producto comprado
            pFechaInc(string): Limite inicial en que se vendio el producto            
            pFechaFin(string): Limite final en que se vendio el producto            
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los clientes
        """
        try:
            #Retorna los resultados conseguidos del procedimiento ReportesClientes
            return self.select("exec dbo.ReportesClientes ?, ?, ?, ?, ?, ?", (pIdPais, pIdProducto, pIdSucursal, pIdProveedor, pFechaInc, pFechaFin))
        except:
            #Si no encuentra el proc
            return None

    def reporteVencimientos(self, pIdPais = None, pIdProducto = None,
        pIdSucursal = None, pIdProveedor = None, pFechaInc = None, pFechaFin = None):
        """
        Funcion: Retorna el reporte de los productos vencidos
        Param:
            pIdPais(int): Id del Pais al que pertenece la sucursal
            pIdProducto(int): Id del producto del reporte
            pIdSucursal(int): Id de la sucursal a la que pertenece el producto vencido
            pIdProveedor(int): Id del proveedor al que pertenece el producto
            pFechaInc(string): Limite inicial en que se vendio el producto            
            pFechaFin(string): Limite final en que se vendio el producto            
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los productos vencidos
        """
        try:
            #Retorna los resultados conseguidos del procedimiento ReportesVencimientos
            return self.select("exec dbo.ReportesVencimientos ?, ?, ?, ?, ?, ?", (pIdPais, pIdProducto, pIdSucursal, pIdProveedor, pFechaInc, pFechaFin))
        except:
            #Si no encuentra el proc
            return None
  
    def ponerProductoEnDescuento (self, porcentaje):
        '''
        Funcion: Pone un producto en descuento 
        Param:
            idLote(int) = id del lote del producto
            porcentaje(float) = porcentaje de descuento 
        '''
        try:
            #Pone los productos correspondientes al lote en descuento

            # lotes = self.cursorSQL.execute("select LoteProducto.idLote from LoteProducto inner join Unidad on Unidad.idLote = LoteProducto.idLote where DATEDIFF(day, getdate(), fechaExpiracion) < 0 and Unidad.idEstado != 4").fetchall()
            # for idLote in lotes:
            #     self.select("exec dbo.sacarDeExhibidor ?", (idLote))


            lotes = self.cursorSQL.execute("SELECT DISTINCT LoteProducto.idLote from LoteProducto inner join Unidad on Unidad.idLote = LoteProducto.idLote where DATEDIFF(week, getdate(), fechaExpiracion) < 1 and Unidad.idEstado = 3").fetchall()
            print(lotes)
            for idLote in lotes:#[dbo].[ponerProductoEnDescuento]
                self.select("exec dbo.ponerProductoEnDescuento ?, ?", (idLote[0], porcentaje))
            return len(lotes)
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def consultarSupermercado(self,latitudUbicacionCliente,longitudUbicacionCliente):
        """
            Metodo para obtener si una sucursal esta abierta, horario, nombre administrador,
            y distancia desde donde se consulta.=
            Parametros:
                idSupermercado int: Id del supermercado al que se quiere consultar.
                ubicacionCliente: Ubicacion desde donde consulta el cliente (para sacar la distancia a la sucursal).

        """
        if not latitudUbicacionCliente or not longitudUbicacionCliente:
            return None
      
        infoSucursales=None
        
        retornar=[]#Donde se guarda toda la informacion recolectada. Lista de diccionarios
        
        try:
            self.cursorSQL.execute("exec dbo.consultarInfoSucursales")
            #Guarda info de sucursales
            infoSucursales = self.cursorSQL.fetchall()
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None
        #Recorre las filas de la info de la sucursal para ir a traer otra info necesaria.
        for fila in infoSucursales:
            #Recorre cada info de sucursal, y guarda toda la info necesaria.
            #Viene sucia (dificil de mostrar en la interfaz grafica).
            retornar.append({
                "nombreSucursal": fila[4],#Guarda nombre
                "idSucursal":fila[0],#Guarda id sucursal
                "horario":self.getHorarioSucursal(fila[0]),#Guarda el horario en listas de diccionarios
                "administrador":self.getInfoAdministradorSucursal(fila[3]),
                "distancia":self.getDistanciaClienteSucursales(latitudUbicacionCliente,longitudUbicacionCliente,fila[1],fila[2])
                })
        return self.limpiarInformacionConsultaSucursal(retornar)

    def limpiarInformacionConsultaSucursal(self,informacion):
        """
            Metodo para meter si en cada sucursal el campo para saber si esta abierto o cerrado.
            Parametros:
                informacion [{}]
            Retorna: 
                    [{}]    
            [{'nombreSucursal': value, 'idSucursal': value, 'horario': 'value', 
            'administrador': {'nombreEmpleado': value, 'apellido1': value, 'correo': value}, 
            'distancia': value, 'abiertoCerrado': value}]
        """
        infoLimpia=[]
        dias ={'Monday':'L','Tuesday':"K","Wednesday":'M',"Thursday":'J',"Friday":'V','Saturday':'S','Sunday':'D'}
        dia = dias.get(calendar.day_name[date.today().weekday()])#Saca la primera letra del dia para comparar si la sucursal esta abierta.
        abierto='Cerrado'
        horarioBonito = ''
        admin = {}
        for sucursal in informacion:#Recorre los horarios (si tiene asignados)
            horarioBonito =  ''#Reinicia el arreglo
            if len(sucursal.get('horario'))!=0:#Si tiene horario
                for horario in sucursal.get('horario'):#Recorre el horario
                    horarioBonito =horarioBonito+''+ horario.get('dia') + ": De " +horario.get('horaApertura').strftime("%H:%M") + " a " +horario.get('horaCierre').strftime("%H:%M")+','
                    if horario.get('dia')==dia and ( horario.get('horaApertura') <= datetime.now().time() <= horario.get('horaCierre')):
                        abierto =  'Abierto'   
            else:#Si no tiene horario
                horarioBonito = 'Aún no hay horario disponible.'#Apunta guarda info de que no hay horario
            horarioBonito=horarioBonito[:-1]
            if len(sucursal.get('administrador'))!=0:#Si hay admin, lo saca de la lista en la que esta metido
                admin = sucursal.get('administrador')[0]
            sucAux = sucursal#Copia la info de sucursal porque nose puede modificar al ser el iterador del ciclo.
            if sucAux.get('distancia')==None:
                sucAux['distancia']='No se ha podido calcular la distancia.'#Cambia None por este texto
            #Guarda cambios
            sucAux['horario'] = horarioBonito
            sucAux['abiertoCerrado']=abierto
            sucAux['administrador'] = admin
            infoLimpia.append(sucAux)#Guarda en el arreglo limpio la sucursal con el campo para saber si esta abierto o cerrado.
            abierto='Cerrado'#Reinicia la bandera para ver si esta abierto o cerrado
        return infoLimpia 

    def getDistanciaClienteSucursales(self,latCli,lngCli,latSuc,longSuc):
        """
            Metodo para obtener la distancia entre el cliente y la sucursal.

            Parametros:
                latCli float: Latitud de la ubicacion del cliente.
                lngCli float: Longitud de la ubicacion del cliente.
                latSuc float: Latitud de la ubicacion de la sucursal.
                longSuc float: Longitud de la ubicacion de la sucursal.
                
            Return: [{'kilometros':value}]
                    
        """
        try:            
            return self.select("exec dbo.calcularDistanciaEntrePuntos ?, ?, ?, ?", (latCli,lngCli,latSuc,longSuc))

        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def getInfoAdministradorSucursal(self,idAdmin):
        """
            Metodo para obtener informacion del empleado administrador de la sucursal.
            Parametros:
                idAdmin int: id del administrador.
            Return: Diccionario con datos.
                {'nombre':value,'apellido1':value,'correo':value}
        """
        try:            
            return self.select("exec dbo.consultarEmpleadoAdmin ?", (idAdmin))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def getHorarioSucursal(self,idSucursal):
        """
            Metodo para obtener el horario de una sucursal.
            Parametros:
                idSucural int: id de la sucursal a las uqe se le consultara los horarios.
            Return: Lista de diccionarios.
                [{'dia':value,'horaCierre':value,'horaApertura':value}].
        """
        try:            
            return self.select("exec dbo.consultarHorariosXSucursal ?", (idSucursal))

        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def sacarDeExhibidor (self):
        '''
        Funcion: Saca los produtos vencidos
        Param:
            idLote(int) = id del lote del producto
        '''
        try:
            #Pone los productos correspondientes en estado de vencido
            lotes = self.cursorSQL.execute("select DISTINCT LoteProducto.idLote from LoteProducto inner join Unidad on Unidad.idLote = LoteProducto.idLote where DATEDIFF(day, getdate(), fechaExpiracion) < 0 and (Unidad.idEstado = 3 or Unidad.idEstado = 10)").fetchall()
            for idLote in lotes:
                self.select("exec dbo.sacarDeExhibidor ?", (idLote))
            return len(lotes)
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def getSucursalCercanaExistencias(self, lat,lon, idProducto):
        '''
        Funcion: Determina la sucursal más cercana con respecto a una ubicación dada, y con existencias del producto dado
        Param:
            idLote(int) = id del lote del producto
        '''
        try:
            #Pone los productos correspondientes en estado de vencido
            return self.select("exec dbo.sucursalExistenciasMasCercana ?, ?, ?", (lat,lon, idProducto))
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

    def existeUbicacion(self, idUbicacion):
        '''
        Funcion: Determina si existe un idUbicacion
        Param:
            idUbicacion(int) = id de la ubicacion
        '''
        try:
            #Retorna 1 si existe el idUbicacion, de lo contrario retorna 0
            result = self.cursorSQL.execute("Select count(idUbicacion) from Ubicacion where idUbicacion = ?" , idUbicacion).fetchone()
            return result[0]
        except Exception as e:
            print(e)
            return None

    def existeProducto(self, idProducto):
        '''
        Funcion: Determina si existe un idProducto
        Param:
            idProducto(int) = id de la Producto
        '''
        try:
            #Retorna 1 si existe el idUbicacion, de lo contrario retorna 0
            result = self.cursorSQL.execute("Select count(idProducto) from Producto where idProducto = ?" , idProducto).fetchone()
            return result[0]
        except Exception as e:
            print(e)
            return None

    def obtenerDirectorioEmpleado(self):
        """
        Funcion: Crear una carpeta dentro de la carpeta Imagenes 
        Param:
            pNombreCarpeta(str): Nombre de la carpta donde se guadara la carpte
            pNombreArchivo(str): Nombre de como se llamara la carpeta
        Retorna:
            path: La ruta de la carpeta creada
            None: si pasa algun error o no se pudo crear 
        """
        try:
            ruta=os.getcwd()
            path = Path(ruta,"Fotos Empleados")
            path.mkdir(parents=True, exist_ok=True)
            return path
    
        except Exception as e:
                    #Si no encuentra el proc
                print(e)
                return None

    def readEmpleado(self, idEmpleado):
        try:
            dirFoto=self.getFotoEmpleado(idEmpleado) #Tomamos la direccion donde se saco la imagen
            dic=self.select('exec dbo.CRUDempleado ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
            (1, idEmpleado,None, None, None, None, None, None, None, None, None, None, None))
            dic[0]["foto"]=dirFoto #Le metemos en el diccionario la foto
            return dic
        except Exception as e:
            print(e)
            return None

    def readEmpleadoG(self, idEmpleado):
        try:
          
            dic=self.select('exec dbo.CRUDempleado ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
            (1, idEmpleado,None, None, None, None, None, None, None, None, None, None, None))
            return dic
        except Exception as e:
            print(e)
            return None
    #CRUDS
    def getCategorias(self):
        """
        Funcion: Retorna el idCategoria y nombre     
        """
        try:
            return self.select("select idCategoria, nombre from categoria", ())
        except:
            #Si no encuentra el proc
            return None

    def getPuesto(self):
        """
        Funcion: Retorna el idPuesto y nombre     
        """
        try:
            return self.select("select idPuesto, nombrePuesto from Puesto", ())
        except:
            #Si no encuentra el proc
            return None

    def otorgarBono(self):
        '''
        Funcion: Otorga bonos a los empleados
        Param:
        Return:
            True: Si se pudo otorgar los bonos
            False: Si no se pudo otorgar los bonos
        '''
        try:
            #Pone los productos correspondientes en estado de vencido
            self.cursorSQL.execute("exec dbo.OtorgarBono")
            return True
        except Exception as e:
            print(e)
            return False #No pudo realizar el proceso
    
    def getInfoBono(self, pIdEmpleado = None, pFechaInicio = None, pFechaFin = None, pIdSucursal = None, pIdPais = None):
        """
        Funcion: Retorna la informacion de un proveedor segun su informacion
        Param:
            pnombreProveedor(string): Nombre del proveedor
            pNombreProducto(string): Producto que vende el proveedor
            pIdPais(int): Id del Pais al que pertenece el proveedor
            pIdProvincia(int): Id de la Provincia al que pertenece el proveedor
            pIdCanton(int): Id del Canton al que pertenece el proveedor
            pIdDistrito(int): Id del Distrito al que pertenece el proveedor
            pIdUbicacion(int): Id de la Ubicacion al que pertenece el proveedor            
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion del proveedor
        """
        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            return self.select('exec ObtenerInfoBono ?, ?, ?, ?, ?',
                                (pIdEmpleado, pFechaInicio, pFechaFin, pIdSucursal, pIdPais))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None

    def getProductos(self):
        """
        Funcion: Retorna la informacion de todos los productos
        Param:           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los productos
        """
        try:
            return self.select("select * from producto", ())
        except:
            #Si no encuentra el proc
            return None

    def getProveedor(self):
        """
        Funcion: Retorna la informacion de todos los proveedores
        Param:           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los proveedores
        """
        try:
            return self.select("select * from [POSTGRESQL].[Proveedores].[dbo].[proveedor]", ())
        except:
            #Si no encuentra el proc
            return None

    def getPaises(self):
        """
        Funcion: Retorna la informacion de todas los Paises
        Param:           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de las paises
        """
        try:
            return self.select("select * from pais", ())
        except:
            #Si no encuentra el proc
            return None

    def getProvincias(self, idPais = None):
        """
        Funcion: Retorna la informacion de todas los Provincias
        Param:
            idPais(int):Pais de donde proviene la provincia           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de las provincias
        """
        try:
            return self.select("select * from provincia where idPais = isnull(?, idPais)", (idPais))
        except:
            #Si no encuentra el proc
            return None

    def getCantones(self, idProvincia = None):
        """
        Funcion: Retorna la informacion de todos los cantones
        Param:
            idProvincia(int):Provincia de donde proviene el canton          
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los cantones
        """
        try:
            return self.select("select * from canton where idProvincia = isnull(?, idProvincia)", (idProvincia))
        except:
            #Si no encuentra el proc
            return None

    def getDistritos(self, idCanton = None):
        """
        Funcion: Retorna la informacion de todos los Distritos
        Param:
            idCanton(int):Canton de donde proviene el distrito           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de los Distritos
        """
        try:
            return self.select("select * from distrito where idCanton = isnull(?, idCanton)", (idCanton))
        except:
            #Si no encuentra el proc
            return None

    def getInfoCompra(self, pIdFactura):
        """
        Funcion: Retorna la informacion de una compra segun el idFactura
        Param:
            pIdFactura(int): Id de la factura de la compra           
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario la informacion de la compra
        """
        try:
            resultados = {}
            resultados['detalle'] = self.select("exec getInfoDetalle ?", (pIdFactura))
            resultados['envio']= self.select("select costoEnvio from envio where envio.idFactura = ?", (pIdFactura))
            resultados['factura']= self.select("select * from factura where factura.idFactura = ?", (pIdFactura))
            return resultados
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return None

        #Metodo de pago
    def readMetodoPago (self):
        try:
            return self.select('select * from MetodoPago', ())
        except Exception as e:
            print(e)
            return None
#Factura
    def createFactura(self, idSucursal, idCliente, idEmpleado, idMetodoPago, total): 
        try:
            self.cursorSQL.execute('exec CRUDfactura ?, ?, ?, ?, ?, ?, ?',
                                (0, None, idSucursal, idCliente, idEmpleado, idMetodoPago, total))
            return self.select('select @@identity as idFactura',())
        except Exception as e:
            print(e)
            return None

    def readFactura(self, idFactura):
        try:
            return self.select('SET NOCOUNT ON; exec dbo.CRUDfactura ?, ?, ?, ?, ?, ?, ?',
                              (1, idFactura, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None

    #Detalle
    def createDetalle(self, idUnidad, idFactura, subTotal):
        try:
            print('a mi me llego un :D =>>>', subTotal)
            return self.cursorSQL.execute('exec dbo.CRUDdetalle ?, ?, ?, ?, ?',
                              (0, None, idUnidad, idFactura, subTotal))
        except Exception as e:
            print(e)
            return None

    #Envio
    def createEnvio(self, idFactura, idEstado, costoEnvio, fechaEnvio, latitud, longitud):
        try:
            return self.select('exec dbo.CRUDenvio ?, ?, ?, ?, ?, ?, ?, ?',
                              (0, None, idFactura, idEstado,
                              costoEnvio, fechaEnvio, latitud, longitud))
        except Exception as e:
            print(e)
            return None

    def conversion(self, idPais, monto):
        try:
            conv = self.select('exec dbo.getCambioMoneda ?',
                              (idPais))
            return monto*conv[0].get('cambioDolar')
        except Exception as e:
            print(e)
            return None

    def comprar(self, pIdSucursal, pIdCliente, pIdEmpleado, pIdMetodoPago, pProductos,
    pLatitud = None, pLongitud = None):
        """
        Funcion: Crea la factura, envio y detalles de una compra 
        Param:
            pIdSucursal(int): id de la sucursal a la que pertenece la factura
            pIdCliente(int): id del cliente a la que pertenece la factura
            pIdEmpleado(int): id del empleado a la que pertenece la factura
            pIdMetodoPago(int): id del metodo de pago a la que pertenece la factura
            pTotal(int): total de la factura
            pProductos([int]): Lista de diccionarios con productos comprados
            pLatitud(Float): Latitud de la ubicacion G del cliente
            pLatitud(Float): Longitud de la ubicacion G del cliente  
        Retorna:
            (int): id de la factura creada 
        """
        try:
            idFactura = self.createFactura(pIdSucursal, pIdCliente, 1, pIdMetodoPago, 0)[0]['idFactura']
            if (idFactura == None):
                return
            subtotal = 0
            total = 0
            print(idFactura)
            for producto in pProductos:
                unidades = self.select('exec getUnidadProducto ?', producto['idProducto'])
                print('unidad', self.select('exec getUnidadProducto ?', producto['idProducto'])[0])
                for i in range (0, producto['cantidad']):
                    subtotal = self.select('exec calcularSubtotal ?', unidades[i]['idUnidad'])[0]['subtotal']
                    self.createDetalle(unidades[i]['idUnidad'], idFactura, subtotal)
                    print('subtotal', subtotal)
                    total+=subtotal
                    print('total', total)
                    
            if (pLatitud != None and pLongitud != None):
                self.createEnvio(idFactura, 6, total*0.1, None, pLatitud, pLongitud)
            self.facturar(idFactura)
            return idFactura
        except Exception as e:
            print(e)
            return None
   
    
    def consultaEmpleado(self, idSucursal, idPuesto , fechaInicioContratacion,fechaFinContratacion , idEmpleado):
        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            print(idSucursal, idPuesto, fechaInicioContratacion,fechaFinContratacion , idEmpleado)
            return self.select('exec consultaEmpleado ?, ?, ?, ?,?',
                                (idSucursal, idPuesto, fechaInicioContratacion,fechaFinContratacion , idEmpleado))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None

    def montoRecolectadoEnvio(self, idSucursal = None, fechaInicial = None, fechaFin = None, idCliente = None):

        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            return self.select('exec montoRecolectadoEnvio ?, ?, ?, ?',
                                (idSucursal, fechaInicial, fechaFin, idCliente))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None

    def infoPrecioProductoSucursal(self, idProducto = None, nombre = None):

        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            return self.select('exec infoPrecioProductoSucursal ?, ?',
                                (idProducto, nombre))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None
   
    def obtenerDirectorioEmpleado(self):
        """
        Funcion: Crear una carpeta dentro de la carpeta Imagenes 
        Param:
            pNombreCarpeta(str): Nombre de la carpta donde se guadara la carpte
            pNombreArchivo(str): Nombre de como se llamara la carpeta
        Retorna:
            path: La ruta de la carpeta creada
            None: si pasa algun error o no se pudo crear 
        """
        try:
            ruta=os.getcwd()
            path = Path(ruta,"Fotos Empleados")
            path.mkdir(parents=True, exist_ok=True)
            return path
    
        except Exception as e:
                    #Si no encuentra el proc
                print(e)
                return None
   
    def getFotoEmpleado(self,pIdEmpleado):
        """
        Funcion: Retorna la Foto de un empleado
        Param:
            pIdEmplead(int): Id del Empleado que se busca
        Retorna:
            True: si logra hacer el proceso y se guarda la foto en una carpeta
        """
        try:
            query=  "SELECT Empleado.foto FROM Empleado WHERE idEmpleado= '{0}'"
            self.cursorSQL.execute(query.format(str(pIdEmpleado)))
            Myresult=self.cursorSQL.fetchone()[0]
            dic = self.readEmpleadoG(pIdEmpleado)[0]
            path=self.obtenerDirectorioEmpleado()
            StoreFilePath=Path(path,'{0}.jpg'.format(str(dic["nombreEmpleado"]+str(pIdEmpleado))))
            with open (StoreFilePath,"wb")as File:
                File.write(Myresult)
                File.close()
            return StoreFilePath

        except Exception as e:
                #Si no encuentra el proc
            print('RETORNAL: getFotoEmpleado',e)

            return None
    
    def setEmpleado(self,pIdPuesto, pIdSucursal, pNombre, pApellido1, pApellido2, pCedula,
                    pFechaContratacion, pFechaNacimiento, pCorreo, pFilePathFoto):
        """
        Funcion: Inserta un Empleado
        Param:
            pIdPuesto(int) = Id del puesto del Empleado
            pIdSucursal(int) = Id de la sucursal del Empleado
            pNombre(string)= Nombre del Empleado
            pApellido1(string)= Primer apellido del Empleado
            pApellido2(string)= Segundo apellido del Empleado
            pCedula(int)= Cedula del Empleado
            pFechaContratacion(string)= FechaContratacion del Empleado
            pFechaNacimiento(string)= FechaNacimiento del Empleado
            pCorreo(string)= Correo del Empleado
            pFoto(string)= Foto del Empleado
        Retorna:
            True: Si se pudo realizar el insert
            False: No se pudo realizar el insert
        """
        try:
            with open(pFilePathFoto,"rb") as File:
                    BinaryData = File.read()
            #Inserta el Empleado por medio del CRUDEmpleado
            self.cursorSQL.execute('exec dbo.CRUDEmpleado ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
            (0, None, pIdPuesto, pIdSucursal, 2, pCedula, pNombre, pApellido1, pApellido2,
            pFechaContratacion, pFechaNacimiento, pCorreo, BinaryData))
            return True #Se pudo insertar el Empleado
        except Exception as e:
            #Si no encuentra el proc
            print(e)
            return False


    def updateEmpleado(self, idEmpleado, idPuesto, idSucursal, 
    cedula, nombreEmpleado, apellido1, apellido2, fechaContratacion, fechaNacimiento, correo, pFilePathFoto):
        try:
            if pFilePathFoto != None:
                with open(pFilePathFoto,"rb") as File:
                        BinaryData = File.read()
                self.select('exec dbo.CRUDempleado ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
                (2, idEmpleado, idPuesto, idSucursal, 2, cedula, nombreEmpleado, apellido1, apellido2, fechaContratacion, fechaNacimiento, correo, BinaryData))
            else:
                self.select('exec dbo.CRUDempleado ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
                (2, idEmpleado, idPuesto, idSucursal, 2, cedula, nombreEmpleado, apellido1, apellido2, fechaContratacion, fechaNacimiento, correo, pFilePathFoto))
            return True 
        except Exception as e:
            print(e)
            return None
            
    def deleteEmpleado(self, idEmpleado):
        try:
            self.select('exec dbo.CRUDempleado ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
                              (3, idEmpleado, None, None, None, None, None, None, None, None, None, None, None))
            return True
            
        except Exception as e:
            print(e)
            return False

    def deleteCliente(self, idCliente):
        try:
            self.select('exec dbo.CRUDcliente ?, ?,?, ?, ?, ?, ?, ?, ?, ?',
                              (3, idCliente, None, None, None, None, None, None, None, None))
            return True
            
        except Exception as e:
            print(e)
            return False

    def getExisteCategoria(self,pIdCategoria):
        """
        Funcion: Retorna la Foto de un empleado
        Param:
            pIdEmplead(int): Id del Empleado que se busca
        Retorna:
            True: si logra hacer el proceso y se guarda la foto en una carpeta
        """
        try:
            query=  "select count(idCategoria) as cant from Categoria where idCategoria = '{0}'"
            self.cursorSQL.execute(query.format(str(pIdCategoria)))
            cant=self.cursorSQL.fetchone()[0]
            if cant == 0:
                return False
            return True

        except Exception as e:
                #Si no encuentra el proc
            print(e)
            return None
            
    def getExisteEmpleado(self,pIDEmpelado):
        """
        Funcion: Retorna la Foto de un empleado
        Param:
            pIdEmplead(int): Id del Empleado que se busca
        Retorna:
            True: si se encuentra el empleado
            False: si no se encuentra el empleado
        """
        try:
            query=  "select count(idEmpleado) as cant from Empleado where idEmpleado = '{0}'"
            self.cursorSQL.execute(query.format(str(pIDEmpelado)))
            cant=self.cursorSQL.fetchone()[0]
            if cant == 0:
                return False
            return True

        except Exception as e:
                #Si no encuentra el proc
            print(e)
            return None

    def getExisteCliente(self,pIDCliente):
        """
        Funcion: Retorna la Foto de un empleado
        Param:
            pIdEmplead(int): Id del Empleado que se busca
        Retorna:
            True: si se encuentra el empleado
            False: si no se encuentra el empleado
        """
        try:
            query=  "select count(idCliente) as cant from Cliente where idCliente = '{0}'"
            self.cursorSQL.execute(query.format(str(pIDCliente)))
            cant=self.cursorSQL.fetchone()[0]
            if cant == 0:
                return False
            return True

        except Exception as e:
                #Si no encuentra el proc
            print(e)
            return None

    def createProducto(self, idCategoria, nombre, descripcion, precio, foto1,foto2,foto3):
            try:
                print("Buenas estoy en el create")
                if (not self.getExisteCategoria(int(idCategoria))):
                    return False #La cuenta no puede ser registrada porque los parametros son incorrectos
                print("Sigo aqui?", idCategoria, nombre, descripcion, precio, foto1,foto2,foto3)
                self.select('exec dbo.CRUDproducto ?, ?, ?, ?, ?, ?',
                                (0, None, idCategoria, nombre, descripcion, precio))
                idP=self.select("select @@identity as idProducto",())[0]['idProducto']
                print(idP)
                self.createFoto(idP, foto1)
                self.createFoto(idP, foto2)
                self.createFoto(idP, foto3)

                return True
            except Exception as e:
                print(e)
                return None

    def readProducto(self, idProducto):
        try:
            return self.select('exec dbo.CRUDproducto ?, ?, ?, ?, ?, ?',
                              (1, idProducto,None, None, None, None))
        except Exception as e:
            print(e)
            return None

    def updateProducto(self, idProducto, idCategoria, nombre, descripcion, precio):
        try:
            return self.select('exec dbo.CRUDproducto ?, ?, ?, ?, ?, ?',
                              (2, idProducto, idCategoria, nombre, descripcion, precio))
        except Exception as e:
            print(e)
            return None

    def deleteProducto(self, idProducto):
        try:
            return self.select('exec dbo.CRUDproducto ?, ?, ?, ?, ?, ?',
                              (3, idProducto,None, None, None, None))
        except Exception as e:
            print(e)
            return None

    def createFoto(self, idProducto, pFilePath):
        try:
            with open(pFilePath,"rb") as File:
                    BinaryData = File.read()
            self.select('exec dbo.CRUDfotos ?, ?, ?, ?',
                        (0, None, idProducto, BinaryData))
            return True
        except Exception as e:
            print(e)
            return False

    def updateFoto(self, idFoto,  idProducto, pFilePath):
        try:
            if pFilePath != None:
                with open(pFilePath,"rb") as File:
                        BinaryData = File.read()
                self.select('exec dbo.CRUDfotos ?, ?, ?, ?',
                     (2, idFoto, idProducto, BinaryData))
            else:
                 self.select('exec dbo.CRUDfotos ?, ?, ?, ?',
                              (2, idFoto, idProducto, pFilePath))
            return True
        except Exception as e:
            print(e)
            return None

    def deleteFoto(self, idFoto):
        try:
            return self.select('exec dbo.CRUDfotos ?, ?, ?, ?',
                              (3, idFoto, None, None))
        except Exception as e:
            print(e)
        return None

    def crearDirectorioProducto(self, pNombreArchivo):
        """
        Funcion: Crear una carpeta dentro de la carpeta Imagenes 
        Param:
            pNombreCarpeta(str): Nombre de la carpta donde se guadara la carpte
            pNombreArchivo(str): Nombre de como se llamara la carpeta
        Retorna:
            path: La ruta de la carpeta creada
            None: si pasa algun error o no se pudo crear 
        """
        try:
            ruta=os.getcwd()
            path = Path(ruta,"Imagenes",pNombreArchivo)
            path.mkdir(parents=True, exist_ok=True)
            return path
    
        except Exception as e:
                    #Si no encuentra el proc
                print(e)
                return None

    def getFotoProducto(self,pIdFoto):
        """
        Funcion: Selecciona una sola imagen de sql y la saca a una carpeta 
        Param:
            pIdFoto(int): id de la Foto
        Retorna:
            true: si logro sacar la imagen y no hubo errores
        """
        try:
            query=  "SELECT Fotos.foto FROM Fotos WHERE idFoto= '{0}'" #Seleccionamos el id de una foto
            self.cursorSQL.execute(query.format(str(pIdFoto))) #Hacemos la consulta a sql y eso nos debe retornar una foto
            Myresult=self.cursorSQL.fetchone()[0]  #Lo anterior nos devuelve una tupla, por lo cual debemos especificarle el de la posicion 0 ya que es el que contiene la informacion
            dic=(self.getNombreProductoFoto(pIdFoto))[0] #Buscamos el nombre del producto por medio del idFoto
            path=self.crearDirectorioProducto(dic.get("nombre")) #Creamos la carpeta, y si ya existe solamente la a
            StoreFilePath=Path(path,'{0}.jpg'.format(str(pIdFoto))) 
            #StoreFilePath=r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\conexion\ImageOutputs\img{0}.jpg'.format(str(pIdFoto)) #Ponemos la ruta de la carpeta donde se va guardar la imagen, el img{0}, y lo demas sirve para luego ponerle el nombre a la imagen
            with open (StoreFilePath,"wb")as File: #Abrimos el archivo
                File.write(Myresult) #Pone la imagen ahi
                File.close() # cerramos el archico
            return True

        except Exception as e:
                #Si no encuentra el proc
            print(e)
            return None

    def getFotosProducto(self,pIdproducto): 
        """
        Funcion: Selecciona 3 imagenes de sql de un producto especifico y la saca a una carpeta 
        Param:
            pIdproducto(int): id Producto se ingresa para buscar las fotos de esa imagen
        Retorna:
            true: si logro sacar las imagenes y no hubo errores
        """
        try:
            query=  "SELECT Fotos.foto FROM Fotos WHERE idProducto= '{0}'"
            self.cursorSQL.execute(query.format(str(pIdproducto)))
            size=3
            record=self.cursorSQL.fetchmany(size) #el fetchmany se usa para sacar solo ciertas determinas filas, y obligatoriamente ocupa el size ya que si se quita, por predeterminado es 1 y si no existe no devuelve nada
            dic = self.readProducto(pIdproducto)[0]
            path=self.crearDirectorioProducto(dic["nombre"]) #Creamos la carpeta, y si ya existe solamente la agregamos
            StoreFilePath=Path(path,'{0}.jpg'.format(str(1))) 
            for i,fila in enumerate(record): # i es el index, y fila contiene la informacion 
                with open (StoreFilePath,"wb")as File:
                    File.write(fila[0])
                    File.close()
                StoreFilePath=Path(path,'{0}.jpg'.format(str(i+2))) 
            return True
        except Exception as e:
                #Si no encuentra el proc
            print(e)
            return None


    def consultaCliente(self,cedula,idCliente):
        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            return self.select('exec consultaCliente ?, ?',
                                (cedula,idCliente))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None
  
    def consultaClienteCorreo(self,correo):
        try:
            #Retorna los resultados conseguidos del procedimiento ObtenerInfoBono
            return self.select('exec consultaClienteC ?',
                                (correo))
        except Exception as e:
            print(e)
            #Si no encuentra el proc
            return None

    def readCliente(self, idCliente):
        try:
           
            dic=self.select('exec dbo.CRUDcliente ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?',
            (1, idCliente,None, None, None, None, None, None, None, None, None, None, None))
            return dic
        except Exception as e:
            print(e)
            return None

    def updateCliente(self, idCliente,cedula, nombre, apellido1, 
    apellido2,  fechaNacimiento, correo,celular):
        try:
            
            return self.select('exec dbo.CRUDcliente ?, ?,?, ?, ?, ?, ?, ?, ?, ?',
            (2, idCliente,2, cedula, nombre, apellido1, apellido2, fechaNacimiento, correo, celular))
        except Exception as e:
            print(e)
            return None
    
    def verPedidosRealizados(self,idSucursal=None):
        """
            Metodo para consultar los pedidos realizados de una sucursal
            o de todas las sucursales si idSucursal es None.
            
        """
        pedidos = []
        try:
            pedidos = self.select('exec dbo.mostrarPedidos ?',(idSucursal))
        except Exception as e:
            print(e)
            return None
        try:
            proveedor=""
            postgres = ConexionServidorPG()
            postgres.conectarServidor()
            i = 0
            while i < len(pedidos):#ficlo para buscar el nombre del prooveedor de cada pedido
                proveedor = postgres.readProveedor(pedidos[i].get('idProveedor'))[0].get('_outnombreproveedor')
                pedidos[i]['proveedor']= proveedor
                pedidos[i].pop('idProveedor')#Quita la clave idproveedor del 
                                            #diccionario porque se usa, solo para buscar el nombre
                pedidos[i]['fechaSolicitud']=pedidos[i].get('fechaSolicitud').strftime("%m/%d/%Y, %H:%M:%S")
                if pedidos[i].get('fechaRecibido')!=None:#Cambia las fechas a un string para mostrar en la GUI
                    pedidos[i]['fechaRecibido']=pedidos[i].get('fechaRecibido').strftime("%m/%d/%Y, %H:%M:%S")
                else:
                    pedidos[i]['fechaRecibido']='Aún no lo entregan'
                i += 1
            postgres.cerrarConexionServidores()
            return pedidos
        except:
            return None

    def getAdministradores(self):
        """
            Metodo para obtener los administradores de las sucursales.
            Parametros: ninguno.
            Retorna: lista con diccionarios [{'idSucural':value,'idAdministrador':value}]
        """
        try:
            return self.select('exec dbo.validarAdministrador',())
        except Exception as e:
            print(e)
            return None
    def ortorgarBonos(self):
        """
            Metodo para ortorgar bonos
            Parametros: No tiene
            Retorna: True si se pudo ejecutar el proc y false si no se puede.
        """
        try:
            self.cursorSQL.execute("exec dbo.OtorgarBono")
            return True
        except Exception as e:
            print(e)
            return False
    def verBonosOtorgados(self,idEmpleado,fechaInicio,fechaFin,idSucursal,idPais):
        """
            Metodo para ver los bonos otorgados.
            Parametros: 
                idEmpleado int
                fechaInicio varchar 'yyyy-mm-dd'
                fechaFin varchar 'yyyy-mm-dd'
                idSucursal int
                idPais int
            Retorna: [{}]
        """
        try:
            return self.select('exec dbo.ObtenerInfoBono ?, ?, ?, ?, ?',(idEmpleado,fechaInicio,fechaFin,idSucursal,idPais))
        except Exception as e:
            print(e)
            return None


class ConexionServidorPG:
    servidor = None
    cursorPG = None

    #Intenta conectarse al servidor con nombre=nombreServidor
    def conectarServidor(self):
        try:
            self.servidor = psycopg2.connect(
                                            host = 'localhost',
                                            user = 'postgres',
                                            password='123',
                                            database='Proveedores')
            self.cursorPG = self.servidor.cursor()
            self.servidor.autocommit = True
        except Exception as e:
            print(e)
            print("Ha ocurrido un error al intentar conectarse al servidor de proveedores")

    def conexionViva(self):
        if self.servidor != None:
            return True
        return False

    def cerrarConexionServidores(self):
        self.cursorPG.close()
        self.servidor.close()

    def select(self, nombreProc, param):
        """
        Funcion: Retorna los resultados del procedimiento con los parametros ingresados
        Param:
            nombreProc(string): Procedimiento a ejecutar (ejm: exec nombProc ?, ?)
            param(tuple): Parametros que recibe el procedimiento (ejm: (param1, param2))
        Retorna:
            lista de diccionarios: Lista que contendra en el diccionario los resultados del procedimiento
        """
        try:
            #Llama al procedimiento con los parametros
            self.cursorPG.execute(nombreProc, param)
            col_names = [x[0] for x in self.cursorPG.description]
            rows = []
            for row in self.cursorPG:
                rows.append(dict(zip(col_names, row)))
            return rows
        except TypeError:
            print("El procedimiento no devuelve ningun resultado")
        except Exception as e:
                print(e)
                print("Ha ocurrido un error al intentar llamar al procedimiento: ",nombreProc)

    #CRUDS
    #Proveedor
    def createProveedor(self, x, idUbicacion, nombreProveedor, celular, correo):
        if x.existeUbicacion(idUbicacion) == 0:
            return 'No existe la ubicacion'
        try:
            return self.select('CALL dbo.crud_proveedor(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                              (0, None, idUbicacion, nombreProveedor, celular, correo, None, None, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None
    def readProveedor(self, idProveedor):
        try:
            return self.select('CALL dbo.crud_proveedor(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                              (1, idProveedor, None, None, None, None, None, None, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None
    def updateProveedor(self, idProveedor, x, idUbicacion, nombreProveedor, celular, correo):
        if x.existeUbicacion(idUbicacion) == 0:
            return 'No existe la ubicacion'
        try:
            return self.select('CALL dbo.crud_proveedor(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
        (2, idProveedor, idUbicacion, nombreProveedor, celular, correo, None, None, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None
    def deleteProveedor(self, idProveedor):
        try:
            return self.select('CALL dbo.crud_proveedor(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                              (3, idProveedor, None, None, None, None, None, None, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None

    #ProovedorXProducto
    def createProovedorXProducto(self, x, idProveedor, idProducto, costoProducto, cantidadDisponible):
        if x.existeProducto(idProducto) == 0:
            return 'No existe el producto'
        try:
            return self.select('CALL dbo.crud_proveedorxproducto(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                              (0, None, idProveedor, idProducto, costoProducto, cantidadDisponible, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None
    def readProovedorXProducto(self, idProveedorXProducto):
        try:
            return self.select('CALL dbo.crud_proveedorxproducto(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
                              (1, idProveedorXProducto, None, None, None, None, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None
    def updateProovedorXProducto(self, x, idProveedorXProducto, idProveedor, idProducto, costoProducto, cantidadDisponible):
        if x.existeProducto(idProducto) == 0:
            return 'No existe el producto'
        try:
            return self.select('CALL dbo.crud_proveedorxproducto(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);',
        (2, idProveedorXProducto, idProveedor, idProducto, costoProducto, cantidadDisponible, None, None, None, None, None))
        except Exception as e:
            print(e)
            return None



# pais = 'CostaRica'
# x = ConexionServidorSQL()
# x.conectarServidor(pais)

# pgConnection = ConexionServidorPG()
# pgConnection.conectarServidor()

# if x.conexionViva()==False or pgConnection.conexionViva()==False:
#     print('NO SE PUEDE CONECTAR AL SERVIDOR')
# else:
    
    # #Ejemplo validarContrasennaCliente con true
    # print(x.validarContrasennaCliente('pato123', 'Clint_Abbey9788@jiman.org'))
    # #Ejemplo validarContrasennaCliente con false por error de contrasenna
    # print(x.validarContrasennaCliente('pato12', 'Clint_Abbey9788@jiman.org'))
    # #Ejemplo validarContrasennaCliente con false por correo no registrado
    # print(x.validarContrasennaCliente('pato123', 'Clint@jiman.org'))
    #Ejemplo de insertarCuentaCliente
    #print(x.insertarCuentaCliente('Ridley','Lopez','Cleint',111116541,'8/14/1992','Ridley_Clint1234.org','52145632', 'edificio1827'))
    #Ejemplo de getSucursal con todos los parametros
    #print(x.getSucursal('Costa Rica', 2, 2, 2))
    #Ejemplo de getSucursal sin todos los parametros
    #print(x.getSucursal('Costa Rica'))
    #print(x.readEmpleado(1002))
    #dic=(x.getNombreProducto(1))[0]
    #print(dic.get("nombre"))

    #Ejemplo validarContrasennaEmpleado con true
    # print(x.validarContrasennaEmpleado('pato123', 'JCerdas@gmail.com'))
    #Ejemplo de insertarCuentaCliente
    #print(x.insertarCuentaEmpleado(2, 1, 'Gaby', 'Torres', 'Gonzales', 25885541, '2020-12-15', '1992-12-15','GTorres@gmail.com', b'\xC2\xA9\x20\xF0\x9D\x8C\x86\x20\xE2\x98\x83', 'Contrasenna771'))
    #Ejemplo de insertarFoto
    #print(x.createFoto(1,r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\images\Pepsi1.png'))
    #print(x.createFoto(1,r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\conexion\prueba2.jpg'))
    #print(x.createFoto(1,r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\conexion\prueba3.jpg'))
    #Ejemplo de sacar sola una foto con su idFoto
    
    #print(x.createProducto( 1, "Pepsi", "Bebida mundial, ampliamente conocida, creadora de experiencias de marca", 2
    #, r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\images\Pepsi1.png',
    #r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\images\Pepsi2.png',
    #r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\images\Pepsi3.jpg'))

    #print(x.getFotoProducto(1))
    #Ejemplo de sacar  fotos con el id Producto, por predeterminado solo saca 3
    #print(x.getFotosProducto(1))
    #print(x.reporteProductos('Panama', 1, 1, 3))
    # print(x.reporteClientes('Panama', 1, 1, 3))
    #Ejemplo de setEmpleado
    #print(x.setEmpleado(2, 2, "Alejandro", "Sanabria", "Corrales", 118230056,'2020-12-15', '1992-12-15', "aleSa56@gmail.com", r'C:\Users\STACY\Documents\GitHub\Proyecto-Bases2\GUI\website\conexion\prueba3.jpg'))
    #Ejemplo de getGananciasNetas
    # print(x.getGananciasNetas('2020-10-10','2022-10-10',1,1,1))
    # print(x.getGananciasNetas(None, None, None, None, None))
    #Ejemplo de poner producto en descuento
    #print(x.ponerProductoEnDescuento(4, 0.3))
    #Ejemplo de poner producto en descuento
    #print(x.sacarDeExhibidor(1))
    #print(x.sacarDeExhibidor(4))
    #Sucursal más cercana
    #print(x.getSucursalCercanaExistencias(1002,1))
    #print(x.existeProducto(1))
    # print(pgConnection.createProovedorXProducto(x, 1, 1616684, 2, 2))    
    #print(pgConnection.readProovedorXProducto(4))
    # print(x.getInfoProv())
    # print(x.getInfoBono(pIdPais=1))
    # print(x.buscarProveedores(pNombreProveedor='Comodo'))
    #print(" ")