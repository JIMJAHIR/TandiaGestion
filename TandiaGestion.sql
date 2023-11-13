-- Tabla Usuario
USE tandia;
CREATE TABLE user (
    user_id INT(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_full_name VARCHAR(255) NOT NULL,
    user_emanil VARCHAR(100) NOT NULL,
    user_phone_number VARCHAR(255),
    user_role VARCHAR(255) NOT NULL,
    user_area VARCHAR(255) NOT NULL,
    user_state VARCHAR(255) NOT NULL,
    user_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Asistencia
USE tandia;
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT(4) ZEROFILL NOT NULL,
    entry_date DATETIME,
	departure_date DATETIME,
    attendance_state VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Tabla NuevoCliente
USE tandia;
CREATE TABLE new_client (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT(4) ZEROFILL NOT NULL,
	closure_type VARCHAR(255),
    ruc VARCHAR(255),
    social_name VARCHAR(255),
    legal_representative VARCHAR(255),
    doc_number VARCHAR(255),
    department VARCHAR(255),
    tax_address VARCHAR(255),
    business_line VARCHAR(255),
    client_name VARCHAR(255),
    client_email VARCHAR(255),
    client_phone VARCHAR(255),
    implementor_name VARCHAR(255),
    implementor_email VARCHAR(255),
    implementor_phone VARCHAR(255),
    plan VARCHAR(255),
    contract_type VARCHAR(255),
    stores_number INT,
    stores_conf VARCHAR(255),
    users_number INT,
    users_conf VARCHAR(255),
    fe BOOLEAN,
    buy_cd BOOLEAN,
    guides BOOLEAN,
    initial_amount_plan DECIMAL(10, 2),
    pending_amount DECIMAL(10, 2),
    invoice_number VARCHAR(20),
    renew_amount DECIMAL(10, 2),
    payment_date DATE,
    start_date DATE,
    end_date DATE,
    comment_i TEXT,
    comment_c TEXT,
    sale_type VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Tabla Implementación
USE tandia;
CREATE TABLE Implementacion (
    implemention_id INT AUTO_INCREMENT PRIMARY KEY,
    ruc VARCHAR(255),
    user_id INT(4) ZEROFILL NOT NULL,
    contract_number VARCHAR(255),
    pass_sun_boolean BOOLEAN,
    pass_sun VARCHAR(255),
    pass_pass_sun VARCHAR(255),
    comercial_name VARCHAR(255),
    comercial_address VARCHAR(255),
    comercial_phone VARCHAR(255),
    comercial_email VARCHAR(255),
    taxes VARCHAR(255),
    secundary_user VARCHAR(255),
    pass_secundary_user VARCHAR(255),
    url_cd VARCHAR(500),
    pass_cd VARCHAR(255),
    expiration_cd DATE,
    gr_pass VARCHAR(255),
    gr_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Tabla Compañia
USE tandia;
CREATE TABLE company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT(4) ZEROFILL NOT NULL,
    ruc VARCHAR(255) NOT NULL,
    contract_number VARCHAR(255),
    support_email VARCHAR(255),
    support_pass VARCHAR(255),
	status_comp tinyint(4) ,
	status_train varchar(45),
	time_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Capacitaciones
USE tandia;
CREATE TABLE train (
    train_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT(4) ZEROFILL NOT NULL,
    ruc VARCHAR(255) NOT NULL,
    contract_number VARCHAR(255),
    url_train VARCHAR(255),
    date_train DATE,
    hour_train TIME,
    status_train varchar(45)
);

-- Tabla Seguimiento
USE tandia;
CREATE TABLE follow_up (
    follow_up_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT(4) ZEROFILL NOT NULL,
    time_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Detalle de Seguimiento
USE tandia;
CREATE TABLE detail_follow_up (
    detail_follow_up_id INT AUTO_INCREMENT PRIMARY KEY,
    follow_up_id INT,
    ruc_follow_up VARCHAR(255) NOT NULL,
    state_follow_up VARCHAR(255) NULL,
    reason_follow_up VARCHAR(255) NULL,
    detail_follow_up VARCHAR(255) NULL
);

-- Tabla Contacto de Seguimiento
USE tandia;
CREATE TABLE contact_follow_up (
    call_follow_up_id INT AUTO_INCREMENT PRIMARY KEY,
    detail_follow_up_id INT,
    type_contact VARCHAR(255),
    comment_contact VARCHAR(255),
	time_contact TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Seguimiento
USE tandia;
CREATE TABLE monthlySupport (
    monthlySupport_id INT AUTO_INCREMENT PRIMARY KEY,
	monthly_mm VARCHAR(255),
    year_yy VARCHAR(255)
);

-- Tabla Detalle de Seguimiento
USE tandia;
CREATE TABLE detail_monthly_support (
    detail_monthly_s_id INT AUTO_INCREMENT PRIMARY KEY,
    monthlySupport_id INT,
    contract_number INT,
	user_id INT(4) ZEROFILL NOT NULL,
    problem VARCHAR(255),
    status_case VARCHAR(50),
	module VARCHAR(50),
    derived VARCHAR(50),
    ticket VARCHAR(50),
    commentry TEXT,
    start_time TIME,
    time_derivative TIME,
    end_time TIME
);





-- YA

-- Tabla VentaEquipo
USE tandiagestion;
CREATE TABLE VentaEquipo (
    IdVentaE INT AUTO_INCREMENT PRIMARY KEY,
    EjecutivoComercial VARCHAR(50),
    Ruc VARCHAR(15),
    Motivo VARCHAR(100),
    FechaPago DATE,
    PagoInicial DECIMAL(10, 2),
    PagoTotal DECIMAL(10, 2),
    NroFacturaE VARCHAR(20),
    Departamento VARCHAR(50),
    Provincia VARCHAR(50),
    Distrito VARCHAR(50),
    DireccionEntrega VARCHAR(250),
    Referencia VARCHAR(250),
    LinkDireccion VARCHAR(250),
    DniRecibe VARCHAR(15),
    NombresRecibe VARCHAR(100),
    NumeroRecibe VARCHAR(15),
    MedioEnvio VARCHAR(50),
    Delivery BOOLEAN,
    PagoDelivery DECIMAL(10, 2),
    NroFacturaDelivery VARCHAR(20),
    FechaEnvio DATE,
    ResponsableEnvio VARCHAR(100),
    Comentarios TEXT,
    TipoVenta VARCHAR(50),
    Estado  VARCHAR(50)
);

CREATE TABLE EquipoVendido (
    IdEquipoV INT AUTO_INCREMENT PRIMARY KEY,
    NombreEquipo VARCHAR(100) NOT NULL,
    Cantidad INT NOT NULL,
    idVentaE INT NOT NULL,
    FOREIGN KEY (idVentaE) REFERENCES VentaEquipo(IdVentaE)
);

-- Insertar una venta en la tabla VentaEquipo
USE tandiagestion;
INSERT INTO VentaEquipo (
    EjecutivoComercial,
    Ruc,
    Motivo,
    FechaPago,
    PagoInicial,
    PagoTotal,
    NroFacturaE,
    Departamento,
    Provincia,
    Distrito,
    DireccionEntrega,
    Referencia,
    LinkDireccion,
    DniRecibe,
    NombresRecibe,
    NumeroRecibe,
    MedioEnvio,
    Delivery,
    PagoDelivery,
    NroFacturaDelivery,
    FechaEnvio,
    ResponsableEnvio,
    Comentarios,
    TipoVenta,
    Estado
) VALUES (
    'Jahir Sánchez',
    '74725493',
    'VENTA',
    '2023-10-08',
    500.00,
    1500.00,
    'FF01-002',
    'Lima',
    'Lima',
    'San Isidro',
    'Av. Principal 123',
    'Frente al parque',
    'https://maps.google.com/...',
    '12345678',
    'Juan Perez',
    '987654321',
    'OLVA',
    1,
    10.00,
    'DEL001',
    '2023-10-10',
    'Ana Rodriguez',
    'Comentario de la venta',
    'Venta al por mayor',
    'Pendiente'
);

-- Obtener el ID de la venta recién insertada
SET @idVenta = LAST_INSERT_ID();

-- Insertar dos productos asociados a la venta en la tabla EquipoVendido
INSERT INTO EquipoVendido (NombreEquipo, Cantidad, idVentaE) VALUES
    ('Producto 1', 2, @idVenta),
    ('Producto 2', 3, @idVenta);

-- Tabla Extra
USE tandiagestion;
CREATE TABLE Extra (
    IdExtra INT AUTO_INCREMENT PRIMARY KEY,
    EjecutivoComercial VARCHAR(100),
    Ruc VARCHAR(15),
    Motivo VARCHAR(15),
    Monto DECIMAL(10, 2),
    NroFactura VARCHAR(20),
    FechaPago DATE,
    Comentarios TEXT,
    TipoExtra VARCHAR(15),
    EstadoUpgrade VARCHAR(15),
    EstadoCapacitacion VARCHAR(15),
    EstadoCd VARCHAR(15)
);

-- Insertar un registro en la tabla Extra
USE tandiagestion;
INSERT INTO Extra (
    EjecutivoComercial,
    Ruc,
    Motivo,
    Monto,
    NroFactura,
    FechaPago,
    Comentarios,
    TipoExtra,
    EstadoUpgrade,
    EstadoCapacitacion,
    EstadoCd
) VALUES (
    'Jahir Sánchez',
    '1074725493',
    'UPGRADE',
    500.00,
    'FF01-001',
    '2023-10-08',
    'Comentario sobre el extra',
    'SISTEMA',
    'PENDIENTE',
    '',
    ''
    );



