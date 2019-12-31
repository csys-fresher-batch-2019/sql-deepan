# Movie_Ticket_Booking_app

* https://ticketbooking.in

## Features

* User information.

### Featuers 1: Movie information.

```sql
create table movie(movie_name varchar2(20) not null,
        theater_id number,
        movie_type varchar2(30) not null,
        movie_status varchar2(40)not null,
        constraint theater_id_pk primary key(theater_id),
        constraint movie_type_ck check(movie_type in('English','Tamil','Hindi','Telugu','Malayalam')),
        constraint movie_status_ck check(movie_status in('Available','Notavailable')));

insert into movie(movie_name,theater_id,movie_type,movie_status)values('charlie',01,'Malayalam','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('charlie',02,'Malayalam','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('charlie',03,'Malayalam','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('pyar prema kadhal',04,'Tamil','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('pyar prema kadhal',05,'Tamil','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('Okadhal Kanmani',06,'Tamil','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('Okadhal Kanmani',07,'Tamil','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('Okadhal Kanmani',08,'Tamil','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('charlie',09,'Malayalam','Available');
insert into movie(movie_name,theater_id,movie_type,movie_status)values('charlie',10,'Tamil','Available');

select * from movie;



| movie_name        | theater_id | movie type | movie_status |            
|-------------------|------------|----------- |--------------|
| charlie           |      1     |  Malayalam |   Available  |  
| pyar prema kadhal |      2     |  Tamil     |   Available  |
| Okadhal Kanmani   |      3     |  Tamil     |   Available  |

```

### Featuers 2: Theater information.

```sql
create table theater(theater_name varchar2(30),
    theater_id number,
    number_seats number,
    theater_address varchar2(40) not null,
    theater_rating number,
    constraint theater_uq unique(theater_name,theater_id),
    constraint theater_fk foreign key (theater_id) references movie (theater_id));

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('PVR',01,300,'sky walk chennai',4);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('inox',02,200,'chandra mall chennai',3);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('Rohini',03,300,'Rohini koyambedu',4);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('Imax',04,140,'Mayajal chennai',5);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('Vidhya',05,250,'Tambaram',4);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('MR',06,100,'MR Koyambedu',3);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('Imax',07,180,'Luxe Chenai',4);

insert into theater(theater_name,theater_id,number_seats,theater_address,theater_rating)
values('Phoniex',08,200,'EA Chennai',5);

select * from theater;


| theater_name | theater_id | number_seats | theater_address  | theater_rating |
|--------------|------------|--------------|------------------|----------------|
|      PVR     |      1     |      300     | Sky walk chennai |        5       |
|     Inox     |      2     |      200     |  Mayajal chennai |        3       |
|    Rohini    |      3     |      250     | Rohini koyambedu |        4       |

```

### Featuers 3: Users information.

```sql

create table users(user_id number,
        user_name varchar2(30) not null,
        email_id varchar2(30),
        epassword varchar2(8)not null,
        mobile_num number(10),
        gender varchar2(10)not null,
        constraint users_uq unique(email_id,mobile_num),
        constraint user_id_pk primary key(user_id),
        constraint mobile_num_ck check(mobile_num not like('%[^0-9]%')),
        constraint gender_ck check(gender in('male','female')));

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398380,'Kumar','kumar@gmail.com','kum',9047379880,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398381,'sandy','sandy@gmail.com','san',9047379881,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398382,'Ajmal A','ajmal@gmail.com','ajmal',9047379882,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398383,'sujitha','suji@gmail.com','suj',9047379883,'female');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398384,'nivi','nivi@gmail.com','niv',9047379884,'female');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398385,'suri','suri@gmail.com','sur',9047379885,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398386,'mohan','mohan@gmail.com','moh',9047379886,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398387,'siveka','siveka@gmail.com','siv',9047379887,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398388,'arjun','arjun@gmail.com','arj',9047379888,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398389,'sruthi','sruthi@gmail.com','sru',9047379889,'female');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398390,'john','john@gmail.com','joh',9047379890,'male');

insert into users(user_id,user_name,email_id,epassword,mobile_num,gender)
values(398391,'Prasanth','prasanth@gmail.com','pra',9047379891,'male');

select * from users;


| user_id | user_name | email_id            | epassword | mobile_num | gender |
|---------|-----------|---------------------|-----------|------------|--------|
| 398380  |   sandy   |   sandy@gmail.com   |    san    | 9047379880 |  male  |
| 398381  |   ajmal   | ajmail@chainsys.com |    ajm    | 9047379881 |  male  |
| 398382  |   sivika  |   sivika@gmail.com  |    siv    | 9047379882 |  male  |

```

### Featuers 4: Booked information.

```sql

create table booked(booked_id number,
        users_id number not null,
        movie_name varchar2(20),
        booked_seats number not null,
        amount number not null,
        payment_status varchar2(30) not null,
        booked_date timestamp default systimestamp,
        movie_timing timestamp,
        seat_type varchar2(100),
        constraint booked_id_pk primary key(booked_id),
        constraint users_id_fk foreign key(users_id) references users(user_id),
        constraint payment_status_ck check(payment_status in('complete','pending','cancelled')),
        constraint seat_type_ck check(seat_type in('normal','premium','vip')));
        
insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(11,398382,'charlie',2,500,'complete','12 pm','premium');

insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(12,398383,'pyar prema kadhal',5,1000,'complete','3 pm','vip');

insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(13,398384,'charlie',8,1600,'complete','12 pm','vip');

insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(14,398385,'pyar prema kadhal',2,500,'complete','3 pm','premium');

insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(15,398386,'charlie',5,500,'complete','12 pm','normal');

insert into booked(booked_id,users_id,movie_name,booked_seats,amount,payment_status,movie_timing,seat_type)
values(16,398387,'pyar prema kadhal',80,8000,'complete','3 pm','normal');


select * from booked;


| booked_id | user_id | movie_name        | booked_seats | amount | payment_status | booked_date | movie_timing | seat_type |
|-----------|---------|-------------------|--------------|--------|----------------|-------------|--------------|-----------|
|     11    | 398382  | charlie           |       5      |   900  |    complete    | 02-Jan-2020 |     12 pm    |    vip    |
|     22    | 398390  | OK kanmani        |       2      |   240  |   processing   | 02-Jan-2020 |     3 pm     |   normal  |
|     33    | 398388  | OK kanmani        |       1      |   200  |    complete    | 02-Jan-2020 |     12 pm    |  premium  |
|     44    | 398386  | pyar prema kadhal |       3      |   360  |     decline    | 02-Jan-2020 |     3 pm     |   normal  |

```
