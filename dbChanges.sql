alter table contract_history add office_manager int, change column responsible_superior responsible_superior int;
alter table contract_history2 add office_manager int, change column responsible_superior responsible_superior int;
alter table applicants add job_title varchar(50)
, add position varchar(50), add project_name varchar(50)
, add principal_advisor int, add financial_controller int, add project_number varchar(50)
, add team_leader int, add project_location varchar(50), add office_manager int
, add responsible_superior int, add SAP_No varchar(50), add working_time int
, add salary varchar(300), add salary_band varchar(5);
alter table employee_education change column country countries_id int;
create table relation(relation_id int auto_increment primary key
, relation varchar(50), sort_id int);