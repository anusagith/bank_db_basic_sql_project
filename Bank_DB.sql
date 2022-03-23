create database bank_db;

use bank_db;

-- creating table for employee details --

create table bank_empl
( emp_id int NOT NULL,                -- primary key --
emp_fname varchar(30) NOT NULL,
emp_lname varchar(30) NOT NULL,
dept_name varchar(30),
start_date date,
emp_salary int,
primary key (emp_id)
);

-- creating a table for account details --

create table bank_acc
( acc_id int,   
acc_type varchar(10) not null,
acc_status varchar(10) not null,
current_balance int,
primary key (acc_id)
);

-- creating table for customer details --

create table bank_cust
( cust_id int,   
acc_id int,           
cust_fname varchar(30) not null,
cust_lname varchar(30) not null,
gender varchar(10),
cust_dob date not null,
cust_job varchar(30),
cust_address varchar(30) not null,
cust_city varchar(30),
cust_state varchar(30),
cust_email varchar(45),
cust_phone char(15),
cust_mob char(15) not null,
primary key (cust_id),
constraint cust_acc_fk foreign key (acc_id) references bank_acc(acc_id) on update cascade on delete cascade
);


-- creating table for user-login and linking with customer account --

create table login 
( login_id int,     
login_name varchar(10),
login_pswrd varchar(20),
cust_id int,
primary key (login_id),
constraint login_fk foreign key (cust_id) references bank_cust(cust_id)    
);

-- create table for login security questions --

create table login_security
( secure_id int,
secure_quest1 varchar(50),
secure_quest2 varchar(50),
secure_quest3 varchar(50),
primary key (secure_id)
);

-- creating link between login and login security --

create table security_answers
( login_id int,
secure_id int,
foreign key (login_id) references login(login_id),
foreign key (secure_id) references login_security(secure_id),
secure_ans1 varchar(50) not null,
secure_ans2 varchar(50) not null,
secure_ans3 varchar(50) not null
);

-- creating table for transactions --

create table acc_transac
( trans_id int auto_increment,
trans_type varchar(15) not null,
trans_amnt int not null,
trans_date date not null,
emp_id int,
acc_id int,
cust_id int,
login_id int,
primary key (trans_id),
constraint emp_transfk foreign key (emp_id) references bank_empl(emp_id),
constraint acc_transfk foreign key (acc_id) references bank_acc(acc_id),
constraint cust_transfk foreign key (cust_id) references bank_cust(cust_id),
constraint login_transfk foreign key (login_id) references login(login_id)
);

-- INSERTING AND VIEWING VALUES OF ALL TABLES --

-- Values in bank employee table --
insert into bank_empl values (01, 'Lakshmi', 'Narayan', 'IT', '2019-02-26', 50000);
insert into bank_empl values (02, 'Parvathy', 'Nambiar', 'Sales', '2018-06-16', 40000);
insert into bank_empl values (03, 'Rahul', 'Sharma', 'IT', '2019-02-14', 75000);
insert into bank_empl values (04, 'Rohit', 'Panicker', 'Customer Relations', '2018-08-26', 35000);
insert into bank_empl values (05, 'Thankam', 'Thomas', 'Accounts Manager', '2018-04-14', 60000);
insert into bank_empl values (06, 'Joy', 'Varghese', 'IT', '2018-05-22', 85000);
insert into bank_empl values (07, 'Gauri', 'Shankar', 'Accounts Executive', '2018-09-15', 35000);
insert into bank_empl values (08, 'Zayn', 'Ali', 'Sales', '2019-01-12', 35000);
insert into bank_empl values (09, 'Nivra', 'James', 'Sales', '2018-11-16', 45000);
insert into bank_empl values (10, 'Pushpa', 'Babu', 'Cashier', '2018-03-13', 45000);

-- viewing babk employee table --
select * from bank_empl;

-- inserting values to bank account table --

insert into bank_acc values (101, 'SAVINGS', 'NRE', 5000);
insert into bank_acc values (102, 'SAVINGS', 'FD', 5000);
insert into bank_acc values (103, 'SAVINGS', 'NRO', 3000);
insert into bank_acc values (104, 'SAVINGS', 'LOCAL', 0);
insert into bank_acc values (105, 'SAVINGS', 'MF', 500);

-- viewing accounts table --
select * from bank_acc;

-- inserting value in customer table --
insert into bank_cust values (001, 101,'Anupama', 'Sagith', 'female','1988-07-14', 'Analyst', 'Al Karama', 'Karama', 'Dubai', 'testemail@gmail.com', 2475426, 0541248754);
insert into bank_cust values (002, 102,'Sarika', 'Prashob', 'female','1990-10-13', 'Sales', 'Hor Al Anz', 'Deira', 'Dubai', 'sarika@gmail.com', 2497229, 0568954215);
insert into bank_cust values (003, 103, 'Prarthana', 'Nair', 'female','1982-04-30', 'Dentist', 'jabel ali', 'Dubai', 'Dubai', 'prarnair@gmail.com', 2487024, 0563542189);
insert into bank_cust values (004, 104, 'Naitik', 'Raj','male', '1985-07-25', 'Teacher', 'Al mamzar', 'Deira', 'Dubai', 'raj_naitik@gmail.com', 2445287, 0509638521);
insert into bank_cust values (005, 105, 'Rohan', 'Samuel', 'male','1990-01-10', 'Sales', 'Al Karama', 'Karama', 'Dubai', 'rohanhere@gmail.com', 2473259, 0504589674);
insert into bank_cust values (006, 105, 'Santhosh', 'Varghese','male', '1989-12-11', 'Scientist', 'Al Karama', 'Karama', 'Dubai', 's_varghese@gmail.com', 2489712, 0527458963);
insert into bank_cust values (007, 104, 'Vandana', 'Dhyan', 'female','1994-05-15', 'Doctor', 'Downtown', 'Dubai', 'Dubai', 'itsvandana@gmail.com', 2434987, 0557869532);
insert into bank_cust values (008, 101, 'Dilip', 'Xaviour', 'male','1985-02-14', 'Buisiness Development', 'Al karama', 'Karama', 'Dubai', 'dilipx@gmail.com', 2462658, 0507419635);
insert into bank_cust values (009, 102, 'Tapasya', 'Varma', 'female','1988-07-23', 'Model', 'Al Karama', 'Karama', 'Dubai', 'tappu_varma@gmail.com', 2412065, 0554896541);
insert into bank_cust values (010, 103, 'Varghese', 'V', 'male','1986-07-24', 'Sales', 'Hor Al Anz', 'Deira', 'Dubai', 'vv_1986@gmail.com', 2493621, 0512365478);

