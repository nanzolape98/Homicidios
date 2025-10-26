CREATE TABLE DataWarehouse.dbo.FAC_Homicidios (
	IdHomicios int IDENTITY(1,1) NOT NULL,
	FechaHecho date NOT NULL,
	CodMpio int NOT NULL,
	IdZona tinyint NOT NULL,
	IdSexo tinyint NOT NULL,
	Cantidad int NOT NULL,
	CONSTRAINT FAC_Homicidios_PK PRIMARY KEY (IdHomicios),
	CONSTRAINT FAC_Homicidios_DIM_Municipios_FK FOREIGN KEY (CodMpio) REFERENCES DataWarehouse.dbo.DIM_Municipios(CodMpio),
	CONSTRAINT FAC_Homicidios_DIM_Sexos_FK FOREIGN KEY (IdSexo) REFERENCES DataWarehouse.dbo.DIM_Sexos(IdSexo),
	CONSTRAINT FAC_Homicidios_DIM_Tiempo_FK FOREIGN KEY (FechaHecho) REFERENCES DataWarehouse.dbo.DIM_Tiempo(FechaHecho),
	CONSTRAINT FAC_Homicidios_DIM_Zonas_FK FOREIGN KEY (IdZona) REFERENCES DataWarehouse.dbo.DIM_Zonas(IdZona)
);