--PRACTICA01: TABLESPACES Y DATAFILES

--VISTAS ADMINISTRATIVAS
SELECT * FROM DBA_TABLESPACES;
SELECT * FROM V$DATAFILE;


CREATE TABLESPACE TBS_VENTAS
DATAFILE 'D:\Oracle 11g\MisTableSpaces\DF_SEG_01.DBF'
SIZE 3M;

--D:\Oracle 11g\MisTableSpaces>

--TBS con 2 datafiles
CREATE TABLESPACE TBS_SEGURIDAD
DATAFILE
    'D:\Oracle 11g\MisTableSpaces\DF_SECURITY_01.DBF' SIZE 10M,
    'D:\Oracle 11g\MisTableSpaces\DF_SECURITY_02.DBF' SIZE 10M;


--CONSULTA ADMINISTRATIVA DE DATAFILES
SELECT FILE#, NAME FROM V$DATAFILE;

--CREACION DE UNA TABLA EN EL TABLESPACE E INSERCION DE REGISTROS CON 'LEVEL FROM DUAL'
CREATE TABLE ARTICULO(
    ID INTEGER,
    DESCRIPCION CHAR(100)
)TABLESPACE TBS_VENTAS;

INSERT INTO ARTICULO 
SELECT LEVEL, 'ART_' || LEVEL FROM DUAL
CONNECT BY LEVEL <= 10000;

SELECT * FROM ARTICULO;


--MODIFICAR TAMA�O DE DATAFILES CON 'RESIZE'
ALTER DATABASE
    DATAFILE 'D:\Oracle 11g\MisTableSpaces\DF_SECURITY_01.DBF'
RESIZE 10M;


    
    
    