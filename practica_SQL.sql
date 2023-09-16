-- Creación del esquema.
create schema coches_empresa;

-- Creación de las tablas.
create table coches_empresa.coche(
	matricula VARCHAR(8) primary key,
	kilometros int not null,
	numero_poliza int not null,
	fecha_compra date not null,
	id_aseguradora int not null,
	id_revision int not null,
	id_modelo int not null,
	id_color int not null
);

create table coches_empresa.aseguradora(
	id_seguro serial primary key,
	nombre_seguro VARCHAR(20) not null
);

create table coches_empresa.marca(
	id_marca serial primary key,
	nombre_marca varchar(18) not null,
	id_grupo int not null
);

create table coches_empresa.color(
	id_color serial primary key,
	nombre_color varchar(8) not null
);

create table coches_empresa.revision(
	id_revision serial primary key,
	km_revision int not null,
	importe float not null,
	fecha_revision date not null,
	id_moneda int not null
);

create table coches_empresa.moneda(
	id_moneda serial primary key,
	nombre_moneda varchar(20)
);

create table coches_empresa.modelo(
	id_modelo serial primary key,
	nombre_modelo varchar(30),
	id_marca int not null
);

create table coches_empresa.grupo_empresarial(
	id_grupo serial primary key,
	nombre_grupo varchar(80)
);

-- Creación de relaciones.
alter table coches_empresa.coche add constraint coche_modelo_fk foreign key (id_modelo) references coches_empresa.modelo(id_modelo);
alter table coches_empresa.coche add constraint coche_aseguradora_fk foreign key (id_aseguradora) references coches_empresa.aseguradora(id_seguro);
alter table coches_empresa.coche add constraint coche_revision_fk foreign key (id_revision) references coches_empresa.revision(id_revision);
alter table coches_empresa.coche add constraint coche_color_fk foreign key (id_color) references coches_empresa.color(id_color);
alter table coches_empresa.marca  add constraint marca_grupo_fk foreign key (id_grupo) references coches_empresa.grupo_empresarial(id_grupo);
alter table coches_empresa.modelo  add constraint modelo_marca_fk foreign key (id_marca) references coches_empresa.marca(id_marca);
alter table coches_empresa.revision  add constraint revision_moneda_fk foreign key (id_moneda) references coches_empresa.moneda(id_moneda);

-- Insercción de datos.
insert into coches_empresa.color (nombre_color) values ('Blanco'), ('Rojo'), ('Negro'), ('Gris'), ('Azul'), ('Crema'), ('Verde');
insert into coches_empresa.grupo_empresarial (nombre_grupo) values ('Toyota Motor Corporation'), ('Grupo Volkswagen'), ('Alianza Renault-Nissan-Mitsubishi'), ('Grupo Stellantis'), ('Grupo BMW'), ('Grupo General Motors'), ('Grupo Tata Motors'), ('Conglomerados chinos de vehículos');
insert into coches_empresa.aseguradora (nombre_seguro) values ('Mapfre'), ('Mutua madrileña'), ('Allianz'), ('AXA'), ('Zurich'), ('Generali'), ('Verti'), ('Pelayo');
insert into coches_empresa.moneda (nombre_moneda) values ('Euro'), ('Dólar'), ('Yen japonés'), ('Libra estarlina'), ('Franco suizo');
insert into coches_empresa.marca (nombre_marca, id_grupo) values ('Seat', '2'), ('Renault', '3'), ('Peugeot', '4'), ('Volkswagen', '2'), ('Toyota', '1'), ('Nissan', '3'), ('BMW', '5'), ('Audi', '2'), ('Skoda', '2');
insert into coches_empresa.modelo (nombre_modelo, id_marca) values ('Ateca', '1'), ('Megane', '2'), ('3008', '3'), ('Sirocco', '4'), ('Corolla', '5'), ('Qashqai', '6'), ('x7', '7'), ('a7', '8'), ('Octavia', '9');
insert into coches_empresa.revision (km_revision, importe, fecha_revision, id_moneda) values ('60000', '200', '2023-1-14', '1');
insert into coches_empresa.coche (matricula, kilometros, numero_poliza, fecha_compra, id_aseguradora, id_revision, id_modelo, id_color) values ('0000_BBB', '75000', '001122334455', '2020-2-14', '1', '1', '7', '3');


-- Consulta
select 
	m.nombre_modelo as "Nombre modelo",
	m2.nombre_marca as "Nombre marca",
	ge.nombre_grupo as "Nombre grupo",
	c2.nombre_color as "Nombre color",
	a.nombre_seguro as "Nombre seguro",
	c.fecha_compra as "Fecha compra",
	c.matricula as "Matricula",
	c.kilometros as "Kilometros",
	c.numero_poliza as "Numero poliza"



from
	coches_empresa.coche c 
join coches_empresa.modelo m on c.id_modelo = m.id_modelo
join coches_empresa.marca m2 on m.id_marca = m2.id_marca
join coches_empresa.grupo_empresarial ge on m2.id_grupo = ge.id_grupo
join coches_empresa.color c2 on c.id_color = c2.id_color
join coches_empresa.aseguradora a on c.id_aseguradora = a.id_seguro


	










