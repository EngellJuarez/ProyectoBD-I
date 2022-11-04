--INSERT TABLAS

use VentaRepuestos
go

insert into DEPARTAMENTOS values('Managua'),('Masaya'),('Carazo'),('Granada'),('Boaco'), 
('Chinandega'),('Chontales'),('Esteli'),('Jinotega'),('León'),('Madriz'),
('Matagalpa'),('Nueva Segovia'),('Río San Juan'),('Rivas')

select * from DEPARTAMENTOS


insert into MUNICIPIOS values('Ciudad Sandino',1),('Managua',1),
('El crucero',1),('Mateare',1),('San Francisco Libre',1),('San Rafael del Sur',1),
('Ticuantepe',1),('Tipitapa',1),('Villa Carlos Fonseca',1),
('Masaya',2),('Catarina',2),('La Concepción',2),('Masatepe',2),('Nandasmo',2),
('Nindirí',2),('Niquinohomo',2),('San Juan de Oriente',2),('Tisma',2),
('Jinotepe',3),('Diriamba',3),('Dolores',3),('El Rosario',3),('La Conquista',3),
('La Paz',3),('San Marcos',3),('Santa Teresa',3)

select * from MUNICIPIOS 


insert into PRODUCTOS values('01','','LLANTA 4.00-8 NAYASA','MOTO 3RUEDAS','NAYASA',18,770,900,1,1,1,1),
('02','','LLANTAS 4.00-8 MRF','MOTO 3RUEDAS','MRF',5,1400,1500,1,2,1,1),
('03','AA171006','BUSHING DE MULETA','MOTO 3RUEDAS','BAJAJ',22,60,80,1,3,1,1) 

select * from PRODUCTOS

insert into PROVEEDORES values('SINSA','Carretera Masaya','22556969',1,1),
('INVERSIONES COMERCIALES MARTÍNEZ VASQUEZ','Edificio Invercasa, frente al Colegio La Salle, Pista Suburbana, Managua 14038','22771212',1,1),
('PRADILSHA S.A.','Residencial El Dorado, Semaforos El Dorado, 100mts sur, 300mts este, 200mts sur, 31 Av. Sureste, Managua 11171','22564890',1,1),
('LUBRINSA S.A','Pista a Refineria, Dimaco 200 mts al Sur, Ofibodega No 7 Nicaragua., Managua','22682280',1,1),
('DISTRIBUIDORES ASOCIADOS S.A','Managua 11012','22519232',1,1),
('DIANCA','5M4X+FMM, Semaforos Lindavista 3 c. arriba y 3 c. al lago, Managua','22663384',1,1),
('CASA PELLAS S.A','Plaza España, De la rotonda el Güegüense 350 mts. al sur, Managua 12084','22554444',1,1),
('MERCALSA S.A','Puente a desnivel Portezuelo 1000 mts al lago 100 mts al este','22512864',1,1),
('MOTO REPUESTOS INDU','Bo Zona Central Academia Sta María 1 1/2c Al S, Diriamba, Nicaragua','25342591',1,1),
('MOTONIC','vills el carmen-Alcaldia 3c al este,3c al sur, Managua','89923632',1,1)

select * from PROVEEDORES









