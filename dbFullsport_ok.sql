CREATE DATABASE dbFullsport_ok
USE dbFullsport_ok

CREATE TABLE Usuario (
id_usuario INT PRIMARY KEY IDENTITY,
nom_usuario VARCHAR(50),
email_usuario VARCHAR(50),
contrasena VARCHAR(50),
tipo_usuario CHAR(1) -- 'A' para administrador, 'C' para cliente, 'D' para domiciliario, etc.
)

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Juan Pérez', 'admin1@example.com', 'admin123', 'A')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('María García', 'admin2@example.com', 'admin456', 'A')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Luis Martínez', 'admin3@example.com', 'admin789', 'A')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Carlos Sánchez', 'cliente1@example.com', 'cliente123', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Laura Gómez', 'cliente2@example.com', 'cliente456', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Ana Rodríguez', 'cliente3@example.com', 'cliente789', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Pedro Díaz', 'cliente4@example.com', 'cliente101112', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('María López', 'cliente5@example.com', 'cliente131415', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('José Martínez', 'cliente6@example.com', 'cliente161718', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Sofía Hernández', 'cliente7@example.com', 'cliente192021', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Juan García', 'cliente8@example.com', 'cliente222324', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Lucía Rodríguez', 'cliente9@example.com', 'cliente252627', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Pablo Fernández', 'cliente10@example.com', 'cliente282930', 'C')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Pedro Rodríguez', 'pedro@example.com', 'contraseña345', 'D')

INSERT INTO Usuario (nom_usuario, email_usuario, contrasena, tipo_usuario)
VALUES ('Ana López', 'ana@example.com', 'contraseña678', 'D')


CREATE TABLE Administrador (
id_admin INT PRIMARY KEY IDENTITY,
nombre VARCHAR(50),
email_adm VARCHAR(50),
FOREIGN KEY (id_admin) REFERENCES Usuario(id_usuario)
)

INSERT INTO Administrador (nombre, email_adm)
VALUES ('Juan Pérez', 'admin1@example.com')

INSERT INTO Administrador (nombre, email_adm)
VALUES ('María García', 'admin2@example.com')

INSERT INTO Administrador (nombre, email_adm)
VALUES ('Luis Martínez', 'admin3@example.com')


CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY IDENTITY,
nombre_cliente VARCHAR(50),
email_cliente VARCHAR(50),
tel_cliente BIGINT,
FOREIGN KEY (id_cliente) REFERENCES Usuario(id_usuario)
)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Carlos Sánchez', 'cliente1@example.com', 1234567890)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Laura Gómez', 'cliente2@example.com', 1234567891)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Ana Rodríguez', 'cliente3@example.com', 1234567892)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Pedro Díaz', 'cliente4@example.com', 1234567893)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('María López', 'cliente5@example.com', 1234567894)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('José Martínez', 'cliente6@example.com', 1234567895)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Sofía Hernández', 'cliente7@example.com', 1234567896)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Juan García', 'cliente8@example.com', 1234567897)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Lucía Rodríguez', 'cliente9@example.com', 1234567898)

INSERT INTO Cliente (nombre_cliente, email_cliente, tel_cliente)
VALUES ('Pablo Fernández', 'cliente10@example.com', 1234567899)


CREATE TABLE Domiciliario (
id_domi INT PRIMARY KEY IDENTITY,
nombre_domi VARCHAR(50),
email_domi VARCHAR(50),
tel_domi BIGINT,
FOREIGN KEY (id_domi) REFERENCES Usuario(id_usuario)
)

INSERT INTO Domiciliario (nombre_domi, email_domi, tel_domi)
VALUES ('Roberto Ramírez', 'domiciliario1@example.com', 1234567800)

INSERT INTO Domiciliario (nombre_domi, email_domi, tel_domi)
VALUES ('Elena Gutiérrez', 'domiciliario2@example.com', 1234567801)


CREATE TABLE Compra (
id_compra INT PRIMARY KEY IDENTITY,
fecha_compra DATE, 
valor_compra FLOAT
)

INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-01', 150000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-02', 180000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-03', 210000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-04', 135000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-05', 200000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-06', 175000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-07', 220000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-08', 195000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-09', 230000.00)
INSERT INTO Compra (fecha_compra, valor_compra) VALUES ('2024-03-10', 185000.00)


CREATE TABLE Factura (
id_fact INT PRIMARY KEY IDENTITY,
fecha_fact DATE,
total_fact FLOAT,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-01', 150000.00, 1)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-02', 180000.00, 2)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-03', 210000.00, 3)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-04', 135000.00, 4)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-05', 200000.00, 5)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-06', 175000.00, 6)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-07', 220000.00, 7)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-08', 195000.00, 8)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-09', 230000.00, 9)
INSERT INTO Factura (fecha_fact, total_fact, id_cliente) VALUES ('2024-03-10', 185000.00, 10)

CREATE TABLE Producto (
cod_prod INT PRIMARY KEY IDENTITY,
nombre_producto VARCHAR (50),
categoria VARCHAR(50),
precio FLOAT,
descripcion TEXT,
calorias INT
)
select*from producto
INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('whey gold 2lb', 'proteína', 220000, 'NITRO TECH 100% Whey Gold está diseñado para todos, desde hombres y mujeres activos y entusiastas del ejercicio físico hasta atletas de alto rendimiento, levantadores de pesas, crossfitters, culturistas, entre otros', 250)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('iso pure 3lb', 'proteína', 190000, 'sopure contiene 50 gramos de 100% Proteína de suero de leche.Es totalmente limpia, libre de cualquier impureza, libre de lactosa y enriquecida con 4.5 grs de glutamina. Tiene 0% de azúcar y es fácil de mezclar', 180)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('iso 100 3lb', 'proteína', 110999, 'ISO-100 tiene 25g de proteína 5.5 gramos de BCAAs 0g de carbohidratos 0g de grasas 0g de azucares Aminoacidos por servicio', 220)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('cell tech 3 lb', 'creatina', 220000, 'es una fórmula de creatina científicamente diseñada para los "hardgainers" que tienen dificultades para aumentar el tamaño y la fuerza muscular', 180)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('aminox 1lb', 'proteína', 250900, 'suplemento con fórmula de BCAA efervescente. Utiliza el sistema de entrega efervescente formulado con aminoácidos, BCAAs, EAAs, vitamina D y malato de citrulina son absorbidos más rápidamente', 150)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('nitro tech 5lb', 'proteína', 323000,'El servicio de NITROTECH 100% WHEY GOLD ofrece 24gr de una proteina ultra-premium y micofiltrada. Con péptidos de proteína y proteina aislada de suero de leche', 120)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('crea stack 1,3lb', 'creatina', 132000, 'Contiene 3g Monohidrato de Creatina, 1g HMB (hidroximetilbutirato), 20mg sulfato de vanadio, 50mg ácido alfa lipoico. Cero Azúcar', 100)

INSERT INTO Producto (nombre_producto, categoria, precio, descripcion, calorias) 
VALUES ('megaplex creatine power 2lb', 'creatina', 100000, 'creatina micronizada. Facilita una absorción más eficiente, asegurando que tu cuerpo aproveche al máximo sus beneficios', 1050)




CREATE TABLE Membresia (
id_cliente INT PRIMARY KEY,
tipo_membresia VARCHAR(20) NOT NULL, -- 'Premium' o 'Estándar'
fecha_inicio DATE NOT NULL,
fecha_fin DATE,
valor_pagado DECIMAL(10, 2) NOT NULL, -- Valor pagado por la membresía
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
)


INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (1, 'Premium', '2024-03-01', '2025-03-01', 100000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (2, 'Estándar', '2024-03-02', '2025-03-02', 20000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (3, 'Premium', '2024-03-03', '2025-03-03', 100000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (4, 'Estándar', '2024-03-04', '2025-03-04', 20000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (5, 'Premium', '2024-03-05', '2025-03-05', 100000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (6, 'Estándar', '2024-03-06', '2025-03-06', 20000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (7, 'Premium', '2024-03-07', '2025-03-07', 100000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (8, 'Estándar', '2024-03-08', '2025-03-08', 20000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (9, 'Premium', '2024-03-09', '2025-03-09', 100000.00)

INSERT INTO Membresia (id_cliente, tipo_membresia, fecha_inicio, fecha_fin, valor_pagado) 
VALUES (10, 'Estándar', '2024-03-10', '2025-03-10', 20000.00)



CREATE TABLE Inventario (
id_inventario INT PRIMARY KEY IDENTITY,
id_producto INT,
fecha_inventario DATETIME DEFAULT GETDATE(), -- Utiliza GETDATE() para obtener la fecha actual
cantidad_disponible INT,
id_admin INT,
FOREIGN KEY (id_producto) REFERENCES Producto(cod_prod),
FOREIGN KEY (id_admin) REFERENCES Administrador(id_admin)
)

INSERT INTO Inventario (id_producto, cantidad_disponible, id_admin) 
VALUES (1, 50, 1)

INSERT INTO Inventario (id_producto, cantidad_disponible, id_admin) 
VALUES (2, 100, 1)

INSERT INTO Inventario (id_producto, cantidad_disponible, id_admin) 
VALUES (3, 75, 1)

INSERT INTO Inventario (id_producto, cantidad_disponible, id_admin) 
VALUES (4, 60, 1)

INSERT INTO Inventario (id_producto, cantidad_disponible, id_admin) 
VALUES (5, 80, 1)


CREATE TABLE Cliente_Compra(
id_cliente INT,
id_compra INT, 
CONSTRAINT fk_idcliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
CONSTRAINT fk_idcompra FOREIGN KEY (id_compra) REFERENCES Compra(id_compra))

CREATE TABLE Producto_Compra (
cod_prod INT,
id_compra INT, 
CONSTRAINT fk_codprod FOREIGN KEY (cod_prod) REFERENCES Producto(cod_prod),
CONSTRAINT fk_idcompra1 FOREIGN KEY (id_compra) REFERENCES Compra(id_compra))

CREATE TABLE Factura_Cliente (
id_fact INT,
id_cliente INT,
CONSTRAINT fk_idfact FOREIGN KEY (id_fact) REFERENCES Factura(id_fact),
CONSTRAINT fk_idcliente1 FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente))

CREATE TABLE Producto_Factura (
cod_prod INT,
id_fact INT,
CONSTRAINT fk_codprod1 FOREIGN KEY (cod_prod) REFERENCES Producto(cod_prod),
CONSTRAINT fk_factura FOREIGN KEY (id_fact) REFERENCES Factura(id_fact))

CREATE TABLE Inventario_Producto (
id_inventario INT,
cod_prod INT,
CONSTRAINT fk_invent FOREIGN KEY (id_inventario) REFERENCES Inventario(id_inventario),
CONSTRAINT fk_codigop FOREIGN KEY (cod_prod) REFERENCES Producto(cod_prod))

CREATE TABLE Domiciliario_Compra (
id_domi INT,
id_compra INT,
estado_pedido VARCHAR(50)
CONSTRAINT fk_domi FOREIGN KEY (id_domi) REFERENCES Domiciliario(id_domi),
CONSTRAINT fk_compra FOREIGN KEY (id_compra) REFERENCES Compra(id_compra))

CREATE TABLE Administrador_Compra(
id_admin INT,
id_compra INT,
CONSTRAINT fk_adm FOREIGN KEY (id_admin) REFERENCES Administrador(id_admin),
CONSTRAINT fk_compraID FOREIGN KEY (id_compra) REFERENCES Compra(id_compra))

CREATE TABLE Usuario_Admin(
id_usuario INT,
id_admin INT,
CONSTRAINT fk_UsuarioID FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
CONSTRAINT fk_adminis FOREIGN KEY (id_admin) REFERENCES Administrador(id_admin))