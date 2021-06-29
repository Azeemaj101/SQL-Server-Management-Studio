CREATE DATABASE FINAL1;

use final1;

create table table1 (id int identity(1,1) primary key not null,
					 name1 varchar(50) not null,
					 roll_no1 int default 1,
					 date1 date not null,
					 link int foreign key references table2(link));

create table table2 (link int identity(1,1) primary key not null,
					 work varchar(30) not null);

drop table table2;
insert into table2 (work) values('Work5'),('Work2'),('Work3'),('Work4'),('Work5');

insert into table1 (name1,roll_no1,date1,link) values('AZEEM',1,'2021-6-3',1);
insert into table1 (name1,roll_no1,date1,link) values('AZEEM1',1,'6-3-2021',1);
insert into table1 (name1,roll_no1,date1,link) values('AZEEM2',1,'12-13-2021',2);
insert into table1 (name1,roll_no1,date1,link) values('AZEEM3',1,'12-14-2021',3);
insert into table1 (name1,roll_no1,date1,link) values('AZEEM3',1,'12-14-2021',4);
ALTER TABLE TABLE1 ADD DOB DATE DEFAULT '12-14-2021';
ALTER TABLE TABLE1 DROP COLUMN DOB;
SELECT *FROM table1 o inner join table2 t on o.link = t.link;

SELECT *FROM table2 o LEFT OUTER join table1 t on o.link = t.link;

SELECT *FROM TABLE1;