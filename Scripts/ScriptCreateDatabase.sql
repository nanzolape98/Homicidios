-- Creación de la BD
CREATE DATABASE Datalake;

-- Creación de las tablas

CREATE TABLE DataLake.dbo.DL_Departamentos (
	COD_DPTO tinyint NULL,
	NOM_DPTO varchar(56) NULL,
	LATITUD float NULL,
	LONGITUD float NULL,
	[Geo Departamento] varchar(32) NULL
);

CREATE TABLE DataLake.dbo.DL_Municipios (
	COD_DPTO tinyint NULL,
	NOM_DPTO varchar(56) NULL,
	COD_MPIO int NULL,
	NOM_MPIO varchar(27) NULL,
	TIPO varchar(22) NULL,
	LATITUD float NULL,
	LONGITUD float NULL,
	GeoMunicipio varchar(38) NULL
);

CREATE TABLE DataLake.dbo.DL_Homicidios (
	FECHA_HECHO date NULL,
	COD_DEPTO tinyint NULL,
	DEPARTAMENTO varchar(18) NULL,
	COD_MUNI int NULL,
	MUNICIPIO varchar(27) NULL,
	ZONA varchar(6) NULL,
	SEXO varchar(14) NULL,
	CANTIDAD int NULL
);

-- Import Data OK

-- Procedemos al modelado de estructuras
-- Contemos las filas por tabla

SELECT COUNT(*) FROM Datalake.dbo.DL_Departamentos;
SELECT COUNT(*) FROM Datalake.dbo.DL_Municipios;
SELECT COUNT(*) FROM Datalake.dbo.DL_Homicidios;

-- Validemos los caracteres de los campos de las tablas, así ajustaremos luego

SELECT NOM_DPTO, LEN(NOM_DPTO), GeoDepartamento, LEN(GeoDepartamento)
FROM Datalake.dbo.DL_Departamentos

-- 56 en NOM_DPTO
-- 32 en GeoDepartamento

-- Veamos la extensión de los caracteres

-- Vamos con Municipio
SELECT NOM_DPTO, LEN(NOM_DPTO), NOM_MPIO, LEN(NOM_MPIO ), TIPO, LEN(TIPO), GeoMunicipio, LEN(GeoMunicipio )
FROM Datalake.dbo.DL_Municipios

-- 56 NOM_DPTO
-- 27 NOM_MPIO
-- 22 TIPO
-- 38 GeoMunicipio

-- Última de las 3: Homicidios
SELECT DEPARTAMENTO, LEN(DEPARTAMENTO), MUNICIPIO, LEN(MUNICIPIO), ZONA, LEN(ZONA), SEXO, LEN(SEXO) 
FROM Datalake.dbo.DL_Homicidios

-- 18 Departamentos
-- 27 Municipio
-- 6  Zona
-- 14 Sexo
