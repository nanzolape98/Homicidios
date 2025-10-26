CREATE TABLE DataWarehouse.dbo.DIM_Tiempo (
	FechaHecho date NOT NULL,
	Annio int NOT NULL,
	IdMes tinyint NOT NULL,
	Dia tinyint NOT NULL,
	IdTrimestre tinyint NOT NULL,
	IdDiaSemana tinyint NOT NULL,
	Semana tinyint NOT NULL,
	CONSTRAINT DIM_Tiempo_PK PRIMARY KEY (FechaHecho),
	CONSTRAINT DIM_Tiempo_DIM_DiaSemana_FK FOREIGN KEY (IdDiaSemana) REFERENCES DataWarehouse.dbo.DIM_DiaSemana(IdDiaSemana),
	CONSTRAINT DIM_Tiempo_DIM_Meses_FK FOREIGN KEY (IdMes) REFERENCES DataWarehouse.dbo.DIM_Meses(IdMes),
	CONSTRAINT DIM_Tiempo_DIM_Trimestre_FK FOREIGN KEY (IdTrimestre) REFERENCES DataWarehouse.dbo.DIM_Trimestre(IdTrimestre)
);