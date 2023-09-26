use main_project;
insert into users (user_id,user_first_name,user_last_name,user_password,user_mobile,user_address)
values('u1111111111','sumit', 'kaushik','Sumit@123',7417929862,'house number 6 bagla enclave sikandra bodla road agra
');
insert into users (user_id,user_first_name,user_last_name,user_password,user_mobile,user_address)
values('u1111111112','pritam','sharma','Sumit@124',6395923974,'house number 7 bagla enclave sikandra bodla road agra'
);

insert into users (user_id,user_first_name,user_last_name,user_password,user_mobile,user_address)
values('u1111111113','akash','pandey','Sumit@125',9456617331,'house number 8 bagla enclave sikandra bodla road agra'
);
insert into users (user_id,user_first_name,user_last_name,user_password,user_mobile,user_address)
values('u1111111114','devesh','singh','Sumit@126',9457874139,'house number 9 bagla enclave sikandra bodla road agra'
);
-- -------------------------------------------------------------
insert into roles(role_id,role_name,role_description)
values('r1111111111', 'admin', 'all access');

insert into roles(role_id,role_name,role_description)
values('r1111111112', 'manager', 'manage salesman details and check customer details');

insert into roles(role_id,role_name,role_description)
values('r1111111113', 'engineer', 'manage only  product details'
);

insert into roles(role_id,role_name,role_description)
values('r1111111114', 'CEO', 'has access to see all details'
);

-- -------------------------------------------------------

select * from customer;
select * from login;
select * from product;
select * from roles;
select * from salesman;
select * from `schedule`;
select * from users;

