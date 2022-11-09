create database Insurance;
use Insurance;

create table person
( driver_id char(10),
name varchar(20),
address varchar(20),
primary key(driver_id)
);

desc person;

 create table car
 (reg_no char(10),
 model varchar(15),
 year year,
 primary key(reg_no)
 );
 
 show tables;
 
 create table owns 
 ( driver_id char(10),
 reg_no char(10),
 primary key(driver_id, reg_no),
 foreign key(driver_id) references person(driver_id) ,
 foreign key(reg_no) references car(reg_no) 
 );
 
 desc owns;
 
create table accident
(report_no int,
accident_date date,
location varchar(20),
primary key(report_no)
);

create table participated 
(driver_id char(10),
 reg_no char(10),
report_no int, 
damage_amount int,
primary key(driver_id, reg_no, report_no),
foreign key(driver_id) references person(driver_id),
foreign key(reg_no) references car(reg_no),
foreign key(report_no) references accident(report_no)
);

show tables;

insert into accident values ('11', '2003-01-01','Mysore Road');
insert into accident values (12,'2004-02-02','South end Circle');
insert into accident values (13,'2003-01-21','Bull temple Road');
insert into accident values (14,'2008-02-17','Mysore Roa');
insert into accident values (15,'2004-03-05','Kanakpura Road');

select * from accident;

insert into person values ('001','Vignesh','Kundpura');
insert into person values ('002','Sushanth','Hebri');
insert into person values ('003','Subrahmanya','Bengaluru');
insert into person values ('004','Kenny','Gulbarga');
insert into person values ('005','Varun','Bhatkal');

select * from person;

desc car;

insert into car values ('KA01','Verna','2017');
insert into car values ('KA02','Brezza','2020');
insert into car values ('KA03','creta','2021');
insert into car values ('KA04','Kia','2016');
insert into car values ('KA05','Nexon','2017');

select * from car;


set foreign_key_checks=0;
set global foreign_key_checks=0;
insert into owns values ('11','KA01'),(12,'KA02'),(13,'KA03'),('14','KA04'),(15,'KA05');


insert into participated values ('11','KA01','001','10000'),(12,'KA02','002','50000'),(13,'KA03','003','25000'),(14,'KA04','004','3000'),(15,'KA05','005','5000');

select * from owns;
select * from participated;
drop table paticipated;

update participated
set damage_amount='25000'
where reg_no='KA04' and report_no='14';
select * from participated;

select count(distinct driver_id)CNT from participated a,accident b where a.report_no = b.report_no and b.accident_date like'%08';

insert into participated values ('17','KA07','007','100000');
select * from participated;

select accident_date, location from accident;
select driver_id from participated where damage_amount>=25000;