CREATE TABLE DataWarehouse.dbo.DIM_Trimestre (
	IdTrimestre tinyint IDENTITY(1,1) NOT NULL,
	NomTrimestre varchar(11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT DIM_Trimestre_PK PRIMARY KEY (IdTrimestre)
);