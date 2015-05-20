create table filter_choice(
filter_choice_id int auto_increment primary key
, filter_choice_val varchar(50), sort_id int);
create table change_log(id int auto_increment primary key, updated_by int, tbl varchar(50), changes varchar(10000)
,trans_id varchar(50),created_at timestamp default now());
alter table vacancy_progress change column required required int;
alter table contract_history drop column principal_advisor, drop column financial_controller, drop column team_leader, drop column office_manager;
alter table contract_history2 drop column principal_advisor, drop column financial_controller, drop column team_leader, drop column office_manager;
alter table settings drop primary key, add settings_id int auto_increment primary key;