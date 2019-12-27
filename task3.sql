create table books(book_name varchar2(20)not null,
book_id number(20)not null,
authour_name varchar2(20)not null,
category varchar2(30)not null,
publisher varchar2(20)not null,
price number(20)not null,
version number(20),
active varchar2(20),

constraint flipkart_pk primary key(book_id),
constraint check_price check (price >=0),
constraint unique_s unique(book_id,book_name,version)
);


insert into books(book_name,book_id,authour_name,category,publisher,price)values('the secret',11,'ajmal','biography','sandy',200);
insert into books(book_name,book_id,authour_name,category,publisher,price,version,active)values('ms dhoni',12,'sandy','documentary','deepan',450,2,'yes');
insert into books(book_name,book_id,authour_name,category,publisher,price,version,active)values('life of the pie',20,'sugumar','documentary','kumar',450,2,'yes');
insert into books(book_name,book_id,authour_name,category,publisher,price,version,active)values('pele',22,'sivika','documentary','mohan',450,1,'no');
insert into books(book_name,book_id,authour_name,category,publisher,price,version,active)values('romance',33,'suri','romantic','dilp',600,4,'no');


create table orders(order_id number(20)not null,
user_name varchar2(20)not null,
book_id number(20)not null,
order_date timestamp default systimestamp,
delivered_date timestamp,
total_amount number(20) not null,
quantity number(20)not null,
order_status varchar2(20),
                    
constraint order_id_pk primary key(order_id),
constraint book_id_fk foreign key(book_id) references books(book_id),
constraint total_amount_ck check(total_amount>0),
constraint quantity_qy check(quantity>=1));

insert into orders(order_id,user_name,book_id,total_amount,quantity,order_status)
values(123,'sandy',22,650,2,'yes');

insert into orders(order_id,user_name,book_id,total_amount,quantity,order_status,delivered_date)
values(124,'Ajamal',12,333,3,'yes','28-dec-2019');

insert into orders(order_id,user_name,book_id,total_amount,quantity,order_status,delivered_date)
values(144,'kumar',20,12,1,'yes','28-dec-2019');

--insert into orders(order_id,user_name,book_id,total_amount,quantity,order_status,delivered_date)
--values(220,'Gowtham',980,888,2,'yes','28-dec-2019');
