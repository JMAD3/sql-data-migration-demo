-- Legacy Patients
INSERT INTO legacy_patients (
    legacy_patient_id,
    full_name,
    dob_text,
    phone_raw,
    gender_text,
    primary_insurance,
    address_line
) VALUES
(1, 'Smith, John', '01/02/1990', '555-1234', 'M', 'BlueCross', '123 Main St'),
(2, 'Alice Johnson', '1992-03-15', '(555) 5678', 'Female', 'Aetna', '456 Oak Ave'),
(3, 'Bob Lee', '07-20-1985', '555.9999', 'male', NULL, '789 Pine Rd'),
(4, 'Nguyen, Tran', '1988/11/30', '5551234567', 'F', 'Cigna', '321 Maple Dr'),
(5, 'Chris', 'not_a_date', 'unknown', 'Unknown', 'Medicaid', 'No Address');

-- Legacy Appointments

INSERT INTO legacy_appointments (
    legacy_appt_id,
    legacy_patient_id,
    appt_date_text,
    provider_name,
    visit_type_text,
    status_text
) VALUES
(100, 1, '2025-01-10', 'Dr. Smith', 'Annual', 'Completed'),
(101, 2, '01/15/2025', 'Dr. Adams', 'Follow-up', 'No Show'),
(102, 3, '2025/02/01', 'Dr. Smith', 'Checkup', 'NOSHOW'),
(103, 4, 'Feb 5 2025', 'Dr. Brown', 'Emergency', 'Cancelled'),
(104, 5, 'invalid_date', 'Dr. Adams', 'Annual', 'COMPLETE'),
(105, 999, '2025-03-01', 'Dr. Who', 'Consult', 'Scheduled');