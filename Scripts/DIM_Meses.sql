CREATE TABLE DataWarehouse.dbo.DIM_Meses (
	IdMes tinyint IDENTITY(1,1) NOT NULL,
	NomMes varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT DIM_Mes_PK PRIMARY KEY (IdMes)
);