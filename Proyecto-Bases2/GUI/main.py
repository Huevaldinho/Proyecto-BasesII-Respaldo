#Archivo principal para iniciar el servidor de la pagina web.
#instalar flask, flask-login y flask-sqlalchemy

#Importa el paquete website que creamos.
from website import create_app

#Crea la instancia del servidor web
app = create_app() 

#Este if es para que el servidor se inicie unicamente si el archivo main.py se ejecuta.
if __name__== '__main__':
    app.run(debug=True)#Runea el servidor web, el debug es para que 
                        #cada vez que se haga un cambio se rerunee automaticamente.

