CREATE TABLE DataWarehouse.dbo.DIM_DiaSemana (
	IdDiaSemana tinyint IDENTITY(1,1) NOT NULL,
	NomDiaSemana varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT DIM_DiaSemana_PK PRIMARY KEY (IdDiaSemana)
);