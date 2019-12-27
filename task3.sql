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
