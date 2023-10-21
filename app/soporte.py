from flask import Blueprint, render_template, request, redirect, url_for, session
from functools import wraps
from app.models import obtener_info_clientes, obtener_info_clientes_contrato, obtener_info_clientes_filtrados
from cnx import DB_CONFIG

soporte_bp = Blueprint('soporte', __name__)

def login_required(route_function):
    @wraps(route_function)
    def wrapper(*args, **kwargs):
        if 'NombreUsuario' in session and 'Contrasenia' in session:
            return route_function(*args, **kwargs)
        else:
            return redirect(url_for('login'))
    return wrapper


@soporte_bp.route('/support', methods=['GET', 'POST'])
@login_required
def support():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    if request.method == 'POST':
        ruc = request.form.get('ruc')
        lista_clientes = obtener_info_clientes_filtrados(ruc)
    else:
        lista_clientes = obtener_info_clientes()

    return render_template('soporte/support.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol, lista_clientes=lista_clientes)


@soporte_bp.route('/searchSupport', methods=['GET', 'POST'])
@login_required
def searchSupport():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    if request.method == 'POST':
        contrato = request.form.get('contrato')
        cliente = obtener_info_clientes_contrato(contrato)
    else:
        cliente = [""]

    return render_template('soporte/searchSupport.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol, cliente = cliente)
















