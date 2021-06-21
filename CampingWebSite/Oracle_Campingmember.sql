create table Campingmember(
	id varchar2(20) primary key,
	pass1 varchar2(20) not null,
	email varchar2(50) not null,
	tel varchar2(20) not null,
	hobby varchar2(20),
	job varchar2(20),
	age varchar2(10),
	info varchar2(2000)
);

select * from CAMPINGMEMBER;

commit