# Hospital Database Data Dictionary

This data dictionary documents the 10 tables used in the Oracle Hospital Database. All records in the project are synthetic and were created for academic demonstration purposes.

## HOSPITAL

Stores general information about each hospital.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `HIN` | `NUMBER` | Primary key | Unique hospital identifier. |
| `HospName` | `VARCHAR2(100)` | — | Hospital name. |
| `Address` | `VARCHAR2(255)` | — | Hospital street address. |

## HOSPITAL_TYPE

Stores one or more classifications associated with each hospital.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `HIN` | `NUMBER` | Primary key; foreign key | Identifies the hospital and references `HOSPITAL.HIN`. |
| `Hospital_Type` | `VARCHAR2(50)` | Primary key | Hospital classification, such as Teaching, Community, or Free. |

The combination of `HIN` and `Hospital_Type` forms the composite primary key.

## TEACHING

Stores attributes specific to teaching hospitals.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `HIN` | `NUMBER` | Primary key; foreign key | Identifies the teaching hospital and references `HOSPITAL.HIN`. |
| `Accreditation` | `VARCHAR2(100)` | — | Teaching accreditation associated with the hospital. |

## COMMUNITY

Stores attributes specific to community hospitals.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `HIN` | `NUMBER` | Primary key; foreign key | Identifies the community hospital and references `HOSPITAL.HIN`. |
| `County` | `VARCHAR2(100)` | — | County served by or associated with the hospital. |

## FREE

Stores attributes specific to free hospitals.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `HIN` | `NUMBER` | Primary key; foreign key | Identifies the free hospital and references `HOSPITAL.HIN`. |
| `Sponsor` | `VARCHAR2(100)` | — | Organization sponsoring the hospital. |

## DOCTOR

Stores physician information and associates each physician with one hospital.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `DocSSN` | `NUMBER` | Primary key | Synthetic physician identifier used in the academic model. |
| `HIN` | `NUMBER` | Foreign key | References the physician's hospital through `HOSPITAL.HIN`. |
| `DocName` | `VARCHAR2(100)` | — | Physician name. |
| `DocType` | `VARCHAR2(50)` | — | Discriminator identifying the physician as a general practitioner or specialist. |
| `Employee_ID` | `NUMBER` | — | Physician's employee identifier within the hospital relationship. |
| `Distinct_Expertise` | `VARCHAR2(100)` | — | Practice area recorded for a general practitioner; otherwise `NULL`. |
| `Specialty` | `VARCHAR2(100)` | — | Specialty recorded for a specialist; otherwise `NULL`. |

## PAYMENT

Stores payment amounts and dates.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `PaymentID` | `NUMBER` | Primary key | Surrogate identifier for a payment record. |
| `Amount` | `NUMBER(10,2)` | — | Payment amount. |
| `PayDate` | `DATE` | — | Date associated with the payment. |

## PATIENT

Stores patient information and associates each patient with a physician and payment.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `PSSN` | `NUMBER` | Primary key | Synthetic patient identifier used in the academic model. |
| `PaymentID` | `NUMBER` | Foreign key | References the patient's payment through `PAYMENT.PaymentID`. |
| `PName` | `VARCHAR2(100)` | — | Patient name. |
| `Accession` | `NUMBER` | — | Synthetic accession number associated with the physician-patient relationship. |
| `DocSSN` | `NUMBER` | Foreign key | References the patient's assigned physician through `DOCTOR.DocSSN`. |

## INSURANCE

Stores insurance-provider information and payment associations.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `Code` | `NUMBER` | Primary key | Unique insurance-provider code. |
| `PaymentID` | `NUMBER` | Foreign key | References an insurance-associated payment through `PAYMENT.PaymentID`. |
| `InsName` | `VARCHAR2(100)` | — | Insurance-provider name. |

## VISIT

Associates patients with hospitals they visited.

| Column | Data Type | Key | Description |
|---|---|---|---|
| `PSSN` | `NUMBER` | Primary key; foreign key | Identifies the patient and references `PATIENT.PSSN`. |
| `HIN` | `NUMBER` | Primary key; foreign key | Identifies the hospital and references `HOSPITAL.HIN`. |
| `PH_Number` | `NUMBER` | — | Synthetic identifier associated with the patient-hospital relationship. |

The combination of `PSSN` and `HIN` forms the composite primary key.