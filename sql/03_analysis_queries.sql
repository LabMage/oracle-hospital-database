/*
    Oracle Hospital Database
    File: 03_analysis_queries.sql
    Purpose: Answer healthcare-related reporting questions.

    Run 01_create_tables.sql and 02_insert_data.sql before this file.
*/


-- =====================================================
-- QUERY 1
-- List patients, their assigned physicians, and the
-- hospitals where the patients were treated.
-- =====================================================

SELECT
    P.PName,
    D.DocName,
    H.HospName
FROM PATIENT P
JOIN DOCTOR D
    ON P.DocSSN = D.DocSSN
JOIN VISIT V
    ON P.PSSN = V.PSSN
JOIN HOSPITAL H
    ON V.HIN = H.HIN
ORDER BY P.PName;


-- =====================================================
-- QUERY 2
-- List physicians, their practice areas, hospitals,
-- and assigned patients.
-- =====================================================

SELECT
    D.DocName,
    H.HospName,
    D.DocType,
    COALESCE(D.Specialty, D.Distinct_Expertise) AS Practice_Area,
    P.PName
FROM DOCTOR D
JOIN HOSPITAL H
    ON D.HIN = H.HIN
JOIN PATIENT P
    ON D.DocSSN = P.DocSSN
ORDER BY D.DocName;


-- =====================================================
-- QUERY 3
-- Count the patients assigned to each physician at
-- the physician's hospital.
-- =====================================================

SELECT
    D.DocName,
    H.HospName,
    COUNT(P.PSSN) AS Patient_Count
FROM DOCTOR D
JOIN HOSPITAL H
    ON D.HIN = H.HIN
LEFT JOIN PATIENT P
    ON D.DocSSN = P.DocSSN
GROUP BY
    D.DocName,
    H.HospName
ORDER BY
    Patient_Count DESC,
    D.DocName;


-- =====================================================
-- QUERY 4
-- List patients, treatment hospitals, and associated
-- payment dates.
-- =====================================================

SELECT
    P.PName,
    H.HospName,
    PAY.PayDate
FROM PATIENT P
JOIN VISIT V
    ON P.PSSN = V.PSSN
JOIN HOSPITAL H
    ON V.HIN = H.HIN
JOIN PAYMENT PAY
    ON P.PaymentID = PAY.PaymentID
ORDER BY PAY.PayDate;


-- =====================================================
-- QUERY 5
-- Calculate the total payment amount associated with
-- patients treated by each physician.
-- =====================================================

SELECT
    D.DocName,
    SUM(PAY.Amount) AS Total_Payment_Amount
FROM DOCTOR D
JOIN PATIENT P
    ON D.DocSSN = P.DocSSN
JOIN PAYMENT PAY
    ON P.PaymentID = PAY.PaymentID
GROUP BY D.DocName
ORDER BY Total_Payment_Amount DESC;


-- =====================================================
-- QUERY 6
-- List hospitals, their classifications, and the
-- physicians who work at each hospital.
-- =====================================================

SELECT
    H.HospName,
    HT.Hospital_Type,
    D.DocName
FROM HOSPITAL H
JOIN HOSPITAL_TYPE HT
    ON H.HIN = HT.HIN
LEFT JOIN DOCTOR D
    ON H.HIN = D.HIN
ORDER BY
    H.HospName,
    HT.Hospital_Type,
    D.DocName;


-- =====================================================
-- QUERY 7
-- Display teaching, community, and free-hospital
-- attributes without excluding hospitals that do not
-- belong to every specialization.
-- =====================================================

SELECT
    H.HospName,
    T.Accreditation AS Teaching_Accreditation,
    C.County AS Community_County,
    F.Sponsor AS Free_Hospital_Sponsor
FROM HOSPITAL H
LEFT JOIN TEACHING T
    ON H.HIN = T.HIN
LEFT JOIN COMMUNITY C
    ON H.HIN = C.HIN
LEFT JOIN FREE F
    ON H.HIN = F.HIN
ORDER BY H.HospName;
