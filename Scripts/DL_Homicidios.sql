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