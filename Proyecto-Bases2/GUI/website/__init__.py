#Convierte el folder website en un python package
from flask import Flask,session
from flask_session import Session

#Funcion para crear instancia del servidor web usado en main.py
def create_app():
    app = Flask(__name__)#Crea la instancia de flask
    app.config['SECRET_KEY'] = 'holamundo' #Encripta la info del website

    #Para los login
    app.config["SESSION_PERMANENT"] = False
    app.config["SESSION_TYPE"] = "filesystem"
    Session(app)

    #Trae las rutas que tenemos en otros archivos
    from .auth import auth
    from .cli import cli
    from .emp import emp

    #Espeficifica cuales son las url de cada route 
    app.register_blueprint(auth,url_prefix='/')
    app.register_blueprint(cli,url_prefix='/')
    app.register_blueprint(emp,url_prefix='/')


    return app #Retorna la instancia de la app.