# techstore-bi--FreddyJimenez.

Proyecto: Solución de Business Intelligence para "TechStore"

# Avance 1 — Modelado de Sistemas Operacionales (OLTP)

**Autor:** Freddy Cristhian Jiménez Dávila

## Descripción

Este repositorio contiene el modelado de los sistemas operacionales de la empresa TechStore, incluye el diseño de la colección productos en MongoDB (NoSQL) y el esquema relacional de ventas en MySQL junto al script para la creación de sus tablas respectivas(SQL).  
También se agregan los análisis de calidad de datos y la justificación del modelo dual (SQL y NoSQL).

## Archivos incluidos

- `operaciones_productos.mongodb` — Script con la creación validación e inserciones de datos dentro de la colección `productos` en MongoDB.
- `schema_ventas.sql` — Script SQL con la creación de las tablas, relaciones y claves foráneas del modelo relacional de ventas.
- `modelo_relacional_ventas.png` — Diagrama Entidad-Relación del sistema relacional.
- `INFORME_U1.md` — Informe con el análisis de calidad de datos y justificación del modelo dual.
- `README.md` — este archivo.

## Cómo ejecutar los scripts (instrucciones para el revisor)

### MongoDB
1. Instalar MongoDB Compass.
2. Conectarse al clúster de Mongo Atlas desde Visual Studio Code y abrir MySQL de XAMPP.
3. Ejecutar el script `operaciones_productos.mongodb` en la base de datos `techstore_inventory`y el script schema_ventas.sql dentro de la base de datos de XAMPP.
