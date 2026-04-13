-- Gender values
SELECT DATABASE();

SELECT gender_text, COUNT(*)
FROM legacy_patients
GROUP BY gender_text;

-- Names with commas
SELECT full_name
FROM legacy_patients
WHERE full_name LIKE '%,%';

-- ..or names with spaces
SELECT full_name
FROM legacy_patients
WHERE full_name NOT LIKE '%,%'
    AND full_name LIKE '% %';

-- Full names with single words
SELECT full_name
FROM legacy_patients
WHERE full_name NOT LIKE '%,%'
    AND full_name NOT LIKE '% %';

-- Identify date styles in DOB
SELECT
    CASE
        WHEN dob_text LIKE '__/__/____' THEN 'MM/DD/YYYY'
        WHEN dob_text LIKE '____-__-__' THEN 'YYYY-MM-DD'
        WHEN dob_text LIKE '__-__-____' THEN 'MM-DD-YYYY'
        WHEN dob_text LIKE '____/__/__' THEN 'YYYY/MM/DD'
        ELSE 'Other'
    END AS dob_format,
    COUNT(*) AS count
FROM legacy_patients
GROUP BY dob_format;

-- Identify providers
SELECT provider_name, COUNT(*)
FROM legacy_appointments
GROUP BY provider_name;

SELECT * FROM patients;

SELECT * FROM providers;