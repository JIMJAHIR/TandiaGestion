-- Tabla Usuario
USE tandiagestion;
CREATE TABLE Usuario (
    IdUsuario INT(4) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(50) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    NombreCompleto VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Rol VARCHAR(50) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Asistencia
USE tandiagestion;
CREATE TABLE Asistencia (
    IdAsistencia INT AUTO_INCREMENT PRIMARY KEY,
    IdUsuario INT(4) ZEROFILL NOT NULL,
    FechaEntrada DATETIME,
    FechaSalida DATETIME,
    EstadoAsistencia VARCHAR(20) NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Tabla Roles
USE tandiagestion;
CREATE TABLE Roles (
    IdRol INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100)
);

-- Tabla NuevoCliente
USE tandiagestion;
CREATE TABLE NuevoCliente (
    IdNuevoCliente INT AUTO_INCREMENT PRIMARY KEY,
    AreaComercial VARCHAR(50),
    EjecutivoComercial VARCHAR(50),
    TipoCierre VARCHAR(50),
    Ruc VARCHAR(15),
    RazonSocial VARCHAR(100),
    RepresentanteLegal VARCHAR(100),
    NroDoc VARCHAR(15),
    Departamento VARCHAR(50),
    DireccionFiscal VARCHAR(250),
    Rubro VARCHAR(50),
    NombreCliente VARCHAR(100),
    CorreoCliente VARCHAR(100),
    TelefonoCliente VARCHAR(20),
    NombreImplementador VARCHAR(100),
    CorreoImplementador VARCHAR(100),
    NumeroImplementador VARCHAR(15),
    Plan VARCHAR(50),
    TipoContrato VARCHAR(50),
    NroTiendas INT,
    TiendasConf VARCHAR(100),
    NroUsuario INT,
    UsuariosConf VARCHAR(100),
    FE BOOLEAN,
    CompraCD BOOLEAN,
    Guias BOOLEAN,
    MontoInicialPlan DECIMAL(10, 2),
    MontoPendiente DECIMAL(10, 2),
    NroFactura VARCHAR(20),
    MontoRenovar DECIMAL(10, 2),
    FechaPago DATE,
    FechaInicioC DATE,
    FechaFinC DATE,
    ComentarioI TEXT,
    ComentarioC TEXT,
    TipoVenta VARCHAR(50)
);

INSERT INTO NuevoCliente (
    AreaComercial,
    EjecutivoComercial,
    TipoCierre,
    Ruc,
    RazonSocial,
    RepresentanteLegal,
    NroDoc,
    Departamento,
    DireccionFiscal,
    Rubro,
    NombreCliente,
    CorreoCliente,
    TelefonoCliente,
    NombreImplementador,
    CorreoImplementador,
    NumeroImplementador,
    Plan,
    TipoContrato,
    NroTiendas,
    TiendasConf,
    NroUsuario,
    UsuariosConf,
    FE,
    CompraCD,
    Guias,
    MontoInicialPlan,
    MontoPendiente,
    NroFactura,
    MontoRenovar,
    FechaPago,
    FechaInicioC,
    FechaFinC,
    ComentarioI,
    ComentarioC,
    TipoVenta
) VALUES (
    'OPERACIONES',
    'Jahir Sánchez',
    'VIRTUAL',
    '1111',
    'Jimmy Jahir Sánchez Ramón',
    'Jimmy Jahir Sánchez Ramón',
    '74725493',
    'Lambayeque',
    'San Agustin #280',
    'Tecnología',
    'Jimmy Jahir Sánchez Ramón',
    'correo@cliente.com',
    '935592320',
    '',
    '',
    '',
    'FULL',
    'ANUAL',
    3, -- Número de Tiendas
    '2',
    0, -- Número de Usuario
    '5',
    TRUE, -- FE
    FALSE, -- CompraCD
    FALSE, -- Guias
    1000.00, -- Monto Inicial del Plan
    0.00, -- Monto Pendiente
    'FF01-001', -- Número de Factura
    1000.00, -- Monto a Renovar
    '2023-10-15', -- Fecha de Pago (ejemplo: 15 de octubre de 2023)
    '2023-10-01', -- Fecha de Inicio del Contrato (ejemplo: 1 de octubre de 2023)
    '2024-10-01', -- Fecha de Fin del Contrato (ejemplo: 1 de octubre de 2024)
    'Comentario de Implementación',
    'Comentario de Comercial',
    'SISTEMA'
);

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

-- Tabla Implementación
USE tandiagestion;
CREATE TABLE Implementacion (
    IdImplementacion INT AUTO_INCREMENT PRIMARY KEY,
    Ruc VARCHAR(15) NOT NULL,
    Contrato VARCHAR(10),
    ClaveSolB BOOLEAN,
    ClaveSol VARCHAR(50),
    ContraseniaSol VARCHAR(50),
    NombreComercial VARCHAR(100),
    DireccionE VARCHAR(250),
    NroTelefonoE VARCHAR(15),
    EmailE VARCHAR(100),
    Impuesto VARCHAR(50),
    UsuarioSec VARCHAR(20),
    ContraseniaSec VARCHAR(20),
    LinkCD VARCHAR(500),
    ContraseniaCD VARCHAR(20),
    VencimientoCD DATE,
    ClaveGR VARCHAR(100),
    IdGR VARCHAR(100)
);

-- Tabla Compañia
USE tandiagestion;
CREATE TABLE Compañia (
    CompanyId INT AUTO_INCREMENT PRIMARY KEY,
    RUC VARCHAR(15) NOT NULL,
    Contrato VARCHAR(10),
    EmailSoporte VARCHAR(100),
    ContraseniaSoporte VARCHAR(50)
);


