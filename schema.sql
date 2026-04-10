
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS providers;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS legacy_appointments;
DROP TABLE IF EXISTS legacy_patients;

-- Legacy tables / Messy data

CREATE TABLE legacy_patients (
    legacy_patient_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    dob_text VARCHAR(20),
    phone_raw VARCHAR(20),
    gender_text VARCHAR(20),
    primary_insurance VARCHAR(100),
    address_line VARCHAR(255)
);

CREATE TABLE legacy_appointments (
    legacy_appt_id INT PRIMARY KEY,
    legacy_patient_id INT,
    appt_date_text VARCHAR(20),
    provider_name VARCHAR(100),
    visit_type_text VARCHAR(50),
    status_text VARCHAR(50)
);

-- Target Schema / Clean data 

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    phone VARCHAR(20),
    gender VARCHAR(10),
    insurance_name VARCHAR(100),
    address_line VARCHAR(255)
);

CREATE TABLE providers (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    provider_name VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    provider_id INT,
    appointment_date DATE,
    visit_type VARCHAR(50),
    status VARCHAR(50),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);