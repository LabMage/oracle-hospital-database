/*
    Oracle Hospital Database
    File: 02_insert_data.sql
    Purpose: Populate the database with synthetic demonstration records.

    Run this script after 01_create_tables.sql.
*/

-- =====================================================
-- HOSPITAL
-- =====================================================

INSERT INTO HOSPITAL (HIN, HospName, Address)
VALUES (1, 'Sacred Heart', '5151 N 9th Ave, Pensacola, FL');

INSERT INTO HOSPITAL (HIN, HospName, Address)
VALUES (2, 'Baptist', '123 Baptist Way, Pensacola, FL');

INSERT INTO HOSPITAL (HIN, HospName, Address)
VALUES (3, 'West Florida', '8383 N Davis Hwy, Pensacola, FL');

INSERT INTO HOSPITAL (HIN, HospName, Address)
VALUES (4, 'Select Specialty', '7000 Cobble Creek Dr, Pensacola, FL');

INSERT INTO HOSPITAL (HIN, HospName, Address)
VALUES (5, 'Naval Hospital', '6000 US-98, Pensacola, FL');


-- =====================================================
-- HOSPITAL_TYPE
-- Demonstrates overlapping hospital classifications.
-- =====================================================

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (1, 'Teaching');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (1, 'Community');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (1, 'Free');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (2, 'Teaching');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (2, 'Community');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (2, 'Free');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (3, 'Teaching');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (3, 'Community');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (3, 'Free');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (4, 'Community');

INSERT INTO HOSPITAL_TYPE (HIN, Hospital_Type)
VALUES (5, 'Free');


-- =====================================================
-- HOSPITAL SPECIALIZATIONS
-- =====================================================

-- Teaching hospitals
INSERT INTO TEACHING (HIN, Accreditation)
VALUES (1, 'CCNE');

INSERT INTO TEACHING (HIN, Accreditation)
VALUES (2, 'ABS');

INSERT INTO TEACHING (HIN, Accreditation)
VALUES (3, 'ACCME');


-- Community hospitals
INSERT INTO COMMUNITY (HIN, County)
VALUES (1, 'Escambia');

INSERT INTO COMMUNITY (HIN, County)
VALUES (2, 'Escambia');

INSERT INTO COMMUNITY (HIN, County)
VALUES (3, 'Okaloosa');

INSERT INTO COMMUNITY (HIN, County)
VALUES (4, 'Santa Rosa');


-- Free hospitals
INSERT INTO FREE (HIN, Sponsor)
VALUES (1, 'Helping Hands');

INSERT INTO FREE (HIN, Sponsor)
VALUES (2, 'People First');

INSERT INTO FREE (HIN, Sponsor)
VALUES (3, 'Florida Care');

INSERT INTO FREE (HIN, Sponsor)
VALUES (5, 'Navy');
-- =====================================================
-- DOCTOR
-- General practitioners use Distinct_Expertise.
-- Specialists use Specialty.
-- =====================================================

INSERT INTO DOCTOR (
    DocSSN,
    HIN,
    DocName,
    DocType,
    Employee_ID,
    Distinct_Expertise,
    Specialty
)
VALUES (
    555555555,
    1,
    'Lindsey Childs',
    'Specialist',
    201,
    NULL,
    'Cardiology'
);

INSERT INTO DOCTOR (
    DocSSN,
    HIN,
    DocName,
    DocType,
    Employee_ID,
    Distinct_Expertise,
    Specialty
)
VALUES (
    666666666,
    2,
    'Anthony Gladdney',
    'Gen_Pract',
    202,
    'Family Medicine',
    NULL
);

INSERT INTO DOCTOR (
    DocSSN,
    HIN,
    DocName,
    DocType,
    Employee_ID,
    Distinct_Expertise,
    Specialty
)
VALUES (
    777777777,
    3,
    'Elena Boiko',
    'Specialist',
    203,
    NULL,
    'Neurology'
);

