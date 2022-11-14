import re
from datetime import date,datetime
from dateutil.relativedelta import relativedelta

def validarCorreo(email):
    """
        Funcion para validar formato de correo.
        Parametros:
            email String: Email que se desea validar.
        Returna:
            True si el formato es valido
            False si el formato es invalido
    """
    #Por si no meten correo en la interfaz
    if email is None:
        return False
    if (len(email)>50):
        return False
    #Si el correo cumple la regex
    if(re.fullmatch(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b', email)):
        return True
    #El correo no cumple la regex
    return False
    
def validarContrasenna(contrasenna):
    """
    Funcion para validar formato de contrasenna
    Para probar la contrasena, puede tener solo letras (mayusculas y minusculas) y numeros

    Parametros:
        contrasenna String: Contraseña que se desea validar.
    Retorna:
        True si el formato es correcto.
        False si el formato es incorrecto.

    Conditions for a valid password are:
        Should have at least one number.
        Should have at least one uppercase and one lowercase character.
        Should have at least one special symbol.
        Should be between 8 to 16 characters long.
    """
    if contrasenna is None:
        return False
    #regex real: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!#%*?&]{6,20}$"
    if re.search(re.compile("^\w+$"), contrasenna):
        return True
    return False

def validarNombreApellidoCliente(nombre_Apellido):
    """
        Funcion para validar nombre y apellidos del cliente
        Debe tener entre [1,50] caracteres.
        Parametros:
            nombre_Apellido String: Nombre o apellido que se desea validar.
        Retorna:
            True si el formato es valido.
            False si el formato es invalido.
    """
    if nombre_Apellido is None:
        return False
    #Debe tener al menos un caracter
    if len(nombre_Apellido)<1 or len(nombre_Apellido)>50:
        return False
    return True

def validarNumero(numero):
    """
        Funcion para validar numero de cedula(solo numeros para todos loa paises)
        Parametros:
            numero String: Cadena de caracteres que se desea validar que contenga solo numeros.
        Retorna:    
            True si contiene solo numeros.
            False si no contiene solo numeros.
    """
    if numero is None:
        return False
    if re.match("^\\d+$", numero):
        return True
    return False

def validarCelular(celular):
    """
        Funcion para validar el celular
        Celular debe tener menos o 20 caracteres, debe contener solo numeros.
        Parametros:
            celular String: Cadena de caracteres con el celular que se desea validar.
        Retorna:
            True si cumple con la cantidad de caracteres maximos y si contiene solo numeros.
            False si no cumple con esas condiciones.
    """
    if celular is None:
        return False
    if len(celular)>20:
        return False
    elif validarNumero(celular)==False:
        return False
    #Validar celular por pais?
    return True

def validarFechaNacimiento(fechaNacimiento):
    """
        Funcion para validar fecha de nacimiento del cliente
        El cliente debe ser mayor de edad.
        Parametros:
            fechaNacimiento String: Fecha que se desea validar.
        Retorna:
            True si el cliente es mayor de edad.
            False si no es mayor de edad.
    """
    if fechaNacimiento is None:
        return False
    try:
        if relativedelta(date.today(), datetime.strptime(fechaNacimiento, '%Y-%m-%d').date()).years<18:
            return False#Es menor de edad
        return True
    except:#Por si intenta castear algo que no es 'aaaa-mm-dd'
        return False

def validarFechaContratacion(fechaContratacion):
    """
        Funcion para validar fecha de nacimiento del cliente
        El cliente debe ser mayor de edad.
        Parametros:
            fechaNacimiento String: Fecha que se desea validar.
        Retorna:
            True si el cliente es mayor de edad.
            False si no es mayor de edad.
    """
    
    try:
        if fechaContratacion is None:
            return False
    except:#Por si intenta castear algo que no es 'aaaa-mm-dd'
        return False

   
    
def validarNombreProducto(nombreProducto):
    """
        Funcion para validar nombre de un producto
        Debe tener entre [1,50] caracteres.
        Parametros:
            nombreProducto String: Nombre del producto que se desea validar.
        Retorna:
            True si el formato es valido.
            False si el formato es invalido.
    """
    if nombreProducto is None:
        return False
    #Debe tener al menos un caracter
    if len(nombreProducto)<1 or len(nombreProducto)>50:
        return False
    return True

def validarDescripcionProducto(descripcionProducto):
    """
        Funcion para validar nombre de un producto
        Debe tener entre [1,50] caracteres.
        Parametros:
            descripcionProducto String: Descripcion del producto que se desea validar.
        Retorna:
            True si el formato es valido.
            False si el formato es invalido.
    """
    if descripcionProducto is None:
        return False
    #Debe tener al menos un caracter
    if len(descripcionProducto)<1 or len(descripcionProducto)>150:
        return False
    return True

def validarFoto(FilePath):
    """
        Funcion para validar nombre de un producto
        Debe tener entre [1,50] caracteres.
        Parametros:
            descripcionProducto String: Descripcion del producto que se desea validar.
        Retorna:
            True si el formato es valido.
            False si el formato es invalido.
    """
    print(FilePath)
    if FilePath is None:
        return False
    return True