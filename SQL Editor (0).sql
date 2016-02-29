CREATE DATABASE IF NOT EXISTS market DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
--Market系统表设计
--admin 登录操作用户，即管理员
--ldate 上次登陆时间。
drop table user;
create table user(
	id int primary key auto_increment,
	name varchar(255),
	pwd varchar(255),
	ldate timestamp DEFAULT now()
);
insert into user(name,pwd) values('朱文艺','123');
insert into user(name,pwd) values('zhuwenyi','123');

select * from user;

-- 消费者 会员
--amt 消费总金额
-- cdate 消费日期。
--这里希望 积分是和消费金额的比例关系可以自己设置
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
insert into member(name,phone,amt,jifen) values('张三','13761015743',150,15);
insert into member(name,phone,amt,jifen) values('李四','13761015744',250,55);
insert into member(name,phone,amt,jifen) values('王五','13761015745',350,35);
insert into member(name,phone,amt,jifen) values('赵六','13761015746',450,45);

delete from member where id=2;

select * from member;

commit;
--消费和积分细节表.
--damt 单次消费金额
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


insert into detail(customerid,amt,jifen,flag,demo) values(1,150,15,'consume','美特斯邦威衬衫');
insert into detail(customerid,amt,jifen,flag,demo) values(2,250,25,'consume','耐克运动鞋');
insert into detail(customerid,amt,jifen,flag,demo) values(3,350,35,'consume','阿迪球衣');
insert into detail(customerid,amt,jifen,flag,demo) values(4,450,45,'consume','361套装');

select * from detail;
--barcode 条形码
--demo 备注
--库存数量
drop table goods;
create table goods(
	id int primary key auto_increment,
	gname varchar(1000),
	barcode varchar(255),
	price double(10,2),
	stock int,
	demo text
);

insert into goods(gname,barcode,price,stock,demo) values('美特斯邦威衬衫','3658956411361',150,100,'销量不错');
insert into goods(gname,barcode,price,stock,demo) values('耐克运动鞋','3658956411362',180,100,'今年夏季新款');
insert into goods(gname,barcode,price,stock,demo) values('阿迪球衣','3658956411363',240,100,'销量最好的商品');
insert into goods(gname,barcode,price,stock,demo) values('361套装','3658956411364',280,100,'冬季新款');

insert into goods(gname,barcode,price,stock,demo) values('国宴饮料 正宗椰树牌椰汁','6957735788861',4,1000,'245ml灌装');
insert into goods(gname,barcode,price,stock,demo) values('康师傅矿物质水','6920459905036',1.1,20000,'550ml/瓶');
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

--充值表
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

--消费表
--cdate date,--消费日期
--filldate timestamp DEFAULT now(),--填写日期
--lunch double(10,2),	--午饭消费
--supper double(10,2)	--晚饭消费

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