INSERT INTO DOCTOR (
    DocSSN,
    HIN,
    DocName,
    DocType,
    Employee_ID,
    Distinct_Expertise,
    Specialty
)
VALUES (
    888888888,
    4,
    'Karissa Belzer',
    'Gen_Pract',
    204,
    'Internal Medicine',
    NULL
);

INSERT INTO DOCTOR (
    DocSSN,
    HIN,
    DocName,
    DocType,
    Employee_ID,
    Distinct_Expertise,
    Specialty
)
VALUES (
    999999999,
    5,
    'Doc Stuffins',
    'Specialist',
    205,
    NULL,
    'Surgery'
);


-- =====================================================
-- PAYMENT
-- TO_DATE provides an explicit Oracle date format.
-- =====================================================

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (100, 25.31, TO_DATE('2024-07-23', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (101, 206.54, TO_DATE('2021-08-08', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (102, 650.00, TO_DATE('2022-02-16', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (103, 196.12, TO_DATE('2023-03-26', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (104, 15.32, TO_DATE('2021-05-26', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (105, 350.00, TO_DATE('2024-01-06', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (106, 550.00, TO_DATE('2024-01-07', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (107, 600.00, TO_DATE('2024-01-08', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (108, 800.06, TO_DATE('2024-02-23', 'YYYY-MM-DD'));

INSERT INTO PAYMENT (PaymentID, Amount, PayDate)
VALUES (109, 1250.10, TO_DATE('2024-03-12', 'YYYY-MM-DD'));
-- =====================================================
-- PATIENT
-- Patient payment IDs use the even-numbered payment records.
-- =====================================================

INSERT INTO PATIENT (PSSN, PaymentID, PName, Accession, DocSSN)
VALUES (111111111, 100, 'Joe Daniels', 2001, 555555555);

INSERT INTO PATIENT (PSSN, PaymentID, PName, Accession, DocSSN)
VALUES (222222222, 102, 'Samuel Smith', 2002, 666666666);

INSERT INTO PATIENT (PSSN, PaymentID, PName, Accession, DocSSN)
VALUES (333333333, 104, 'Zion Rogers', 2003, 777777777);

INSERT INTO PATIENT (PSSN, PaymentID, PName, Accession, DocSSN)
VALUES (444444444, 106, 'Lorenzo Derby', 2004, 888888888);

INSERT INTO PATIENT (PSSN, PaymentID, PName, Accession, DocSSN)
VALUES (123456789, 108, 'Sarah Jackson', 2005, 999999999);


-- =====================================================
-- INSURANCE
-- Insurance payment IDs use the odd-numbered payment records.
-- =====================================================

INSERT INTO INSURANCE (Code, PaymentID, InsName)
VALUES (1001, 101, 'Root');

INSERT INTO INSURANCE (Code, PaymentID, InsName)
VALUES (1002, 103, 'Geico');

INSERT INTO INSURANCE (Code, PaymentID, InsName)
VALUES (1003, 105, 'Progressive');

INSERT INTO INSURANCE (Code, PaymentID, InsName)
VALUES (1004, 109, 'USAA');

INSERT INTO INSURANCE (Code, PaymentID, InsName)
VALUES (1005, 107, 'Farmers');


-- =====================================================
-- VISIT
-- Connects patients to hospitals.
-- =====================================================

INSERT INTO VISIT (PSSN, HIN, PH_Number)
VALUES (111111111, 1, 111100);

INSERT INTO VISIT (PSSN, HIN, PH_Number)
VALUES (222222222, 2, 222101);

INSERT INTO VISIT (PSSN, HIN, PH_Number)
VALUES (333333333, 3, 333102);

INSERT INTO VISIT (PSSN, HIN, PH_Number)
VALUES (444444444, 4, 444103);

INSERT INTO VISIT (PSSN, HIN, PH_Number)
VALUES (123456789, 5, 101104);


-- Save all inserted records.
COMMIT;