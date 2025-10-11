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