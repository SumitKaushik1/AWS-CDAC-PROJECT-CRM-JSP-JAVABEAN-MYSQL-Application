

use main_project;
show tables;

insert into users(user_id, user_first_name, user_last_name, user_password, user_mobile, user_address)values('u1111111111','sumit','kaushik','Sumit@123',7417929862,'house number 6 bagla enclave sikandra bodla road agra');
insert into users(user_id, user_first_name, user_last_name, user_password, user_mobile, user_address)values('u1111111112','pritam','sharma','Sumit@124',6395923974,'house number 7 bagla enclave sikandra bodla road agra');
insert into users(user_id, user_first_name, user_last_name, user_password, user_mobile, user_address)values('u1111111113','akash','pandey','Sumit@125',9456617331,'house number 8 bagla enclave sikandra bodla road agra');
insert into users(user_id, user_first_name, user_last_name, user_password, user_mobile, user_address)values('u1111111114','devesh','singh','Sumit@126',9457874139,'house number 9 bagla enclave sikandra bodla road agra');

insert into roles(role_id, role_name, role_description) values('r1111111111','admin','all access');
insert into roles(role_id, role_name, role_description) values('r1111111112','manager','manage salesman details and check customer details');
insert into roles(role_id, role_name, role_description) values('r1111111113','engineer','manage only  product details');
insert into roles(role_id, role_name, role_description) values('r1111111114','CEO','has access to see all details');

insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111111','customer','create','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111112','customer','read','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111113','customer','update','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111114','customer','delete','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111115','salesman','create','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111116','salesman','read','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111117','salesman','update','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111118','salesman','delete','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111119','product','create','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111120','product','read','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111121','product','update','r1111111111');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111122','product','delete','r1111111111');


insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111123','customer','read','r1111111112');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111124','salesman','update','r1111111112');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111125','salesman','create','r1111111112');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111126','salesman','delete','r1111111112');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111127','salesman','read','r1111111112');

insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111129','product','read','r1111111113');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111130','product','update','r1111111113');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111131','product','create','r1111111113');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111132','product','delete','r1111111113');

insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111133','customer','read','r1111111114');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111134','salesman','read','r1111111114');
insert into permission(per_id,per_module,per_name,Roles_role_id) values('p1111111135','product','read','r1111111114');


Alter table permission add constraint composite_key_name unique(per_module,per_name,Roles_role_id);

insert into `schedule` (sch_id, sch_type, sch_description) values ('sh1111111111','Morning','morning shift from 9am to 5 pm');
insert into `schedule` (sch_id, sch_type, sch_description) values ('sh1111111112','Night','night shift from 8pm  to 5 am');