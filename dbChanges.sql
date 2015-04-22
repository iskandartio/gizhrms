alter table job_position change column position_id job_position_id int auto_increment;
alter table job_position change column position job_position varchar(50);
alter table job_position  add  sort_id int;
alter table job_title add  sort_id int;
alter table applicants  change column position job_position varchar(50);
alter table contract_history change column position job_position varchar(50);
alter table employee_dependent change column  name dependent_name varchar(50);
create table m_role_module(role_id int, module_id int, primary key(role_id, module_id));
create table m_module(module_id int auto_increment primary key, module_name varchar(50), module_description varchar(50), status_id int, category_id int, sort_id int,sub_module int);
alter table m_role add status_id int;
create table m_category(category_id int auto_increment primary key, category_name varchar(50));
create table m_category(category_id int auto_increment primary key, category_name varchar(50), sort_id int);