-- Split full name into first and last names.

INSERT INTO patients (
    first_name,
    last_name
)
SELECT
    CASE
        WHEN full_name LIKE '%,%' THEN TRIM (SUBSTRING_INDEX(full_name, ',', -1))
        ELSE TRIM(SUBSTRING_INDEX(full_name, ' ', 1))
    END AS first_name,

    CASE
        WHEN full_name LIKE '%,%' THEN TRIM (SUBSTRING_INDEX(full_name, ',', 1))
        ELSE TRIM(SUBSTRING_INDEX(full_name, ' ', -1))
    END AS last_name
FROM legacy_patients;

SELECT * FROM patients;

-- Extract providers

INSERT INTO providers (provider_name)
SELECT DISTINCT provider_name
FROM legacy_appointments;

SELECT * FROM providers;