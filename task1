create table chain(
emp_id varchar2(20) not null,
task_name varchar2(30) not null,
task_deadline date not null,
task_status varchar2(30),
completed_on date , 
constraint ck_3 check (completed_on <= task_deadline));

alter table chain add (priority varchar2(10),create_date timestamp default current_timestamp,
modify_date date);

insert into chain(emp_id,task_name,task_deadline,task_status,completed_on,priority,modify_date)
values(1,'oracle_installation',to_date('20-12-2019','dd-mm-yyyy'),'sucess',to_date('19-12-2019','dd-mm-yyyy'),1,to_date('28-12-2019','dd-mm-yyyy'));

insert into chain(emp_id,task_name,task_deadline,task_status,completed_on,priority,modify_date)
values(2,'oracle_installation',to_date('20-12-2019','dd-mm-yyyy'),'sucess',to_date('19-12-2019','dd-mm-yyyy'),2,to_date('28-12-2019','dd-mm-yyyy'));

insert into chain(emp_id,task_name,task_deadline,task_status,completed_on,priority,modify_date)
values(3,'oracle_installation',to_date('20-12-2019','dd-mm-yyyy'),'sucess',to_date('19-12-2019','dd-mm-yyyy'),3,to_date('28-12-2019','dd-mm-yyyy'));

