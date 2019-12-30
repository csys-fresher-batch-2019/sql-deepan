# Ticket_Bokking app

* https://ticketbooking.in

## Features

* user should able to view all movies.

### Featuers 1: List of all the movies.

```sql
create table movie(movie_name varchar2(20) not null,
theater_id number not null,
movie_name varchar2(100) not null,
movie_type varchar2(30) not null,
movie_status varchar2(40)not null,

constraint movie_name_pk primary key(movie_name),
constraint movie_type_ck check(movie_type in('english','tamil','hindi','telugu','malayalam')),
constraint movie_status_ck check(movie_status in('available','notavailable')));
```