-- viewing custmer table --
select * from bank_cust;

-- inserting values in login table --

insert into login values (01101, 'anu01', 'firstpswrd',001);
insert into login values (01002, 'sari02', 'secndpswrd',002);
insert into login values (10003, 'prar03', 'thirdpswrd',003);
insert into login values (00104, 'nraj04', 'quadpswrd',004);
insert into login values (10105, 'rohan05', 'pentpswrd',005);
insert into login values (11106, 'sanvar06', 'hexpswrd',006);
insert into login values (11007, 'vdhyan07', 'septpswrd',007);
insert into login values (00208, 'dilx08', 'octpswrd',008);
insert into login values (02009, 'tappu09', 'nanopswrd',009);
insert into login values (20010, 'varghese10', 'dozenpswrd',010);

-- view login table --
select * from login;

-- inserting values to security questions table --

insert into login_security values (501, 'who is your childhood best friend?','color of your first car','dream plcae to be?');
insert into login_security values (502, 'who is your favourie teacher in school?','favourite baby name?','worst nightmare?');
insert into login_security values (503, 'favourite hobby?','place you weere born?','your family name?');

-- viewing securit table --

select * from login_security;

-- inserting values in security answers table --

insert into security_answers values (00104, 503, 'skydiving','oman','rajhomes');
insert into security_answers values (00208, 501, 'me','silver','home');
insert into security_answers values (01002, 502, 'prameela','dhruraj','failure');
insert into security_answers values (01101, 501, 'myheart','silver','shimla');
insert into security_answers values (02009, 503, 'trecking','dubai','panicker');
insert into security_answers values (10003, 502, 'radhakrishnan','nidhi','oblivion');
insert into security_answers values (10105, 501, 'achu','red','switzerland');
insert into security_answers values (11007, 503, 'swimming','trivandrum','sreenivas');
insert into security_answers values (11106, 502, 'suresh','pavithra','spiders');
insert into security_answers values (20010, 503, 'nothing','thrissur','nest');

-- viewing security answers table --

select * from security_answers;

-- inserting values to account transsaction table --

insert into acc_transac values (801,'NEFT',10000, '2021-05-18', 05, 101,001,01101);
insert into acc_transac values (802,'Withdrawal',5000, '2021-05-18', 07, 102,002,01002);
insert into acc_transac values (803,'Deposit',20000, '2021-05-18', 07, 103,003,10003);
insert into acc_transac values (804,'Deb Crd Charges',50, '2021-05-18', 05, 104,004,00104);
insert into acc_transac values (805,'NEFT',15000, '2021-05-18', 07, 105,005,10105);

-- viewing acc_transac table --

select * from acc_transac;

-- table joins --

select * from bank_cust bc inner join login l on bc.cust_id = l.cust_id;

select * from login l inner join security_answers sa on l.login_id = sa.login_id;

-- multiple table joins --

select login_name, login_pswrd, secure_quest1,secure_quest2, secure_quest3, secure_ans1, secure_ans2, secure_ans3 
from login l inner join security_answers sa on l.login_id = sa.login_id inner join login_security ls 
on ls.secure_id = sa.secure_id;

select trans_type, trans_amnt, trans_date, emp_fname, dept_name, cust_fname from acc_transac act inner join
bank_empl be on act.emp_id = be.emp_id inner join bank_cust bc on act.cust_id = bc.cust_id;

select cust_fname, cust_lname, current_balance from bank_cust bc inner join bank_acc ba on bc.acc_id = ba.acc_id 
where current_balance > 1000;

-- QUERYING USING LOGICAL OPERATORS --

select cust_fnam from bank_cust where cust_fname like 'A%'; -- name starts with a --
select cust_fname from bank_cust where cust_fname like '%A'; -- name ends with a --
select cust_fname from bank_cust where cust_fname like '_i%'; -- names that have i in second position --

select * from acc_transac where trans_amnt > 1000 order by trans_amnt;

-- AGGREGATE FUNCTIONS --

select min(trans_amnt) from acc_transac;

select max(trans_amnt) as Highest_Trans_Amnt from acc_transac;

select count(emp_id) as Total_Emp, dept_name from bank_empl group by dept_name;

select dept_name from bank_empl group by dept_name having sum(emp_salary) > 50000;

-- creating a vieew of customers from Al Karama --

create view karama_cust as 
select cust_fname, cust_lname, cust_mob from bank_cust where cust_city = 'Al Karama';

select * from karama_cust;