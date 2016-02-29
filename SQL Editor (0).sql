CREATE DATABASE IF NOT EXISTS market DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
--Marketϵͳ�����
--admin ��¼�����û���������Ա
--ldate �ϴε�½ʱ�䡣
drop table user;
create table user(
	id int primary key auto_increment,
	name varchar(255),
	pwd varchar(255),
	ldate timestamp DEFAULT now()
);
insert into user(name,pwd) values('������','123');
insert into user(name,pwd) values('zhuwenyi','123');

select * from user;

-- ������ ��Ա
--amt �����ܽ��
-- cdate �������ڡ�
--����ϣ�� �����Ǻ����ѽ��ı�����ϵ�����Լ�����
drop table member;

create table member(
	id int primary key auto_increment,
	name varchar(255),
	phone varchar(255),
	amt double(10,2) default 0,
	jifen double(10,2) default 0,
	flag varchar(20) default "true",
	cdate timestamp DEFAULT now(),
	demo text
);
select * from member;
insert into member(name,phone,amt,jifen) values('����','13761015743',150,15);
insert into member(name,phone,amt,jifen) values('����','13761015744',250,55);
insert into member(name,phone,amt,jifen) values('����','13761015745',350,35);
insert into member(name,phone,amt,jifen) values('����','13761015746',450,45);

delete from member where id=2;

select * from member;

commit;
--���Ѻͻ���ϸ�ڱ�.
--damt �������ѽ��
--flag:consume/usejifen
drop table detail;
create table detail(
	id int primary key auto_increment,
	customerid int,
	amt double(10,2),
	jifen double(10,2),
	flag varchar(100),
	ldate timestamp DEFAULT now(),
	demo text
);


insert into detail(customerid,amt,jifen,flag,demo) values(1,150,15,'consume','����˹��������');
insert into detail(customerid,amt,jifen,flag,demo) values(2,250,25,'consume','�Ϳ��˶�Ь');
insert into detail(customerid,amt,jifen,flag,demo) values(3,350,35,'consume','��������');
insert into detail(customerid,amt,jifen,flag,demo) values(4,450,45,'consume','361��װ');

select * from detail;
--barcode ������
--demo ��ע
--�������
drop table goods;
create table goods(
	id int primary key auto_increment,
	gname varchar(1000),
	barcode varchar(255),
	price double(10,2),
	stock int,
	demo text
);

insert into goods(gname,barcode,price,stock,demo) values('����˹��������','3658956411361',150,100,'��������');
insert into goods(gname,barcode,price,stock,demo) values('�Ϳ��˶�Ь','3658956411362',180,100,'�����ļ��¿�');
insert into goods(gname,barcode,price,stock,demo) values('��������','3658956411363',240,100,'������õ���Ʒ');
insert into goods(gname,barcode,price,stock,demo) values('361��װ','3658956411364',280,100,'�����¿�');

insert into goods(gname,barcode,price,stock,demo) values('�������� ����Ҭ����Ҭ֭','6957735788861',4,1000,'245ml��װ');
insert into goods(gname,barcode,price,stock,demo) values('��ʦ��������ˮ','6920459905036',1.1,20000,'550ml/ƿ');
commit;

select * from goods;

delete from goods where id > 4;
commit;

show tables;

commit;
/*
CREATE DATABASE IF NOT EXISTS monimeals DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

show tables;

select * from users where name='zhujidai';
drop table users;
create  table users(
	id int primary key auto_increment,
	name varchar(100),
	pwd varchar(100),
	balance double(10,2)
	
);

insert into users(name,pwd,balance)values('bujunpan','123',100);
insert into users(name,pwd,balance)values('zhujidai','123',100);
insert into users(name,pwd,balance)values('wangyanting','123',100);
insert into users(name,pwd,balance)values('xiongyang','123',100);

select * from users;

--��ֵ��
drop table charge;
create table charge(
	id int primary key auto_increment,
	userid int,
	iamt double(10,2),
	idate  timestamp DEFAULT now()
);

insert into charge(userid,iamt)values(1,100);
insert into charge(userid,iamt)values(2,110);
insert into charge(userid,iamt)values(3,120);
insert into charge(userid,iamt)values(4,130);


select * from users;
delete from charge where id in(6,7,8);

--���ѱ�
--cdate date,--��������
--filldate timestamp DEFAULT now(),--��д����
--lunch double(10,2),	--�緹����
--supper double(10,2)	--������

drop table consume;
create table consume(
	id int primary key auto_increment,
	userid int,
	cdate date,
	filldate timestamp DEFAULT now(),
	lunch double(10,2),
	supper double(10,2),
	demo varchar(255),
	yue double(10,2)
);

select * from consume;

insert into consume (userid,cdate,lunch,supper,yue) values(1,'2015-10-21',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(2,'2015-10-21',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(3,'2015-10-21',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(4,'2015-10-21',10.5,7.5,100);

insert into consume (userid,cdate,lunch,supper,yue) values(1,'2015-10-22',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(2,'2015-10-22',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(3,'2015-10-22',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(4,'2015-10-22',10.5,7.5,100);

insert into consume (userid,cdate,lunch,supper,yue) values(1,'2015-10-23',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(2,'2015-10-23',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(3,'2015-10-23',10.5,7.5,100);
insert into consume (userid,cdate,lunch,supper,yue) values(4,'2015-10-23',10.5,7.5,100);


select c.id,c.userid,c.iamt,c.idate,u.name from charge c left join users u on c.userid=u.id order by c.idate desc;

select * from charge
select c.id,c.userid,c.iamt,c.idate,u.name from charge c join users u */


