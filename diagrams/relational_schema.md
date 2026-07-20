# Hospital Database Entity-Relationship Diagram

```mermaid
erDiagram
    HOSPITAL ||--o{ HOSPITAL_TYPE : "classified as"
    HOSPITAL ||--o| TEACHING : "may be"
    HOSPITAL ||--o| COMMUNITY : "may be"
    HOSPITAL ||--o| FREE : "may be"
    HOSPITAL ||--o{ DOCTOR : employs
    DOCTOR ||--o{ PATIENT : treats
    PATIENT ||--o{ VISIT : makes
    HOSPITAL ||--o{ VISIT : receives
    PAYMENT ||--o{ PATIENT : "associated with"
    PAYMENT ||--o{ INSURANCE : "associated with"

    HOSPITAL {
        NUMBER HIN PK
        VARCHAR2 HospName
        VARCHAR2 Address
    }

    HOSPITAL_TYPE {
        NUMBER HIN PK, FK
        VARCHAR2 Hospital_Type PK
    }

    TEACHING {
        NUMBER HIN PK, FK
        VARCHAR2 Accreditation
    }

    COMMUNITY {
        NUMBER HIN PK, FK
        VARCHAR2 County
    }

    FREE {
        NUMBER HIN PK, FK
        VARCHAR2 Sponsor
    }

    DOCTOR {
        NUMBER DocSSN PK
        NUMBER HIN FK
        VARCHAR2 DocName
        VARCHAR2 DocType
        NUMBER Employee_ID
        VARCHAR2 Distinct_Expertise
        VARCHAR2 Specialty
    }

    PATIENT {
        NUMBER PSSN PK
        NUMBER PaymentID FK
        VARCHAR2 PName
        NUMBER Accession
        NUMBER DocSSN FK
    }

    INSURANCE {
        NUMBER Code PK
        NUMBER PaymentID FK
        VARCHAR2 InsName
    }

    PAYMENT {
        NUMBER PaymentID PK
        NUMBER Amount
        DATE PayDate
    }

    VISIT {
        NUMBER PSSN PK, FK
        NUMBER HIN PK, FK
        NUMBER PH_Number
    }
```

## Design Notes

- `VISIT` resolves the many-to-many relationship between patients and hospitals.
- `HOSPITAL_TYPE` stores the multivalued hospital classification.
- `TEACHING`, `COMMUNITY`, and `FREE` represent overlapping hospital specializations.
- `DocType` distinguishes general practitioners from specialists within the `DOCTOR` table.
- `PaymentID` is a surrogate key used to associate payment records with patients or insurance providers.