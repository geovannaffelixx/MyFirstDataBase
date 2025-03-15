CREATE TABLE "users" (
	id int IDENTITY(1,1) NOT NULL,
	email varchar(50) NOT NULL,
	password varchar(15) NOT NULL,
	user_type int NOT NULL,
	PRIMARY KEY(id),
);

CREATE TABLE "speciality" (
	id int IDENTITY NOT NULL,
	name varchar(25) NOT NULL,
	PRIMARY KEY(id),
);

CREATE TABLE "clinic" (
	id int IDENTITY(1,1) NOT NULL,
	costume_name varchar(30) NOT NULL,
	address varchar(50) NOT NULL,
	number int NOT NULL,
	cep varchar(8) NOT NULL,
	corporate_reason varchar(15) NOT NULL,
	PRIMARY KEY(id),
);

CREATE TABLE "doctor" (
	id int IDENTITY NOT NULL,
	users_id int NOT NULL,
	name varchar(25) NOT NULL,
	crm varchar(13) NOT NULL,
	clinic_id int NOT NULL,
	speciality_id int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (users_id) REFERENCES users (id),
	FOREIGN KEY (clinic_id) REFERENCES clinic (id),
	FOREIGN KEY (speciality_id) REFERENCES speciality (id),
);

CREATE TABLE "patient" (
	id int IDENTITY NOT NULL,
	users_id int NOT NULL,
	name varchar(25) NOT NULL,
	cpf varchar(11) NOT NULL,
	rg varchar(10) NOT NULL,
	phone varchar(11) NOT NULL,
	birth_date datetime NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (users_id) REFERENCES users (id),
);

CREATE TABLE "medical_consultation" (
	id int IDENTITY NOT NULL,
	doctor_id int NOT NULL,
	patient_id int NOT NULL,
	data_consultation datetime NOT NULL,
	text varchar(100),
	status int NOT NULL,
	price decimal(4,2) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (doctor_id) REFERENCES doctor (id),
	FOREIGN KEY (patient_id) REFERENCES patient (id),
);


