# Movie_Ticket_Booking_app

* https://ticketbooking.in

## Features

* User information.

### Featuers 1: Movie information.

```sql
create table movie(
        movie_id number,  
        movie_name varchar2(20) not null,
        movie_type varchar2(30) not null,
        movie_language varchar2(30)not null,
        movie_rating number,
        movie_duration number,
        released_date date,
        image_url varchar2(100);
        constraint movie_id primary key (movie_id),
        constraint movie_type_ck check(movie_type in('comedy','horror','action','historical','Romance')),
        constraint movie_language_ck check(movie_language in('English','Tamil','Hindi','Telugu','Malayalam'))); 
        create sequence movie_id_seq start with 999;
        
        
insert into movie(movie_id,movie_name,movie_type,movie_language,movie_rating,movie_duration,released_date,image_url)
values(movie_id_seq.nextval,'charlie','Romance','Hindi',5,3,to_date('2020-01-25','YYYY-MM-DD'));

select * from movie;

| movie_name        | movie_id | movie_tpe | movie_language | movie_rating | movie_duration | released_date |   image_url   |
|-------------------|----------|-----------|----------------|--------------|----------------|---------------|---------------|
| charlie           | 999      | Romance   | Hindi          | 5            | 3              | 25-01-20      | charlie.jpg   |
| Ok kanmani        | 1000     | Romance   | Tamil          | 4            | 3              | 12-10-19      | okkanmani.jpg |
| Pyar prema kadhal | 1001     | Romance   | Tamil          | 5            | 2              | 22-10-19      |   prema.jpg   |

```

### Featuers 2: Theatre information.

```sql
create table theatre(theatre_name varchar2(30),
    theatre_id number,
    number_seats number,
    theatre_address varchar2(40) not null,
    theatre_rating number,
    theatre_image_url varchar2(100);
    constraint theatre_uq unique(theatre_name,theatre_id),
    constraint theatre_id primary key (theatre_id));

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('PVR',01,100,'sky walk chennai',4);

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('inox',02,200,'chandra mall chennai',3);

insert into theater(theatre_name,theatre_id,number_seats,theatre_address,theare_rating)
values('Rohini',03,300,'Rohini koyambedu',4);

select * from theatre;

| theatre_name | theater_id | number_seats | theatre_address      | theatre_rating |theatre_image_url   |
|--------------|------------|--------------|----------------------|----------------|--------------------|
| PVR          | 1          | 100          | sky walk chennai     | 4              |   pvr.jpg          |
| inox         | 2          | 200          | chandra mall chennai | 3              |   inox.jpg         |
| Rohini       | 3          | 300          | Rohini koyambedu     | 4              |   rohini.jpg       |

```

### Featuers 3: movie_theatre information.

```sql

create table movie_theatre( movie_theatre_id number , 
        movie_id number not null,
        theatre_id number not null,
        active number default 1,
        price number not null,
        movie_timing varchar2(20),
        constraint movie_theatre_id_pk primary key(movie_theatre_id),
        constraint theatre_id_fk foreign key (theatre_id) references theatre (theatre_id),
        constraint movie_id_fk foreign key (movie_id) references movie (movie_id),
        constraint active_ck check(active in(1,0)));
        create sequence movie_theatre_id_seq start with 111;

insert into movie_theatre(movie_id,theatre_id,movie_timing)
values(111,01,'12:00:00 pm');

insert into movie_theatre(movie_id,theatre_id,movie_timing)
values(222,01,'8:00:00 pm');

insert into movie_theatre(movie_id,theatre_id,movie_timing)
values(333,01,'6:00:00 pm');


select * from movie_theatre;

| movie_theatre_id | movie_id | theatre_id | active | price |  movie_timing     |
|------------------|----------|------------|--------|-------|-------------------|
| 116              | 999      | 1131       | 1      | 150   | 12:00             |
| 117              | 1000     | 1133       | 1      | 100   | 01:00             |
| 118              | 999      | 1132       | 1      | 200   | 03:00             |
| 119              | 1001     | 1132       | 1      | 200   | 05:00             |
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
        constraint gender_ck check(gender in('male','female','others')));

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

create table booked(
        movie_theatre_id number,
        booked_id number primary key,
        users_id number not null,
        booked_seats number not null,
        amount number,
        payment_status varchar2(30) not null,
        booked_date timestamp default systimestamp,
        constraint users_id_fk foreign key(users_id) references users (user_id),
        constraint movie_theatre_id_fk foreign key(movie_theatre_id) references movie_theatre(movie_theatre_id),
        constraint payment_status_ck check(payment_status in('complete','pending','cancelled')));
        
        create sequence booked_id start with 1 increment by 1;
        
        
insert into booked(movie_theatre_id,booked_id,users_id,booked_seats,amount,payment_status)
values(115,booked_id.nextval,11159,10,'complete',150);

    
    select * from booked_id;
    
| booked_id | user_id | movie_id | number_seats | amount | booked _status |      booked_timing             |    show_date
|-----------|---------|----------|--------------|--------|----------------|--------------------------------|--------------------------
| 1         | 11156   | 115      | 2            | 300    | complete       | 25-01-20 06:02:36.397000000 PM | 24-02-2020
| 2         | 11157   | 115      | 4            | 600    | complete       | 25-01-20 06:02:59.665000000 PM | 25-02-2020
| 3         | 11159   | 115      | 1            | 150    | complete       | 25-01-20 06:03:21.616000000 PM |  24-02-2020
```

