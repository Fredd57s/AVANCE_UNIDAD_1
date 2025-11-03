CREATE DATABASE IF NOT EXISTS techstore_sales
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE techstore_sales;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    ciudad VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    fecha_venta DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_sucursal
        FOREIGN KEY (id_sucursal)
        REFERENCES sucursales(id_sucursal)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    sku_producto VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_venta_momento DECIMAL(10,2) NOT NULL CHECK (precio_venta_momento >= 0),
    CONSTRAINT fk_venta
        FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;
