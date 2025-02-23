-- CREACION DE TABALS
CREATE TABLE clientes (
  cliente_Id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
  pedido_Id INT PRIMARY KEY,
  cli_Id INT REFERENCES clientes(cliente_Id) NOT NULL,
  fecha DATE DEFAULT CURRENT_DATE,
  total DECIMAL NOT NULL
);

CREATE TABLE productos(
  producto_Id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  precio DECIMAL NOT  NULL
);
 CREATE TABLE detalles (
  detalle_Id INT PRIMARY KEY,
  ped_Id INT REFERENCES pedidos(pedido_Id) NOT NULL,
  prod_Id INT REFERENCES productos(producto_Id) NOT NULL,
  cantidad INT NOT NULL
);
--INSERCION EN TABLAS
INSERT INTO clientes (cliente_Id, nombre, email) VALUES
(1, 'Ana Pérez', 'ana.perez@gmail.com'),
(2, 'Carlos López', 'carlos.lopez@yahoo.com'),
(3, 'María García', 'maria.garcia@hotmail.com'),
(4, 'Juan Martínez', 'juan.martinez@gmail.com'),
(5, 'Laura Fernández', 'laura.fernandez@outlook.com');


INSERT INTO pedidos (pedido_Id, cli_Id, fecha, total) VALUES
(1, 1, '2025-01-15', 150.75),
(2, 2, '2025-01-20', 200.50),
(3, 3, '2025-01-25', 300.00),
(4, 4, '2025-02-01', 450.25),
(5, 5, '2025-02-10', 120.00);


INSERT INTO productos (producto_Id, nombre, precio) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 750.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 300.00),
(5, 'Teclado', 50.00);


INSERT INTO detalles (detalle_Id, ped_Id, prod_Id, cantidad) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 4, 3),
(5, 5, 5, 4);

-- mostrar tablas
SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM productos;
SELECT * FROM detalles;


--INSERTAR NUEVO CLINETE 
INSERT INTO clientes (cliente_Id, nombre, email) VALUES
(6, 'Pedro Sánchez', 'pedro.sanchez@example.com');
SELECT * FROM clientes;


--INSERTAR PEDIDOS PARA NUEVO CLIENTE
INSERT INTO pedidos (pedido_Id, cli_Id, fecha, total) VALUES
(6, 6, '2025-02-15', 1000.00),
(7, 6, '2025-02-16', 750.00),
(8, 6, '2025-02-17', 500.00),
(9, 6, '2025-02-18', 300.00),
(10, 6, '2025-02-19', 50.00);

SELECT * FROM pedidos;

--DETALLES DE PEDIDOS NUEVOS

INSERT INTO detalles (detalle_Id, ped_Id, prod_Id, cantidad) VALUES
(6, 6, 1, 1),
(7, 7, 2, 1),
(8, 8, 3, 1),
(9, 9, 4, 1),
(10, 10, 5, 1);

SELECT * FROM detalles;






--1 Obtén todos los clientes cuyo nombre empieza con 'A'
SELECT * FROM clientes WHERE nombre LIKE 'A%';

--2 Muestra solo los nombres y correos electrónicos de los clientes.
SELECT nombre, email FROM clientes;

--3 Encuentra todos los productos que han sido pedidos
SELECT nombre  FROM productos;

--4 Encuentra los clientes que han realizado pedidos y aquellos que tienen un 
--correo electrónico que contiene 'gmail'00.
SELECT c. * FROM clientes c
LEFT JOIN pedidos p ON c.cliente_Id = p.cli_Id
WHERE c.email LIKE '%gmail%';

--5 Diferencia: Encuentra los productos que no han sido pedidos.
SELECT p.* FROM productos p
WHERE p.producto_Id NOT IN (SELECT producto_Id FROM pedidos);

--6 Producto Cartesiano: Muestra todas las combinaciones posibles de clientes y productos
SELECT * FROM clientes AS a
CROSS JOIN productos AS p; 

--7 Join Natural: Muestra los detalles de los pedidos junto con la información del cliente
SELECT cliente_Id, detalle_Id
FROM clientes NATURAL JOIN detalles


