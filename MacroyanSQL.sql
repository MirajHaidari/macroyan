CREATE DATABASE MacroyanMIS;

CREATE TABLE organizations (
	org_id		SERIAL PRIMARY KEY,
	organization_name 	NATIONAL CHARACTER VARYING,
    organization_description NATIONAL CHARACTER VARYING,
    organization_location     NATIONAL CHARACTER VARYING,
	organization_logo	BYTEA
);

CREATE TABLE  departments(
	dep_id	SERIAL PRIMARY KEY,
    department_name  NATIONAL CHARACTER VARYING,
    department_description    NATIONAL CHARACTER VARYING
);

CREATE TABLE positions(
	pos_id		SERIAL PRIMARY KEY,
	department_fk_id 	SERIAL,
	position_name 	NATIONAL CHARACTER VARYING,
    position_desc    NATIONAL CHARACTER VARYING,
	CONSTRAINT pos_department FOREIGN KEY(department_fk_id) REFERENCES departments (dep_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE position_titles(
    position_title_id		SERIAL PRIMARY KEY,
    position_title_name   NATIONAL CHARACTER VARYING,
    position_title_desc   NATIONAL CHARACTER VARYING,
	number_of_position	INT,
	position_fk_id		SERIAL,
	CONSTRAINT title_pos FOREIGN KEY(position_fk_id) REFERENCES positions (pos_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE job_respons(
	resp_id		SERIAL PRIMARY KEY,
	resp_desc	NATIONAL CHARACTER VARYING,
	pos_title_fk_id	SERIAL,
	CONSTRAINT resp_posit_title FOREIGN KEY(pos_title_fk_id) 
	REFERENCES position_titles (position_title_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE employees(
	emp_id		SERIAL PRIMARY KEY,
	first_name		NATIONAL CHARACTER VARYING,
	last_name		NATIONAL CHARACTER VARYING,
	father_name 		NATIONAL CHARACTER VARYING,
    cur_province     NATIONAL CHARACTER VARYING,
    cur_destric      NATIONAL CHARACTER VARYING,
    cur_village      NATIONAL CHARACTER VARYING,
    permanent_address NATIONAL CHARACTER VARYING,
    education_lavel 	NATIONAL CHARACTER VARYING,
    join_date 		DATE,
    dob 			DATE,
    nid_number   	INT,
    nid_page_number 	INT,
    nid_reg_number    INT,
    work_period  	NATIONAL CHARACTER VARYING,
    personal_asset   NATIONAL CHARACTER VARYING,
    family_asset     NATIONAL CHARACTER VARYING,
    father_job       NATIONAL CHARACTER VARYING,
    trips       	NATIONAL CHARACTER VARYING,
    emp_image    	BYTEA,
    relative_name    NATIONAL CHARACTER VARYING,
    relative_father_name   NATIONAL CHARACTER VARYING,
    relative_G_F_Name  	 NATIONAL CHARACTER VARYING,
    relative_cur_address   NATIONAL CHARACTER VARYING,
    relative_per_address   NATIONAL CHARACTER VARYING,
    relative_job_title     NATIONAL CHARACTER VARYING,
    relative_job_address   NATIONAL CHARACTER VARYING,
	employee_type		 NATIONAL CHARACTER VARYING,

    /** form sawanih Qalami */
    grand_father 		 NATIONAL CHARACTER VARYING,
    nationality 		 NATIONAL CHARACTER VARYING,
    military_services     NATIONAL CHARACTER VARYING,
    education_address     NATIONAL CHARACTER VARYING,
    gratuation_date      DATE,
    otherLanguage_fk     INT,
    language_status      NATIONAL CHARACTER VARYING,
    marital_status       NATIONAL CHARACTER VARYING,
    /* Zawj or zawja Information*/
    pair_first_name       NATIONAL CHARACTER VARYING,
    pair_last_name        NATIONAL CHARACTER VARYING,
    pair_nid_number       NATIONAL CHARACTER VARYING,
    pair_job             NATIONAL CHARACTER VARYING,
    pair_job_address      NATIONAL CHARACTER VARYING,
    /* Sawanih Mamorin*/
    promotion           NATIONAL CHARACTER VARYING,
    promotion_date       DATE,
    promotion_achivement NATIONAL CHARACTER VARYING,
    panishment_date      NATIONAL CHARACTER VARYING,
    panishment_detailes  NATIONAL CHARACTER VARYING,
    publish             NATIONAL CHARACTER VARYING,
    before_jobs          NATIONAL CHARACTER VARYING,
    health_reports       NATIONAL CHARACTER VARYING,
	attachment    		BYTEA
	
);

CREATE TABLE language_skills(
	lang_id			SERIAL PRIMARY KEY,
	language_name 		NATIONAL CHARACTER VARYING,
    last_name   	NATIONAL CHARACTER VARYING,
    father_name 	NATIONAL CHARACTER VARYING,
    job_description NATIONAL CHARACTER VARYING,
    curr_address    NATIONAL CHARACTER VARYING,
)

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
    image  			BYTEA, 
	emp_fk_id		SERIAL,
	CONSTRAINT gu_employee FOREIGN KEY (emp_fk_id) REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE recruitments(
	rec_id		SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
    recuitment_date      DATE,
	position_fk_id		SERIAL,
	position_title_fk		SERIAL,
    recuitment_remark    NATIONAL CHARACTER VARYING,
    recuitment_attachment    BYTEA,
	CONSTRAINT pos_employe FOREIGN KEY(position_fk_id) 
	REFERENCES positions (pos_id)    
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

CREATE TABLE majazats(
    /* Majazat*/
	panishment_id		SERIAL PRIMARY KEY,
	emp_fk_id				SERIAL,
    panishment          NATIONAL CHARACTER VARYING,
    panishment_date      DATE,
    panishment_detailes  NATIONAL CHARACTER VARYING,
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
	rank_id		SERIAL PRIMARY KEY,
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
	emp_fk_id				SERIAL,
    edu_level            NATIONAL CHARACTER VARYING,
    edu_date      	    DATE,
    edu_detailes  NATIONAL CHARACTER VARYING,
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
	emp_fk_id				SERIAL,
	self_mark			FLOAT,
	supervoisor_mark		FLOAT,
	supervisor_remark	NATIONAL CHARACTER VARYING,
	boss_mark			FLOAT,
	boss_remark			NATIONAL CHARACTER VARYING,
	evaluation_result	NATIONAL CHARACTER VARYING,
	CONSTRAINT evalu_emp FOREIGN KEY(emp_fk_id) 
	REFERENCES employees (emp_id)    
	ON DELETE CASCADE ON UPDATE CASCADE
);


