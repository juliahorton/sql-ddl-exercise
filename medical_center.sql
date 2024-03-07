DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    credentials TEXT DEFAULT 'MD',
    specialization TEXT DEFAULT 'PCP'
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    dob DATE,
    insurance BOOLEAN DEFAULT TRUE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    dr_id INTEGER REFERENCES doctors(id),
    patient_id INTEGER REFERENCES patients(id),
    date DATE
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visits(id),
    disease_id INT REFERENCES diseases(id)
);

INSERT INTO doctors (first_name, last_name, credentials, specialization) VALUES 
('Aleister','Crowley','DO','Psychiatry'),
('Demetria','Parker','MD','Rheumatology'),
('Gerald','Williams','MD','Cardiology');

INSERT INTO patients (first_name, last_name, dob, insurance) VALUES 
('Michelle','Baxter','1912-04-30',true),
('Penelope','Grey','1996-07-12',false),
('Winston','Mariam','1974-02-16',true);

INSERT INTO diseases (name, description) VALUES
('hypertension','not fun'),
('osteoarthritis','it hurts'),
('psychotic delusions','careful, there');

INSERT INTO visits (dr_id, patient_id, date) VALUES
(1,2,'2002-02-13'),
(2,1,'2002-02-13'),
(3,3,'2002-02-16');

INSERT INTO diagnoses (visit_id, disease_id) VALUES
(1,3),
(2,2),
(3,1);