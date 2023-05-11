create database champions;
use champions;

create table campeonato(
	c_campeonato varchar(50) not null primary key,
	n_campeonato varchar(50) not null,
	q_partidos varchar(50) not null,
	)

create table jug_eq_camp(
	c_jugador varchar(50) not null,
	c_campeonato varchar(50) not null,
	c_equipo varchar(50) not null,

	primary key(c_jugador, c_campeonato)
	)

create table equipo(
	c_equipo varchar(50) not null primary key,
	n_equipo varchar(50) not null,
	)

create table jugador(
	c_jugador varchar(50) not null primary key,
	n_jugador varchar(50) not null,
	d_nacimiento varchar(50) not null,
	)

create table estadio(
	c_estadio varchar(50) not null primary key,
	n_estadio varchar(50) not null,
	)

create table jug_partido(
	c_jugador varchar(50) not null,
	nro_partido varchar(50) not null,
	n_posicion varchar(50) not null,
	nro_camiseta varchar(50) not null,
	f_expulsado varchar(50) not null,
	f_amonestado varchar(50) not null,
	f_goleador varchar(50) not null,

	primary key(c_jugador, nro_partido)
	)

create table partido(
	nro_partido varchar(50) not null primary key,
	c_estadio_part varchar(50) not null,
	c_equipo_1 varchar(50) not null,
	c_equipo_2 varchar(50) not null,
	c_campeonato varchar(50) not null,
	d_partido varchar(50) not null,
	n_juez_linea1 varchar(50) not null,
	n_juez_linea2 varchar(50) not null,
	q_goles_e1 varchar(50) not null,
	q_goles_e2 varchar(50) not null,
	n_arbitro varchar(50) not null,
	c_resultado varchar(50) not null,
	)

alter table jug_eq_camp
add constraint fk_campeonato
foreign key (c_campeonato) references campeonato(c_campeonato);

alter table jug_eq_camp
add constraint fk_equipo
foreign key (c_equipo) references equipo(c_equipo);

alter table jug_eq_camp
add constraint fk_jugador
foreign key (c_jugador) references jugador(c_jugador);

alter table jug_partido
add constraint fk_jugador1
foreign key (c_jugador) references jugador(c_jugador);

alter table partido
add constraint fk_estadio
foreign key (c_estadio_part) references estadio(c_estadio);

alter table partido
add constraint fk_campeonato1
foreign key (c_campeonato) references campeonato(c_campeonato);

alter table partido
add constraint fk_equipo1
foreign key (c_equipo_1) references equipo(c_equipo);

alter table partido
add constraint fk_equipo2
foreign key (c_equipo_2) references equipo(c_equipo);

alter table jug_partido
add constraint fk_partido
foreign key (nro_partido) references partido(nro_partido);

-- DML

--SELECT
--UPDATE
--DELETE
--INSERT

insert into estadio (c_estadio, n_estadio) values ('e01','GRASS BERNABEU');
insert into estadio (c_estadio, n_estadio) values ('e02','ESTADIO CUIDAD DE CUMANA');

insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j01','JAMES','01/03/2000');  
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j02','MEMO','09/05/2001');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j03','JOAQUIN','26/07/2003');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j04','JHEZER','12/10/2000');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j05','SANDY','06/01/2002');

insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j06','PEPE1','25/06/2003');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j07','PEPE2','03/03/2001');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j08','PEPE3','22/05/2000');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j09','PEPE4','25/12/2000');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j10','PEPE5','07/05/2004');
insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j11','PEPE6','12/02/2002');

insert into campeonato (c_campeonato, n_campeonato, q_partidos) values ('c01','COPA SENATI 2023',8);
insert into campeonato (c_campeonato, n_campeonato, q_partidos) values ('c02','COPA VILCASUWU 2023',70);

insert into equipo (c_equipo, n_equipo) values ('e1','III CICLO ING SOFTWARE FC');
insert into equipo (c_equipo, n_equipo) values ('e2','III CICLO DISEÑO FC');

insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j01','c01','e1');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j02','c01','e1');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j03','c01','e1');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j04','c01','e1');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j05','c01','e1');

insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j06','c01','e2');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j07','c01','e2');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j08','c01','e2');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j09','c01','e2');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j10','c01','e2');
insert into jug_eq_camp (c_jugador, c_campeonato, c_equipo) values ('j11','c01','e2');

insert into partido values (1,'e01','e1','e2','c01','23/04/2023','NO HAY','NO HAY',2,0,'CARLOS MENDEZ','FACIL PARA EQ1');
insert into partido values (2,'e02','e1','e2','c01','25/04/2023','NO HAY','NO HAY',3,1,'CARLOS MENDEZ','FACIL PARA EQ1');
insert into partido values (3,'e01','e1','e2','c01','27/04/2023','NO HAY','NO HAY',2,3,'CARLOS MENDEZ','FACIL PARA EQ2');
insert into partido values (4,'e02','e1','e2','c01','29/04/2023','NO HAY','NO HAY',0,0,'PIERO RAMIREZ','EMPATE PARA AMBOS');
insert into partido values (5,'e01','e1','e2','c01','01/05/2023','NO HAY','NO HAY',1,2,'PIERO RAMIREZ','FACIL PARA EQ2');
insert into partido values (6,'e02','e1','e2','c01','03/05/2023','NO HAY','NO HAY',2,0,'PIERO RAMIREZ','FACIL PARA EQ1');
insert into partido values (7,'e01','e1','e2','c01','05/05/2023','NO HAY','NO HAY',1,0,'MAX CARENAS','FACIL PARA EQ1');
insert into partido values (8,'e02','e1','e2','c01','07/05/2023','NO HAY','NO HAY',3,2,'MAX CARENAS','FACIL PARA EQ1');

insert into jug_partido values ('j01',1,'DELANTERO',14,0,0,0);
insert into jug_partido values ('j02',1,'FULLVASO',10,0,0,0);
insert into jug_partido values ('j03',1,'MEDIOCAMPO',05,0,0,0);
insert into jug_partido values ('j04',1,'DEFENSA',06,0,0,0);
insert into jug_partido values ('j05',1,'ARQUERO',01,0,0,0);

insert into jug_partido values ('j06',1,'DELANTERO',14,0,0,0);
insert into jug_partido values ('j07',1,'MEDIOCAMPO',12,0,0,0);
insert into jug_partido values ('j08',1,'MEDIOCAMPO',07,0,0,0);
insert into jug_partido values ('j09',1,'DEFENSA',04,0,0,0);
insert into jug_partido values ('j10',1,'ARQUERO',11,0,0,0);
insert into jug_partido values ('j11',1,'DEFENSA',10,0,0,0);

select * from estadio;
select * from jugador;
select * from campeonato;
select * from equipo;
select * from jug_eq_camp;
select * from partido;
select * from jug_partido;

update jugador set n_jugador = 'ROBERTO' WHERE c_jugador = 'j05';

insert into jugador (c_jugador, n_jugador, d_nacimiento) values ('j12','OSCAR','08/01/2004');

delete from jugador where c_jugador = 'j12';


SELECT *
FROM equipo
FULL OUTER JOIN jug_eq_camp
ON equipo.c_equipo = jug_eq_camp.c_equipo

SELECT c_jugador, c_equipo, n_campeonato
FROM jug_eq_camp A
RIGHT JOIN campeonato B
ON A.c_campeonato = B.c_campeonato

SELECT *
FROM equipo
FULL OUTER JOIN jug_eq_camp
ON equipo.c_equipo = jug_eq_camp.c_equipo
WHERE equipo.c_equipo IS NULL OR jug_eq_camp.c_equipo IS NULL

SELECT *
FROM equipo
INNER JOIN jug_eq_camp
ON equipo.c_equipo = jug_eq_camp.c_equipo