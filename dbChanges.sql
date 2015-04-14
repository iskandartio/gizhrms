alter table job_position change column position_id job_position_id int auto_increment;
alter table job_position change column position job_position varchar(50);
alter table job_position  add  sort_id int;
alter table job_title add  sort_id int;
alter table applicants  change column position job_position varchar(50);
alter table contract_history change column position job_position varchar(50);
alter table employee_dependent change column  name dependent_name varchar(50);