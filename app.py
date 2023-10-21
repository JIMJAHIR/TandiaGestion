from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
from cnx import DB_CONFIG
from app.soporte import soporte_bp
from app.ventas import ventas_bp

app = Flask(__name__)
app.secret_key = 'tu_clave_secreta'

# Registra el Blueprint 'soporte_bp' en tu aplicación
app.register_blueprint(soporte_bp)
app.register_blueprint(ventas_bp)

def validar_acceso(usuario, contraseña):
    try:
        # Configura la conexión a la base de datos
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        # Consulta para obtener el usuario y su rol
        query = "SELECT NombreUsuario, Contrasenia, NombreCompleto, Rol FROM Usuario WHERE NombreUsuario = %s"
        cursor.execute(query, (usuario,))
        result = cursor.fetchone()
        if result:
            # Verifica la contraseña
            if contraseña == result[1]:
                # Devuelve el rol del usuario
                return result[0], result[1], result[2], result[3]
        return None  # Devuelve None si la autenticación falla
    except mysql.connector.Error as e:
        print(f'Error al conectar a la base de datos: {e}')
        return None
    finally:
        cursor.close()
        conn.close()

@app.route('/loginUser', methods=['GET', 'POST'])
def loginUser():
    if request.method == 'POST':
        usuario = request.form['user']
        contraseña = request.form['password']

        NombreUsuario, Contrasenia, NombreCompleto, rol = validar_acceso(
            usuario, contraseña)

        if rol:
            session['NombreUsuario'] = NombreUsuario
            session['Contrasenia'] = Contrasenia
            session['NombreCompleto'] = NombreCompleto
            session['Rol'] = rol

            if rol == 'Soporte':
                return redirect(url_for('soporte.support'))
            elif rol == 'Ventas':
                return redirect(url_for('ventas.sale'))
            else:
                # Manejar otros roles aquí si es necesario
                pass
    return render_template('login.html')


@app.route('/login')
def login():
    return render_template('login.html')


@app.route('/cerrarSesion')
def cerrarSesion():
    session.clear()
    return redirect(url_for('index'))

















@app.route('/')
def index():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True)
