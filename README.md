# Movie_Ticket_Booking_app

* https://ticketbooking.in

## Features

* User information.

### Featuers 1: Movie information.

```sql
create table movie(movie_name varchar2(20) not null,
        movie_id number,  
        movie_type varchar2(30) not null,
        price number,
        constraint movie_id primary key (movie_id),
        constraint movie_type_ck check(movie_type in('English','Tamil','Hindi','Telugu','Malayalam'))); 

insert into movie(movie_name,movie_id,movie_type,price)
values('charlie',111,'Hindi',200);

insert into movie(movie_name,movie_id,movie_type,price)
values('pyar prema kadhal',222,'Tamil',100);

insert into movie(movie_name,movie_id,movie_type,price)
values('Okadhal Kanmani',333,'Tamil',150);

select * from movie;

| movie_name        | movie_id | movie_type | price |
|-------------------|----------|------------|-------|
| Okadhal Kanmani   | 333      | Tamil      | 150   |
| charlie           | 111      | Hindi      | 200   |
| pyar prema kadhal | 222      | Tamil      | 100   |

```

### Featuers 2: Theatre information.

```sql
create table theatre(theatre_name varchar2(30),
    theatre_id number,
    number_seats number,
    theatre_address varchar2(40) not null,
    theatre_rating number,
    constraint theatre_uq unique(theatre_name,theatre_id),
    constraint theatre_id primary key (theatre_id));

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('PVR',01,100,'sky walk chennai',4);

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('inox',02,200,'chandra mall chennai',3);

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('Rohini',03,300,'Rohini koyambedu',4);

select * from theatre;

| theatre_name | theater_id | number_seats | theatre_address      | theatre_rating |
|--------------|------------|--------------|----------------------|----------------|
| PVR          | 1          | 100          | sky walk chennai     | 4              |
| inox         | 2          | 200          | chandra mall chennai | 3              |
| Rohini       | 3          | 300          | Rohini koyambedu     | 4              |

```

### Featuers 3: movie_theatre information.

```sql

create table movie_theatre(movie_id number not null,
        theatre_id number not null,
        active number default 1,
        constraint theatre_id_fk foreign key (theatre_id) references theatre (theatre_id),
        constraint movie_id_fk foreign key (movie_id) references movie (movie_id),
        constraint active_ck check(active in(1,0)));

insert into movie_theatre(movie_id,theater_id)
values(111,01);
insert into movie_theatre(movie_id,theater_id)
values(222,02);
insert into movie_theatre(movie_id,theater_id)
values(333,03);


select * from movie_theatre;

| movie_id | theatre_id | active |
|----------|------------|--------|
| 111      | 1          | 1      |
| 222      | 2          | 1      |
| 333      | 3          | 1      |

```

### Featuers 4: User informations.

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

select * from users;

| user_id | user_name | gmail_id        | epassword | mobile_number | gender |
|---------|-----------|-----------------|-----------|---------------|--------|
| 398380  | Kumar     | kumar@gmail.com | kum       | 9047379880    | male   |
| 398381  | sandy     | sandy@gmail.com | san       | 9047379881    | male   |
| 398382  | Ajmal A   | ajmal@gmail.com | ajmal     | 9047379882    | male   |

```
### Featuers 4: Booked informations.

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
