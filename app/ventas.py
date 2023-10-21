from flask import Blueprint, render_template, request, redirect, url_for, session
from functools import wraps
from app.models import obtener_info_clientes, obtener_info_clientes_contrato, obtener_info_clientes_filtrados
from cnx import DB_CONFIG

ventas_bp = Blueprint('ventas', __name__)

def login_required(route_function):
    @wraps(route_function)
    def wrapper(*args, **kwargs):
        if 'NombreUsuario' in session and 'Contrasenia' in session:
            return route_function(*args, **kwargs)
        else:
            return redirect(url_for('login'))
    return wrapper

@ventas_bp.route('/sale', methods=['GET', 'POST'])
@login_required
def sale():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    if request.method == 'POST':
        ruc = request.form.get('ruc')
        lista_clientes = obtener_info_clientes_filtrados(ruc)
    else:
        lista_clientes = obtener_info_clientes()

    return render_template('ventas/sale.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol, lista_clientes=lista_clientes)

@ventas_bp.route('/searchSale', methods=['GET', 'POST'])
@login_required
def searchSale():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    if request.method == 'POST':
        contrato = request.form.get('contrato')
        cliente = obtener_info_clientes_contrato(contrato)
    else:
        cliente = [""]

    return render_template('ventas/searchSale.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol, cliente = cliente)

@ventas_bp.route('/newSale')
@login_required
def newSale():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    return render_template('ventas/newSale.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol)

@ventas_bp.route('/saleE')
@login_required
def saleE():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    return render_template('ventas/saleE.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol)

@ventas_bp.route('/extraSale')
@login_required
def extraSale():
    NombreUsuario = session.get('NombreUsuario')
    Contrasenia = session.get('Contrasenia')
    NombreCompleto = session.get('NombreCompleto')
    Rol = session.get('Rol')
    
    return render_template('ventas/extraSale.html', NombreUsuario=NombreUsuario, Contrasenia=Contrasenia, NombreCompleto=NombreCompleto, Rol=Rol)
