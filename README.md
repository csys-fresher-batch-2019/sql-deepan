# Movie_Ticket_Booking_app

* https://ticketbooking.in

## Features

* User information.

### Featuers 1: Movie information.

```sql
create table movie(movie_name varchar2(20) not null,
        movie_id number,  
        movie_type varchar2(30) not null,
        movie_rating number,
        price number,
        constraint movie_id primary key (movie_id),
        constraint movie_type_ck check(movie_type in('English','Tamil','Hindi','Telugu','Malayalam'))); 

insert into movie(movie_name,movie_id,movie_type,price,movie_rating)
values('charlie',111,'Hindi',200,'8');

insert into movie(movie_name,movie_id,movie_type,price,movie_rating)
values('pyar prema kadhal',222,'Tamil',100,'7');

insert into movie(movie_name,movie_id,movie_type,price,movie_rating)
values('Okadhal Kanmani',333,'Tamil',150'8');

select * from movie;

| movie_name        | movie_id | movie_type | price |movie_rating|
|-------------------|----------|------------|-------|------------|
| Okadhal Kanmani   | 333      | Tamil      | 150   |    8       |
| charlie           | 111      | Hindi      | 200   |    7       |
| pyar prema kadhal | 222      | Tamil      | 100   |    8       |

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

create table booked(booked_id number not null primary key,
        users_id number not null,
        booked_seats number not null,
        amount number,
        payment_status varchar2(30) not null,
        booked_date timestamp default systimestamp,
        seat_type varchar2(100),
        constraint users_id_fk foreign key(users_id) references users(user_id),
        constraint payment_status_ck check(payment_status in('complete','pending','cancelled')),
        constraint seat_type_ck check(seat_type in('normal','premium','vip')));
        
        create sequence booked_id start with 1 increment by 1;
        
        insert into booked(booked_id,users_id,booked_seats,payment_status,seat_type)
values(booked_id.nextval,398383,10,'complete','premium');

insert into booked(booked_id,users_id,booked_seats,payment_status,seat_type)
values(booked_id.nextval,398384,7,'complete','premium');

insert into booked(booked_id,users_id,booked_seats,payment_status,seat_type)
values(booked_id.nextval,398385,8,'complete','premium');

insert into booked(booked_id,users_id,booked_seats,payment_status,seat_type)
values(booked_id.nextval,398386,10,'complete','premium');

        
| booked_id | user_id | booked_seats | payment_status | booked_timing                  | price | seat_type |
|-----------|---------|--------------|----------------|--------------------------------|-------|-----------|
| 1         | 398383  | 10           | complete       | 02-01-20 07:39:59.521000000 PM | 120   | premium   |
| 2         | 398384  | 7            | complete       | 02-01-20 07:40:09.769000000 PM | 100   | normal    |
| 3         | 398385  | 8            | complete       | 02-01-20 07:40:16.019000000 PM | 150   | vip       |

```

### Scenarios:


* select * from movie_theatre where movie_timing ='12:00:00 pm';


| movie_id | theater_id | active | movie_time  |
|----------|------------|--------|-------------|
| 111      | 1          | 1      | 12:00:00 pm |
| 222      | 1          | 1      | 12:00:00 pm |
| 333      | 1          | 1      | 12:00:00 pm |



* select * from movie where movie_id ='111';

| movie_name | movie_id | movie_type | price |
|------------|----------|------------|-------|
| charlie    | 111      | Hindi      | 200   |



* select * from movie_theatre mt inner join movie m on mt.movie_id = m.movie_id inner join theatre t on mt.theatre_id =t.theatre_id;


| active | movie_time  | movie_name        | movie_id | movie_type | price | theatre_name |price|theatre_name      | theatre_rating  |
|--------|-------------|-------------------|----------|------------|-------|--------------|-----|------------------|-----------------|
| 1      | 3:00:00 pm  | Okadhal Kanmani   | 333      | Tamil      | 150   | PVR          | 100 | sky walk chennai | 4               |
| 1      | 3:00:00 pm  | pyar prema kadhal | 222      | Tamil      | 100   | PVR          | 100 | sky walk chennai | 3               |
| 1      | 12:00:00 pm | Okadhal Kanmani   | 333      | Tamil      | 150   | PVR          | 100 | sky walk chennai | 4               |


* select m.movie_name,t.theatre_name,mt.movie_timing from movie m,theatre t,movie_theatre mtwhere t.theatre_id = mt.theatre_id and mt.movie_id = m.movie_id;

| movi_name         | theater_name | movie_time  |
|-------------------|--------------|-------------|
| Okadhal Kanmani   | PVR          | 3:00:00 pm  |
| pyar prema kadhal | PVR          | 3:00:00 pm  |
| Okadhal Kanmani   | PVR          | 12:00:00 pm |
| pyar prema kadhal | PVR          | 12:00:00 pm |
| charlie           | PVR          | 12:00:00 pm |
| pyar prema kadhal | inox         | 6:00:00 pm  |
| Okadhal Kanmani   | Rohini       | 3:00:00 pm  |



