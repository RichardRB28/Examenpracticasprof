create database Examen;
use Examen;

CREATE TABLE tienda (
    codigo_tienda INT(10),
    nombre_tienda VARCHAR(30),
    PRIMARY KEY (codigo_tienda)
)  ENGINE=INNODB;

CREATE TABLE bebida (
    codigo_bebida INT(10),
    nombre_bebida VARCHAR(30),
    PRIMARY KEY (codigo_bebida)
)  ENGINE=INNODB;

CREATE TABLE bebedor (
    cedula BIGINT(12),
    nombre VARCHAR(30),
    PRIMARY KEY (cedula)
)  ENGINE=INNODB;

CREATE TABLE gusta (
    cedula BIGINT(12),
    codigo_bebida INT(10),
    CONSTRAINT FOREIGN KEY (cedula) REFERENCES examen.bebedor (cedula),
        CONSTRAINT FOREIGN KEY (codigo_bebida)REFERENCES examen.bebida (codigo_bebida)
)  ENGINE=INNODB;

CREATE TABLE frecuencia (
    cedula BIGINT(12),
    codigo_tienda INT(10),
    CONSTRAINT FOREIGN KEY (cedula)
        REFERENCES examen.bebedor (cedula),
    CONSTRAINT FOREIGN KEY (codigo_tienda)
        REFERENCES examen.tienda (codigo_tienda)
)  ENGINE=INNODB;

CREATE TABLE vende (
    codigo_tienda INT(10),
    codigo_bebida INT(10),
    precio FLOAT,
    CONSTRAINT FOREIGN KEY (codigo_tienda)REFERENCES examen.tienda (codigo_tienda),
    CONSTRAINT FOREIGN KEY (codigo_bebida)REFERENCES examen.gusta (codigo_bebida)
)  ENGINE=INNODB;

insert into tienda(codigo_tienda,nombre_tienda) values (1,"tolima");
insert into tienda(codigo_tienda,nombre_tienda) values (2,"suc");
insert into tienda(codigo_tienda,nombre_tienda) values (3,"sanp");
insert into tienda(codigo_tienda,nombre_tienda) values (4,"gole");

insert into bebida(codigo_bebida,nombre_bebida) values (12122,"colombiana");
insert into bebida(codigo_bebida,nombre_bebida) values (12123,"pepsi");
insert into bebida(codigo_bebida,nombre_bebida) values (12124,"cola");
insert into bebida(codigo_bebida,nombre_bebida) values (12125,"maltix");
insert into bebida(codigo_bebida,nombre_bebida) values (12126,"postobon");


insert into bebedor(cedula,nombre)  values (10111,"Mario");
insert into bebedor(cedula,nombre)  values (11111,"Luis");
insert into bebedor(cedula,nombre)  values (12111,"pedro");
insert into bebedor(cedula,nombre)  values (13111,"Andres Camilo Restrepo");
insert into bebedor(cedula,nombre)  values (14111,"Adalberto");
insert into bebedor(cedula,nombre)  values (15111,"jeick");

insert into gusta(cedula,codigo_bebida)  values (10111,12122);
insert into gusta(cedula,codigo_bebida)  values (10111,12123);
insert into gusta(cedula,codigo_bebida)  values (10111,12124);

insert into gusta(cedula,codigo_bebida)  values (11111,12123);
insert into gusta(cedula,codigo_bebida)  values (11111,12125);
insert into gusta(cedula,codigo_bebida)  values (11111,12126);

insert into gusta(cedula,codigo_bebida)  values (12111,12124);
insert into gusta(cedula,codigo_bebida)  values (12111,12124);
insert into gusta(cedula,codigo_bebida)  values (12111,12126);

insert into gusta(cedula,codigo_bebida)  values (13111,12125);
insert into gusta(cedula,codigo_bebida)  values (13111,12124);

insert into gusta(cedula,codigo_bebida)  values (14111,12126);

insert into frecuencia(cedula,codigo_tienda) values (10111,1);
insert into frecuencia(cedula,codigo_tienda) values (10111,2);
insert into frecuencia(cedula,codigo_tienda) values (10111,3);
insert into frecuencia(cedula,codigo_tienda) values (12111,2);
insert into frecuencia(cedula,codigo_tienda) values (13111,3); /* andres c restrepo*/
insert into frecuencia(cedula,codigo_tienda) values (14111,4);


insert into vende(codigo_tienda,codigo_bebida,precio) values (3,12122,100.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (3,12123,102.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (3,12124,103.0);



insert into vende(codigo_tienda,codigo_bebida,precio) values (1,12123,105.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (1,12124,106.0);



insert into vende(codigo_tienda,codigo_bebida,precio) values (2,12123,105.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (2,12122,99.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (2,12124,177.0);

insert into vende(codigo_tienda,codigo_bebida,precio) values (4,12124,106.0);
insert into vende(codigo_tienda,codigo_bebida,precio) values (4,12126,100.0);

 select * from vende left join tienda on (vende.codigo_tienda=tienda.codigo_tienda) where 
 codigo_bebida=(select bebida.codigo_bebida from bebida where nombre_bebida="postobon"); 

(SELECT nombre_bebida FROM bebida WHERE nombre_bebida=12125);


/*---------------------- BEBEDORES QUE NO LES GUSTA LA COLOMBIANA-------------------*/
SELECT * FROM bebedor LEFT JOIN gusta ON (bebedor.cedula=gusta.cedula) 
WHERE gusta.codigo_bebida!=(SELECT codigo_bebida FROM bebida WHERE nombre_bebida="colombiana");

/*-----------TIENDAS QUE NO SON FRECUENTADAS POR ANDRES CAMILO RESTREPO------- */ 

SELECT * FROM tienda WHERE tienda.codigo_tienda != (
SELECT codigo_tienda FROM frecuencia WHERE cedula=(
SELECT cedula FROM bebedor WHERE nombre ="Andres Camilo Restrepo"));

/*--BEBEDORES QUE LES GUSTA AL MENOS UNA BEBIDA Y  QUE FRECUENTAN AL MENOS UNA TIENDA---*/
SELECT * FROM bebedor INNER JOIN gusta ON bebedor.cedula=gusta.cedula 
INNER JOIN bebida ON gusta.codigo_bebida=bebida.codigo_bebida;

(SELECT * from gusta GROUP BY cedula HAVING COUNT(*)>1)