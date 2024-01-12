create database baitap;
use baitap;

-- tạo bảo table
create table Customer
(
    customerid   int  primary key,
    customername varchar(200),
    address      varchar(200),
    tel          varchar(10),
    status       int
-- 0 khách lẻ, 1 khách quen, 2 khách hàng thân thiện
);

-- tạo bảo product
create table product
(
    productid   int primary key ,
    productname varchar(100),
    decription  varchar(100),
    unit        varchar(100),
    price       int,
    quantity    int,
    status      bit default (1)
-- 1 là còn hàng, 0 là hết hàng
);

-- tạo bảng oder
create table oder
(
    orderid    int primary key,
    customerid int,
    oderdate   date,
    status     int,
    foreign key (customerid) references customer (customerid)
    -- 0 là đã đặt hàng, 1 đã giao, 2 là đã hủy
);

-- tạo bảng oderdetail
create table oderdetail
(
    oderid    int,
    productid int,
    price     int,
    quantity  int,
    foreign key (oderid) references oder (orderid),
    foreign key (productid) references product (productid)
);
drop table oderdetail;
-- thêm dữ liệu vào bảng customer
insert into customer(  customerid ,customername, address, tel, status)
values (1,'Nguyễn văn A', 'Hà Nội', '0987567858',0);
insert into customer(customerid,customername, address, tel, status)
values (2,'Nguyễn văn B', 'Thái Bình', '098767345',1);
insert into customer(customerid,customername, address, tel, status)
values (3,'Nguyễn văn C', 'Hà Nội', '0987567858',2);

-- thêm dữ liệu vảo bảng product

insert into product(  productid ,productname, decription, unit, price, quantity, status)
values (1,'Áo thu đông','Hàng mới nhập','chiếc','100','10',0);
insert into product(productid, productname, decription, unit, price, quantity, status)
values (2,'Máy tính T450','Máy nhâp mới','chiếc','200','100',1);
insert into product( productid,productname, decription, unit, price, quantity, status)
values (3,'Điện thoại Nokia5670','Điện thoại đang hot','chiếc','100','10',1);
insert into product(productid, productname, decription, unit, price, quantity, status)
values (4,'Máy in Samsung 450','Máy in đang ế','chiếc','100','10',1);

-- lấy toàn bộ thông tin dữ liệu bảng product
    select * from product;
-- thêm dữ liệu vảo bảng oder
insert into oder(orderid, customerid, oderdate, status) values
                 (123,1,'2023/12/25',1)  ;

insert into oderdetail(oderid, productid, price, quantity) values
                       (123,2,100,1);
insert into oderdetail(oderid, productid, price, quantity) values
    (123,3,200,2);

select * from Customer;
select * from product;
select * from oder;
select * from oderdetail;

select c.customername,c.address,c.tel
from customer c
join oder o on c.customerid = o.customerid
where o.status=1;

select o.orderid
from  oder o;