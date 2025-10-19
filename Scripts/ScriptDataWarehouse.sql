/* Creación DB DataWareHouse
 * Creación Dimensiones*/

CREATE DATABASE DataWareHouse;

-- Crear Dimensión Departamento
-- Camel Case

CREATE TABLE DataWareHouse.dbo.DIM_Departamentos (
	CodDpto tinyint NOT NULL,
	NomDpto varchar(56) NOT NULL,
	Latitud float NOT NULL,
	Longitud float NOT NULL
);

-- Creación Primary Key

ALTER TABLE DataWareHouse.dbo.DIM_Departamentos ADD CONSTRAINT DIM_Departamentos_PK PRIMARY KEY (CodDpto);


-- Prueba de Insert, Select y Delete

INSERT	INTO DataWareHouse.dbo.DIM_Departamentos
(CodDpto,NomDpto,Latitud,Longitud)
VALUES
(1,'Prueba 1',1.1,2.1)

SELECT * FROM DIM_Departamentos;

DELETE FROM DataWareHouse.dbo.DIM_Departamentos
WHERE CodDpto = 1

-- Insertar datos de una tabla a otra

INSERT INTO DataWareHouse.dbo.DIM_Departamentos 
(CodDpto,NomDpto,Latitud,Longitud)
SELECT COD_DPTO,NOM_DPTO,LATITUD,LONGITUD
FROM Datalake.dbo.DL_Departamentos

SELECT * FROM DataWareHouse.dbo.DIM_Departamentos

-- Crear Tabla Municipios

CREATE TABLE DataWareHouse.dbo.DIM_Municipios (
	CodDpto tinyint NOT NULL,
	CodMpio int NOT NULL,
	NomMpio varchar(27) NOT NULL,
	Tipo varchar(22) NOT NULL,
	Latitud float NOT NULL,
	Longitud float NOT NULL,
);

-- Asignar PK Municipios


-- Asignar FK Municipios -> Departamentos

ALTER TABLE DataWareHouse.dbo.DIM_Municipios ADD CONSTRAINT DIM_Municipios_DIM_Departamentos_FK FOREIGN KEY (CodDpto) REFERENCES DataWareHouse.dbo.DIM_Departamentos(CodDpto);

-- Prueba Insertar en Municipios

INSERT INTO DataWareHouse.dbo.DIM_Municipios 
(CodDpto,CodMpio,NomMpio,Tipo,Latitud,Longitud)
VALUES
(5,51,'Municipio Prueba 1','Tipo1',1.1,2.1)

SELECT * FROM DIM_Municipios

INSERT INTO DataWareHouse.dbo.DIM_Municipios 
(CodDpto,CodMpio,NomMpio,Tipo,Latitud,Longitud)
VALUES
(1,11,'Municipio Prueba 2','Tipo1',1.2,2.2)

SELECT * FROM DIM_Municipios

INSERT INTO DataWareHouse.dbo.DIM_Municipios 
(CodDpto,CodMpio,NomMpio,Tipo,Latitud,Longitud)
VALUES
(8,81,'Municipio Prueba 2','Tipo1',1.2,2.2)

SELECT * FROM DIM_Municipios

DELETE FROM DataWareHouse.dbo.DIM_Municipios 

-- Insertar datos de una tabla a otra 'Municipios'

INSERT INTO DataWareHouse.dbo.DIM_Municipios 
(CodDpto,CodMpio,NomMpio,Tipo,Latitud,Longitud)
SELECT COD_DPTO,COD_MPIO,NOM_MPIO,TIPO,LATITUD,LONGITUD
FROM Datalake.dbo.DL_Municipios

SELECT * FROM DataWareHouse.dbo.DIM_Municipios

-- Identificar otras dimensiones en la tabla de hechos

-- Crear tabla Zonas

CREATE TABLE DataWareHouse.dbo.DIM_Zonas (
	IdZona tinyint IDENTITY(1,1) NOT NULL,
	NomZona varchar(100) NOT NULL,
	CONSTRAINT DIM_Zonas_PK PRIMARY KEY (IdZona)
);

-- Revisar extensión de la columna NomZona

SELECT DISTINCT ZONA, LEN(ZONA)
FROM Datalake.dbo.DL_Homicidios
ORDER BY ZONA ASC

-- Ajustar tamaño de la columna en la Tabla DIM_Zonas

ALTER TABLE DataWareHouse.dbo.DIM_Zonas ALTER COLUMN NomZona varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

-- Insertar Zonas de Homicidios a Zona

