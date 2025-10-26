CREATE TABLE DataWarehouse.dbo.DIM_Zonas (
	IdZona tinyint IDENTITY(1,1) NOT NULL,
	NomZona varchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT DIM_Zonas_PK PRIMARY KEY (IdZona)
);