CREATE TABLE DataWarehouse.dbo.DIM_Sexos (
	IdSexo tinyint IDENTITY(1,1) NOT NULL,
	NomSexo varchar(14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT DIM_Sexo_PK PRIMARY KEY (IdSexo)
);