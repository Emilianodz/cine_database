SHOW DATABASES;

CREATE DATABASE SIS_RESERVACIONES;

USE SIS_RESERVACIONES;

CREATE TABLE RESERVACIONES (
ID INT PRIMARY KEY AUTO_INCREMENT,
ID_FUNCION INT NOT NULL,
ID_CLIENTE INT NOT NULL,
FOREIGN KEY (ID_FUNCION) REFERENCES FUNCIONES(ID),
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID)
);

SHOW TABLES;

DESC RESERVACIONES;

