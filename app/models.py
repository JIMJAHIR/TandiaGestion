from flask import render_template, request, redirect, url_for, session
from functools import wraps
import mysql.connector
from cnx import DB_CONFIG

def obtener_info_clientes():
    try:
        # Establece la conexión a tu base de datos utilizando la configuración de DB_CONFIG
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Llama al procedimiento almacenado
        cursor.callproc('ObtenerInfoClientes')

        # Recupera los resultados
        for result in cursor.stored_results():
            data = result.fetchall()

        # Cierra el cursor y la conexión solo si se crearon con éxito
        cursor.close()
        conn.close()

        return data

    except mysql.connector.Error as e:
        print(f'Error al conectar a la base de datos: {e}')
        return None

def obtener_info_clientes_filtrados(ruc):
    try:
        # Establish the database connection using DB_CONFIG
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Call a stored procedure to retrieve filtered client data
        cursor.callproc('ObtenerInfoClientesFiltrados', [ruc])

        # Retrieve the results
        for result in cursor.stored_results():
            data = result.fetchall()

        cursor.close()
        conn.close()

        return data

    except mysql.connector.Error as e:
        print(f'Error connecting to the database: {e}')
        return None
    
def obtener_info_clientes_contrato(contrato):
    try:
        # Establish the database connection using DB_CONFIG
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Call a stored procedure to retrieve filtered client data
        cursor.callproc('BuscarClientesPorContrato', [contrato])

        # Retrieve the results
        for result in cursor.stored_results():
            data = result.fetchall()

        cursor.close()
        conn.close()

        return data

    except mysql.connector.Error as e:
        print(f'Error connecting to the database: {e}')
        return None
    
