/*
    Oracle Hospital Database
    File: 01_create_tables.sql
    Purpose: Create the relational database schema.
*/

-- Stores general hospital information.
CREATE TABLE HOSPITAL (
    HIN       NUMBER PRIMARY KEY,
    HospName  VARCHAR2(100),
    Address   VARCHAR2(255)
);

-- Stores the multivalued hospital classifications.
CREATE TABLE HOSPITAL_TYPE (
    HIN            NUMBER,
    Hospital_Type  VARCHAR2(50),
    PRIMARY KEY (HIN, Hospital_Type),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);

-- Stores attributes specific to teaching hospitals.
CREATE TABLE TEACHING (
    HIN            NUMBER PRIMARY KEY,
    Accreditation  VARCHAR2(100),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);

-- Stores attributes specific to community hospitals.
CREATE TABLE COMMUNITY (
    HIN     NUMBER PRIMARY KEY,
    County  VARCHAR2(100),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);

-- Stores attributes specific to free hospitals.
CREATE TABLE FREE (
    HIN      NUMBER PRIMARY KEY,
    Sponsor  VARCHAR2(100),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);

-- Stores physicians and associates each physician with one hospital.
CREATE TABLE DOCTOR (
    DocSSN               NUMBER PRIMARY KEY,
    HIN                  NUMBER,
    DocName              VARCHAR2(100),
    DocType              VARCHAR2(50),
    Employee_ID          NUMBER,
    Distinct_Expertise   VARCHAR2(100),
    Specialty            VARCHAR2(100),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);

-- Stores payment amounts and dates.
CREATE TABLE PAYMENT (
    PaymentID  NUMBER PRIMARY KEY,
    Amount     NUMBER(10, 2),
    PayDate    DATE
);

-- Stores patients and their physician and payment associations.
CREATE TABLE PATIENT (
    PSSN       NUMBER PRIMARY KEY,
    PaymentID  NUMBER,
    PName      VARCHAR2(100),
    Accession  NUMBER,
    DocSSN     NUMBER,
    FOREIGN KEY (DocSSN) REFERENCES DOCTOR(DocSSN),
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

-- Stores insurance providers and their payment associations.
CREATE TABLE INSURANCE (
    Code       NUMBER PRIMARY KEY,
    PaymentID  NUMBER,
    InsName    VARCHAR2(100),
    FOREIGN KEY (PaymentID) REFERENCES PAYMENT(PaymentID)
);

-- Resolves the many-to-many relationship between patients and hospitals.
CREATE TABLE VISIT (
    PSSN       NUMBER,
    HIN        NUMBER,
    PH_Number  NUMBER,
    PRIMARY KEY (PSSN, HIN),
    FOREIGN KEY (PSSN) REFERENCES PATIENT(PSSN),
    FOREIGN KEY (HIN) REFERENCES HOSPITAL(HIN)
);