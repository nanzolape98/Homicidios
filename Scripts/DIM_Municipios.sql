CREATE TABLE DataWarehouse.dbo.DIM_Municipios (
	CodDpto tinyint NOT NULL,
	CodMpio int NOT NULL,
	NomMpio varchar(27) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Tipo varchar(22) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Latitud float NOT NULL,
	Longitud float NOT NULL,
	CONSTRAINT DIM_Municipios_PK PRIMARY KEY (CodMpio),
	CONSTRAINT DIM_Municipios_DIM_Departamentos_FK FOREIGN KEY (CodDpto) REFERENCES DataWarehouse.dbo.DIM_Departamentos(CodDpto)
);