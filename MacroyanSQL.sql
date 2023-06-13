
CREATE DATABASE MacroyanMIS;

CREATE TABLE organizations (
	org_id		SERIAL PRIMARY KEY,
	organization_name 	NATIONAL CHARACTER VARYING,
    organization_description NATIONAL CHARACTER VARYING,
    organization_location     NATIONAL CHARACTER VARYING,
	organization_logo	NATIONAL CHARACTER VARYING
);

CREATE TABLE directorates(
	dir_id				SERIAL PRIMARY KEY,	
	dir_name			NATIONAL CHARACTER VARYING,
	dir_description		NATIONAL CHARACTER VARYING,
	dir_acceptance_date		DATE
);

CREATE TABLE  departments(
	dep_id				SERIAL PRIMARY KEY,
    dep_name  			NATIONAL CHARACTER VARYING,
    dep_description    	NATIONAL CHARACTER VARYING,
	dir_fk_id			SERIAL,
	CONSTRAINT dep_directorate FOREIGN KEY(dir_fk_id) REFERENCES directorates (dir_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE positions(
	pos_id				SERIAL PRIMARY KEY,				
	department_fk_id 	SERIAL,				
	position_name 		NATIONAL CHARACTER VARYING,
    position_desc    	NATIONAL CHARACTER VARYING,
    position_status    	NATIONAL CHARACTER VARYING,
	CONSTRAINT pos_department FOREIGN KEY(department_fk_id) REFERENCES departments (dep_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE position_titles(
    position_title_id		SERIAL PRIMARY KEY,
    position_title_name   NATIONAL CHARACTER VARYING,
    position_title_desc   NATIONAL CHARACTER VARYING,
    position_title_degree		  NATIONAL CHARACTER VARYING,
    position_title_step		INT,
	number_of_position	  	INT,
	position_fk_id			SERIAL,
	CONSTRAINT title_pos FOREIGN KEY(position_fk_id) REFERENCES positions (pos_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE job_responsibilities(
	resp_id			SERIAL PRIMARY KEY,
	resp_desc		NATIONAL CHARACTER VARYING,
	pos_title_fk_id	SERIAL,
	CONSTRAINT resp_posit_title FOREIGN KEY(pos_title_fk_id) 
	REFERENCES position_titles (position_title_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE employees(
	emp_id				SERIAL PRIMARY KEY,
	first_name			NATIONAL CHARACTER VARYING,
	last_name			NATIONAL CHARACTER VARYING,
	father_name 		NATIONAL CHARACTER VARYING,
	gender 				NATIONAL CHARACTER VARYING,
	phone_number		NATIONAL CHARACTER VARYING,
	email_address		NATIONAL CHARACTER VARYING,
    cur_province     	NATIONAL CHARACTER VARYING,
    cur_destric      	NATIONAL CHARACTER VARYING,
    cur_village      	NATIONAL CHARACTER VARYING,
    cur_house_num      	NATIONAL CHARACTER VARYING,
    per_province     	NATIONAL CHARACTER VARYING,
    per_destric      	NATIONAL CHARACTER VARYING,
    per_village      	NATIONAL CHARACTER VARYING,
	per_house_num      	NATIONAL CHARACTER VARYING,
    education_lavel 	NATIONAL CHARACTER VARYING,
    dob 				DATE,
    nid_number   		NATIONAL CHARACTER VARYING,
    nid_page_number 	INT,
    nid_reg_number    	INT, 
    father_job       	NATIONAL CHARACTER VARYING,
    emp_image    		NATIONAL CHARACTER VARYING,
    /* form sawanih Qalami */
    grand_father 		NATIONAL CHARACTER VARYING,
    nationality 		NATIONAL CHARACTER VARYING,
    military_services   NATIONAL CHARACTER VARYING,
    marital_status      NATIONAL CHARACTER VARYING,
    /* Sawanih Mamorin*/
    health_reports      NATIONAL CHARACTER VARYING,
	attachment    		NATIONAL CHARACTER VARYING
	
);

CREATE TABLE emp_relatives(
	/* Zawj or zawja Information*/
	rel_id				SERIAL PRIMARY KEY,
	rel_relation       	NATIONAL CHARACTER VARYING,
	rel_first_name       NATIONAL CHARACTER VARYING,
    rel_last_name        NATIONAL CHARACTER VARYING,
    rel_nid_number       NATIONAL CHARACTER VARYING,
	rel_father_name   	NATIONAL CHARACTER VARYING,
    rel_g_f_name  	 	NATIONAL CHARACTER VARYING,
    rel_job             NATIONAL CHARACTER VARYING,
    rel_job_address      NATIONAL CHARACTER VARYING,
    rel_cur_address   	NATIONAL CHARACTER VARYING,
    rel_per_address   	NATIONAL CHARACTER VARYING,
    emp_fk_id			SERIAL,
	CONSTRAINT rel_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_experiance(
	exp_id				SERIAL PRIMARY KEY,
	org_name 			NATIONAL CHARACTER VARYING,
    org_job_title		NATIONAL CHARACTER VARYING,
	org_address			NATIONAL CHARACTER VARYING,
	start_date 			DATE,
	end_date 			DATE,
    emp_fk_id			SERIAL,
	CONSTRAINT exp_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_trips(
	/* Trips*/
	trip_id				SERIAL PRIMARY KEY,
	trip_date 			DATE,
	trip_to	       		NATIONAL CHARACTER VARYING,
	trip_description    NATIONAL CHARACTER VARYING,
    emp_fk_id			SERIAL,
	CONSTRAINT trip_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE language_skills(
	lang_id				SERIAL PRIMARY KEY,
	language_name 		NATIONAL CHARACTER VARYING,
    reading			   	NATIONAL CHARACTER VARYING,
    writing				NATIONAL CHARACTER VARYING,
    speking		 		NATIONAL CHARACTER VARYING,
    listening		 	NATIONAL CHARACTER VARYING,
    emp_fk_id			SERIAL,
	CONSTRAINT lang_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_assets(
	asset_id				SERIAL PRIMARY KEY,
	asset_name 				NATIONAL CHARACTER VARYING,
    asset_type			   	NATIONAL CHARACTER VARYING,
    asset_price				NATIONAL CHARACTER VARYING,
    asset_description		NATIONAL CHARACTER VARYING,
    emp_fk_id			SERIAL,
	CONSTRAINT asset_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE guarantee_forms(
	gua_id			SERIAL PRIMARY KEY,
	first_name 		NATIONAL CHARACTER VARYING,
    last_name   	NATIONAL CHARACTER VARYING,
    father_name 	NATIONAL CHARACTER VARYING,
    job_description NATIONAL CHARACTER VARYING,
    curr_address    NATIONAL CHARACTER VARYING,
    orig_address    NATIONAL CHARACTER VARYING,
    nid    			NATIONAL CHARACTER VARYING,
    phone  			NATIONAL CHARACTER VARYING,
    image  			NATIONAL CHARACTER VARYING, 
	emp_fk_id		SERIAL,
	CONSTRAINT gu_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_contructs(
	contract_id				SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
    contract_start_date   	DATE,
    contract_end_date     	DATE,
	position_title_fk		SERIAL,
	employee_type			NATIONAL CHARACTER VARYING,
    contract_attachment    	NATIONAL CHARACTER VARYING,
	emp_salary				FLOAT,
	contract_status			NATIONAL CHARACTER VARYING,
	CONSTRAINT pos_title_employe FOREIGN KEY(position_title_fk) 
	REFERENCES position_titles (position_title_id)    
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT rec_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
	/*Compsit primary key*/
);

CREATE TABLE rewards(
	/*Makafat*/
	reward_id			SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
	achivements			NATIONAL CHARACTER VARYING,	
    achivement_date		DATE,
    achivement_details   NATIONAL CHARACTER VARYING,
	CONSTRAINT rew_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE punishments(
    /* Majazat*/
	punishment_id		SERIAL PRIMARY KEY,
	emp_fk_id			SERIAL,
    punishment_name     NATIONAL CHARACTER VARYING,
    punishment_date      DATE,
    punishment_detailes  NATIONAL CHARACTER VARYING,
	CONSTRAINT emp_majazat FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_steps(
    /* Qadam*/
	step_id		SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
    step_title          NATIONAL CHARACTER VARYING,
    step_date      DATE,
    step_detailes  NATIONAL CHARACTER VARYING,
	CONSTRAINT emp_step FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_ranks(
    /* Qadam*/
	rank_id			SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
    rank_title          NATIONAL CHARACTER VARYING,
    rank_date      DATE,
    rank_detailes  NATIONAL CHARACTER VARYING,
	CONSTRAINT emp_rank FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emp_educations(
    /* Qadam*/
	edu_id			    SERIAL PRIMARY KEY,
	emp_fk_id			SERIAL,
	center_name   		NATIONAL CHARACTER VARYING,
    edu_level           NATIONAL CHARACTER VARYING,
	edu_shift		    NATIONAL CHARACTER VARYING,
	center_address   	NATIONAL CHARACTER VARYING,
    start_date      	DATE,
    end_date      	    DATE,
	CONSTRAINT emp_edu FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sawanih(
	sawanih_id		SERIAL PRIMARY KEY,
	swanih_title		NATIONAL CHARACTER VARYING,
	description		NATIONAL CHARACTER VARYING,	
	sawanih_date		DATE,
	emp_fk_id			SERIAL,
	CONSTRAINT sawanih_emp FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE evaluations(
	evaluation_id		SERIAL PRIMARY KEY,
	evaluation_date		DATE,
	emp_fk_id			SERIAL,
	self_mark			FLOAT,
	supervoisor_mark	FLOAT,
	supervisor_remark	NATIONAL CHARACTER VARYING,
	boss_mark			FLOAT,
	boss_remark			NATIONAL CHARACTER VARYING,
	evaluation_result	NATIONAL CHARACTER VARYING,
	CONSTRAINT evalu_emp FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);



