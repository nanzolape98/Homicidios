SELECT COUNT(*) FROM DataLake.dbo.DL_Departamentos

SELECT COUNT(*) FROM DataLake.dbo.DL_Municipios

SELECT COUNT(*) FROM DataLake.dbo.DL_Homicidios

SELECT * FROM DataLake.dbo.DL_Departamentos
SELECT COD_DPTO,NOM_DPTO FROM DataLake.dbo.DL_Departamentos

SELECT NOM_DPTO, LEN(NOM_DPTO)
FROM DataLake.dbo.DL_Departamentos
ORDER BY LEN(NOM_DPTO) DESC;

SELECT [Geo Departamento] , LEN([Geo Departamento])
FROM DataLake.dbo.DL_Departamentos
ORDER BY LEN([Geo Departamento] ) DESC;

SELECT NOM_DPTO, LEN(NOM_DPTO)
FROM DataLake.dbo.DL_Municipios
ORDER BY LEN(NOM_DPTO) DESC;

SELECT NOM_MPIO, LEN(NOM_MPIO)
FROM DataLake.dbo.DL_Municipios
ORDER BY LEN(NOM_MPIO) DESC;

SELECT TIPO, LEN(TIPO)
FROM DataLake.dbo.DL_Municipios
ORDER BY LEN(TIPO) DESC;

SELECT GeoMunicipio , LEN(GeoMunicipio)
FROM DataLake.dbo.DL_Municipios
ORDER BY LEN(GeoMunicipio ) DESC;

SELECT NOM_DPTO, LEN(NOM_DPTO), NOM_MPIO, LEN(NOM_MPIO), TIPO, LEN(TIPO), GeoMunicipio , LEN(GeoMunicipio)
FROM DataLake.dbo.DL_Municipios
ORDER BY LEN(GeoMunicipio ) DESC;

SELECT DEPARTAMENTO, LEN(DEPARTAMENTO), MUNICIPIO, LEN(MUNICIPIO), ZONA, LEN(ZONA),  SEXO, LEN(SEXO)
FROM DataLake.dbo.DL_Homicidios