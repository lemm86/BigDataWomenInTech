create schema fleet_management authorization wwjmbbvh;

create table fleet_management.colors(

	idColor varchar (3) not null,
	color_name varchar (10) not null,

constraint colors_PK primary key (idColor)
);

create table fleet_management.brand_groups(

	idBrand_group varchar (10) not null,
	group_name varchar (20) not null,

constraint brands_gropus_PK primary key (idBrand_group)
);


create table fleet_management.brands(

	idBrand varchar (10) not null,
	brand_name varchar (20) not null,
	idBrand_group varchar (10) not null,	

constraint brands_PK primary key (idBrand),
constraint brand_group_FK foreign key (idBrand_group) references fleet_management.brand_groups (idBrand_group)
);

create table fleet_management.vehicles_models(

	idModel integer not null,
	model_description varchar (20) not null,
	idBrand varchar (10) not null,

constraint vehicles_models_PK primary key (idModel),
constraint vehicles_models_FK foreign key (idBrand) references fleet_management.brands (idBrand)
);

create table fleet_management.insurance_company(

	idCompany integer not null,
	company_name varchar (20) not null,

constraint insurance_company_PK primary key (idCompany)
);

create table fleet_management.vehicles(

	idVehicle integer not null,
	registration_code varchar (10) not null,
	kms integer not null,
	purchase_date date not null,
	idColor varchar (3) not null,
	idModel integer not null,

constraint vehicles_PK primary key (idVehicle),
constraint color_FK foreign key (idColor) references fleet_management.colors (idColor),
constraint model_FK foreign key (idModel) references fleet_management.vehicles_models (idModel)
);

create table fleet_management.policies(

	idVehicle integer not null,
	idPolicie integer not null,
	start_date date not null,
	end_date date null,
	price decimal not null,
	idCompany integer not null,

constraint policies_PK primary key (idVehicle, idPolicie),
constraint vehicle_FK foreign key (idVehicle) references fleet_management.vehicles (idVehicle),
constraint company_FK foreign key (idCompany) references fleet_management.insurance_company (idCompany)
);

create table fleet_management.currency(

	idCurrency varchar (3) not null,
	currency_name varchar (20) not null,
	exchange_rate decimal not null,

constraint currency_PK primary key (idCurrency)
);

create table fleet_management.car_maintenance(

	idVehicle integer not null,
	service_date date not null,
	kms integer not null,
	price decimal not null,
	idCurrency varchar (3) not null,

constraint car_maintenance_PK primary key (idVehicle, service_date),
constraint vehicle_FK foreign key (idVehicle) references fleet_management.vehicles (idVehicle),
constraint currency_FK foreign key (idCurrency) references fleet_management.currency (idCurrency)
);

insert into fleet_management.colors 
(idcolor, color_name)
values ('YEL', 'Yellow'), 
('BLU', 'Blue'),
('WHI', 'White'),
('GRY', 'Grey'),
('PUR', 'Purple'),
('ORA', 'Orange'),
('BLA', 'Black'),
('RED', 'Red'),
('PIN', 'Pink'),
('GRN', 'Green')
;

insert into fleet_management.brand_groups
(idBrand_group, group_name)
values ('VOLK', 'Volkswagen'),
('HYUN', 'Hyundai'),
('TOYO', 'Toyota'),
('RENA', 'Renault'),
('STEL', 'Stellantis')
;

insert into fleet_management.brands
(idBrand, brand_name, idBrand_group)
values ('SEAT', 'Seat', 'VOLK'),
('HYUN', 'Hyundai', 'HYUN'),
('TOYO', 'Toyota', 'TOYO'),
('VOLK', 'Volkswagen', 'VOLK'),
('PEUG', 'Peugeot', 'STEL'),
('DACI', 'Dacia', 'RENA'),
('CITR', 'Citroën', 'STEL')
;

insert into fleet_management.vehicles_models
(idModel, model_description, idBrand)
values (1, 'Arona', 'SEAT'),
(2, 'Tucson', 'HYUN'),
(3, 'Corolla', 'TOYO'),
(4, 'T-Roc', 'VOLK'),
(5, 'C-HR', 'TOYO'),
(6, '208', 'PEUG'),
(7, 'Sandero', 'DACI'),
(8, 'C3', 'CITR')
;

insert into fleet_management.insurance_company
(idCompany, company_name)
values (1, 'Mutua Madrileña'),
(2, 'Mapfre'),
(3, 'AXA'),
(4, 'Allianz')
;

insert into fleet_management.vehicles
(idVehicle, registration_code, kms, purchase_date, idColor, idModel)
values (1, '2343hzc', 0, '2005-07-11', 'BLU', 1),
(2, '1243ghz', 0, '2020-09-27', 'WHI', 3),
(3, '8762hbs', 500, '2000-12-15', 'GRY', 7),
(4, '9735bdc', 997, '2014-03-03', 'PUR', 4),
(5, '8742jsc', 100, '2017-05-20', 'ORA', 5)
;

insert into fleet_management.policies
(idVehicle, idPolicie, start_date, end_date, price, idCompany)
values (1, 1, '2005-07-11', '2006-07-11', 500, 4),
(2, 2, '2020-09-27', '2021-09-27', 700, 1),
(3, 3, '2000-12-15', '2001-12-15', 1000, 2),
(4, 4, '2014-03-03', '2015-03-13', 600, 1),
(5, 5, '2017-05-20', '2018-05-20', 300, 3),
(1, 6, '2006-07-12', null, 550, 1),
(2, 7, '2021-09-28', null, 550, 1),
(3, 8, '2001-12-16', null, 550, 1),
(4, 9, '2015-03-04', null, 550, 1),
(5, 10, '2018-05-21', null, 550, 1)
;

insert into fleet_management.currency
(idCurrency, currency_name, exchange_rate)
values ('EUR', 'Euro', 1),
('DOL', 'Dólar', 1.1),
('BZD', 'Dólar beliceño', 0.3),
('CAD', 'Dólar canadiense', 0.9),
('CDF', 'Franco congoleño', 0.1),
('CHF', 'Franco suizo', 1.2),
('GBP', 'Libra esterlina', 1.3),
('JPY', 'Yen japonés', 0.25)
;

insert into fleet_management.car_maintenance
(idVehicle, service_date, kms, price, idCurrency)
values (1, '2010-03-20', 30000, 60, 'EUR'),
(3, '2010-05-10', 70000, 50, 'EUR'),
(4, '2020-07-03', 40000, 90, 'DOL')
;