INSERT INTO DataWareHouse.dbo.DIM_Zonas 
(NomZona)
SELECT DISTINCT ZONA
FROM Datalake.dbo.DL_Homicidios
ORDER BY ZONA ASC

-- Crear Tabla Sexo

CREATE TABLE DataWareHouse.dbo.DIM_Sexos (
	IdSexo tinyint IDENTITY(1,1) NOT NULL,
	nomSexo varchar(100) NOT NULL,
	CONSTRAINT DIM_Sexo_PK PRIMARY KEY (IdSexo)
);

-- Revisar extensión de la columna NomZona

SELECT DISTINCT SEXO, LEN(SEXO)
FROM Datalake.dbo.DL_Homicidios
ORDER BY SEXO ASC

-- Ajustar tamaño de la columna en la Tabla DIM_Sexos

ALTER TABLE DataWareHouse.dbo.DIM_Sexos ALTER COLUMN NomSexo varchar(14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

-- Insertar Sexos de Homicidio a Sexos

INSERT INTO DataWareHouse.dbo.DIM_Sexos 
(NomSexo)
SELECT DISTINCT SEXO
FROM Datalake.dbo.DL_Homicidios
ORDER BY SEXO ASC

-- Crear Tabla Homicidios (Ya es la de Hechos)

CREATE TABLE DataWareHouse.dbo.FAC_Homicidios (
	IdHomicios int IDENTITY(1,1) NOT NULL,
	FechaHecho date NOT NULL,
	CodMpio int NOT NULL,
	IdZona tinyint NOT NULL,
	IdSexo tinyint NOT NULL,
	Cantidad int NOT NULL
);

-- Crear PK Homicidios

ALTER TABLE DataWareHouse.dbo.FAC_Homicidios ADD CONSTRAINT FAC_Homicidios_PK PRIMARY KEY (IdHomicios);

-- Crear FK Homicios vs las 3 tablitas

ALTER TABLE DataWareHouse.dbo.FAC_Homicidios ADD CONSTRAINT FAC_Homicidios_DIM_Municipios_FK FOREIGN KEY (CodMpio) REFERENCES DataWareHouse.dbo.DIM_Municipios(CodMpio);
ALTER TABLE DataWareHouse.dbo.FAC_Homicidios ADD CONSTRAINT FAC_Homicidios_DIM_Zonas_FK FOREIGN KEY (IdZona) REFERENCES DataWareHouse.dbo.DIM_Zonas(IdZona);
ALTER TABLE DataWareHouse.dbo.FAC_Homicidios ADD CONSTRAINT FAC_Homicidios_DIM_Sexos_FK FOREIGN KEY (IdSexo) REFERENCES DataWareHouse.dbo.DIM_Sexos(IdSexo);

-- Validaciòn y creación de la dimensión Tiempo

-- Conteo de eventos por día
SELECT FECHA_HECHO, COUNT(FECHA_HECHO )
FROM Datalake.dbo.DL_Homicidios
GROUP BY FECHA_HECHO

-- Traer las fechas únicas
SELECT DISTINCT FECHA_HECHO FROM Datalake.dbo.DL_Homicidios
ORDER BY FECHA_HECHO ASC

-- Contar las fechas únicas
SELECT COUNT(DISTINCT FECHA_HECHO) FROM Datalake.dbo.DL_Homicidios

-- Contar los datos totales de homicidios
SELECT COUNT(*)
FROM Datalake.dbo.DL_Homicidios

-- Traer las fechas únicas
SET DATEFIRST 1;

SELECT DISTINCT FECHA_HECHO, 
YEAR(FECHA_HECHO), 
MONTH(FECHA_HECHO), 
DAY(FECHA_HECHO),
DATEPART(quarter,FECHA_HECHO),
DATEPART(weekday,FECHA_HECHO),
DATEPART(week,FECHA_HECHO)
FROM Datalake.dbo.DL_Homicidios
ORDER BY FECHA_HECHO ASC

-- Crear Tabla de Tiempo

CREATE TABLE DataWareHouse.dbo.DIM_Tiempo (
	FechaHecho date NOT NULL,
	Annio int NOT NULL,
	IdMes tinyint NOT NULL,
	Dia tinyint NOT NULL,
	IdTrimestre tinyint NOT NULL,
	IdDiaSemana tinyint NOT NULL,
	Semana tinyint NOT NULL,
	CONSTRAINT DIM_Tiempo_PK PRIMARY KEY (FechaHecho)
);

-- Crear dimensión DIM_Meses

CREATE TABLE DataWareHouse.dbo.DIM_Meses (
	IdMes tinyint IDENTITY(1,1) NOT NULL,
	NomMes varchar(10) NOT NULL,
	CONSTRAINT DIM_Mes_PK PRIMARY KEY (IdMes)
);

-- Crear dimensión DIM_Trimestre

CREATE TABLE DataWareHouse.dbo.DIM_Trimestre (
	IdTrimestre tinyint IDENTITY(1,1) NOT NULL,
	NomTrimestre varchar(11) NOT NULL,
	CONSTRAINT DIM_Trimestre_PK PRIMARY KEY (IdTrimestre)
);

-- Crear dimensión DIM_DiaSemana

CREATE TABLE DataWareHouse.dbo.DIM_DiaSemana (
	IdDiaSemana tinyint IDENTITY(1,1) NOT NULL,
	NomDiaSemana varchar(9) NOT NULL,
	CONSTRAINT DIM_DiaSemana_PK PRIMARY KEY (IdDiaSemana)
);

-- Insertar datos Meses

INSERT INTO DataWareHouse.dbo.DIM_Meses
(NomMes)
VALUES
('Enero'),
('Febrero'),
('Marzo'),
('Abril'),
('Mayo'),
('Junio'),
('Julio'),
('Agosto'),
('Septiembre'),
('Octubre'),
('Noviembre'),
('Diciembre')

-- Insertar datos Trimestre

INSERT INTO DataWareHouse.dbo.DIM_Trimestre
(NomTrimestre)
VALUES
('Trimestre 1'),
('Trimestre 2'),
('Trimestre 3'),
('Trimestre 4')

-- Insertar datos DiaSemana

INSERT INTO DataWareHouse.dbo.DIM_DiaSemana
(NomDiaSemana)
VALUES
('Lunes'),
('Martes'),
('Miércoles'),
('Jueves'),
('Viernes'),
('Sábado'),
('Domingo')

-- Insertar valores en DIM_Tiempo
SET DATEFIRST 1;

INSERT INTO DIM_Tiempo
(FechaHecho,Annio,IdMes,Dia,IdTrimestre,IdDiaSemana,Semana)
SELECT DISTINCT FECHA_HECHO, 
YEAR(FECHA_HECHO), 
MONTH(FECHA_HECHO), 
DAY(FECHA_HECHO),
DATEPART(quarter,FECHA_HECHO),
DATEPART(weekday,FECHA_HECHO),
DATEPART(week,FECHA_HECHO)
FROM Datalake.dbo.DL_Homicidios
ORDER BY FECHA_HECHO ASC

-- Crear FK Tiempo de Variables de tiempo

ALTER TABLE DataWareHouse.dbo.DIM_Tiempo ADD CONSTRAINT DIM_Tiempo_DIM_Meses_FK FOREIGN KEY (IdMes) REFERENCES DataWareHouse.dbo.DIM_Meses(IdMes);
ALTER TABLE DataWareHouse.dbo.DIM_Tiempo ADD CONSTRAINT DIM_Tiempo_DIM_Trimestre_FK FOREIGN KEY (IdTrimestre) REFERENCES DataWareHouse.dbo.DIM_Trimestre(IdTrimestre);
ALTER TABLE DataWareHouse.dbo.DIM_Tiempo ADD CONSTRAINT DIM_Tiempo_DIM_DiaSemana_FK FOREIGN KEY (IdDiaSemana) REFERENCES DataWareHouse.dbo.DIM_DiaSemana(IdDiaSemana);

-- Crear FK Homicidios de Tiempo

ALTER TABLE DataWareHouse.dbo.FAC_Homicidios ADD CONSTRAINT FAC_Homicidios_DIM_Tiempo_FK FOREIGN KEY (FechaHecho) REFERENCES DataWareHouse.dbo.DIM_Tiempo(FechaHecho);

-- Insertar datos en FAC-Homicidios consultando los ID de las dependencias

INSERT INTO DataWareHouse.dbo.FAC_Homicidios 
(FechaHecho, CodMpio, IdZona, IdSexo, Cantidad)
SELECT FECHA_HECHO
	, COD_MUNI
	, (SELECT IdZona FROM DataWareHouse.dbo.DIM_Zonas WHERE NomZona = H.ZONA) AS IdZona
	, (SELECT IdSexo FROM DataWareHouse.dbo.DIM_Sexos WHERE NomSexo = H.SEXO) AS IdSexo
	, CANTIDAD
FROM DataLake.dbo.DL_Homicidios AS H
