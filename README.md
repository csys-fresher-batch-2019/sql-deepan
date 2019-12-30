# Ticket_Booking app

* https://ticketbooking.in

## Features

* user should able to view all movies.

### Featuers 1: Create user details.

```sql
create table users(user_id number not null,
user_name varchar2(30) not null,
email_id varchar2(30)not null,
epassword varchar2(8)not null,
mobile_num number(10)not null,
gender varchar2(10)not null,

constraint user_id_pk primary key(user_id),
constraint mobile_num_ck check(mobile_num not like('%[^0-9]%')),
constraint gender_ck 
check(gender in('male','female')));
```
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
drop table users;

### Features 2: 
