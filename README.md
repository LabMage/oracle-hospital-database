# Oracle Hospital Database

## Project Overview

This project demonstrates the design and implementation of a relational hospital database in Oracle SQL. The database integrates information about hospitals, physicians, patients, visits, insurance providers, and payments.

The project began with an enhanced entity-relationship model containing binary relationships, overlapping and disjoint specializations, participation constraints, and a union category. The conceptual model was translated into a relational schema consisting of 10 interconnected tables with primary, composite, and foreign keys.

The database was populated with synthetic records and used to answer healthcare-related reporting questions through multi-table joins, outer joins, aggregations, and grouped calculations.

## Project Objectives

- Translate an enhanced ER model into a relational database.
- Model relationships among hospitals, physicians, patients, visits, insurance providers, and payments.
- Apply primary, composite, and foreign-key constraints.
- Represent overlapping hospital classifications and physician specializations.
- Populate the database with synthetic healthcare records.
- Develop SQL queries for healthcare reporting and analysis.

## Technologies and Concepts

- Oracle SQL
- Relational database design
- Enhanced entity-relationship modeling
- ER-to-relational mapping
- Primary and foreign keys
- Composite keys
- Referential integrity
- Inner and outer joins
- Aggregate functions
- `GROUP BY`

## Database Design

[View the complete entity-relationship diagram](diagrams/hospital_database_erd.md)

The database was developed from an enhanced entity-relationship model representing the operational relationships among hospitals, physicians, patients, visits, insurance providers, and payments.

The design includes the following primary entities:

- **HOSPITAL** — stores the hospital identifier, name, and address.
- **DOCTOR** — stores physician information and associates each physician with one hospital.
- **PATIENT** — stores patient information and associates each patient with an assigned physician.
- **INSURANCE** — stores insurance-provider information.
- **PAYMENT** — stores payment amounts and dates.
- **VISIT** — resolves the many-to-many relationship between patients and hospitals.

The model also includes two specialization structures:

- **Hospital specialization:** A hospital may be classified as `TEACHING`, `COMMUNITY`, `FREE`, or a combination of these categories. This is modeled as an overlapping specialization.
- **Physician specialization:** A physician is classified as either a general practitioner or a specialist. This is modeled as a disjoint specialization using `DocType` as the discriminator.

Because hospital classifications can overlap, hospital type was also modeled as a multivalued attribute and mapped to the separate `HOSPITAL_TYPE` table.

## Relational Schema

The enhanced ER model was mapped to 10 relational tables:

| Table | Primary Key | Foreign Keys | Purpose |
|---|---|---|---|
| `HOSPITAL` | `HIN` | — | Stores hospital names and addresses. |
| `HOSPITAL_TYPE` | `HIN`, `Hospital_Type` | `HIN` → `HOSPITAL` | Stores one or more classifications for each hospital. |
| `TEACHING` | `HIN` | `HIN` → `HOSPITAL` | Stores accreditation information for teaching hospitals. |
| `COMMUNITY` | `HIN` | `HIN` → `HOSPITAL` | Stores county information for community hospitals. |
| `FREE` | `HIN` | `HIN` → `HOSPITAL` | Stores sponsor information for free hospitals. |
| `DOCTOR` | `DocSSN` | `HIN` → `HOSPITAL` | Stores physician information, employment, and specialization attributes. |
| `PATIENT` | `PSSN` | `DocSSN` → `DOCTOR`; `PaymentID` → `PAYMENT` | Stores patient information and physician and payment associations. |
| `INSURANCE` | `Code` | `PaymentID` → `PAYMENT` | Stores insurance-provider and payment associations. |
| `PAYMENT` | `PaymentID` | — | Stores payment amounts and dates. |
| `VISIT` | `PSSN`, `HIN` | `PSSN` → `PATIENT`; `HIN` → `HOSPITAL` | Connects patients with the hospitals they visited. |

### Key Mapping Decisions

- The one-to-many relationship between hospitals and physicians was implemented by placing `HIN` as a foreign key in `DOCTOR`.
- The many-to-many relationship between patients and hospitals was resolved through the associative `VISIT` table.
- The overlapping hospital specialization was represented with the `TEACHING`, `COMMUNITY`, and `FREE` subtype tables.
- The disjoint physician specialization was mapped to a single `DOCTOR` table using `DocType` as the discriminator and nullable subtype-specific attributes.
- `PaymentID` was introduced as a surrogate key for payment records.

## Reporting Questions

The SQL queries were developed to answer the following reporting questions:

1. Which physician was assigned to each patient, and at which hospital was the patient treated?
2. Which patients were assigned to each physician, and what were the physicians' specialties or areas of expertise?
3. How many patients were assigned to each physician at their respective hospital?
4. What hospital visit and payment-date information was associated with each patient?
5. What was the total payment amount associated with patients treated by each physician?
6. Which physicians worked at hospitals classified as teaching, community, or free?
7. Which teaching accreditation, community location, and free-hospital sponsor were associated with each hospital?

## Key SQL Techniques

The project applies several SQL techniques for relational data retrieval and reporting:

- **Multi-table joins:** Combined hospital, physician, patient, visit, payment, and insurance data across three or more related tables.
- **Inner joins:** Returned records with matching relationships, such as patients with assigned physicians and recorded hospital visits.
- **Left joins:** Preserved all hospitals in classification reports, including hospitals without matching records in every specialization table.
- **Aggregate functions:** Used `COUNT()` to calculate patient totals and `SUM()` to calculate payment amounts associated with physicians' patients.
- **Grouping:** Applied `GROUP BY` to summarize results by physician and hospital.
- **Table aliases:** Used aliases such as `H`, `D`, `P`, and `PAY` to make multi-table queries more readable.
- **Oracle date conversion:** Used `TO_DATE()` with an explicit date format when inserting payment dates.
- **Referential integrity:** Defined foreign-key constraints to maintain valid relationships among hospitals, physicians, patients, visits, payments, and insurance providers.
- **Composite keys:** Used multi-column primary keys in `HOSPITAL_TYPE` and `VISIT` to identify unique classifications and patient-hospital relationships.

## Project Results

The completed Oracle database:

- Implemented 10 interconnected relational tables.
- Preserved hospital, physician, patient, visit, payment, and insurance relationships through primary and foreign keys.
- Represented overlapping hospital classifications without excluding hospitals that belonged to multiple categories.
- Populated the schema with synthetic records for testing and demonstration.
- Successfully executed seven reporting queries across multiple related tables.
- Produced physician-level patient counts and payment summaries.
- Connected patients with their assigned physicians and treatment hospitals.
- Reported teaching accreditations, community locations, and free-hospital sponsors while retaining hospitals with incomplete classification information.

The project demonstrated the complete database-development process, from conceptual modeling and relational mapping through implementation, validation, and SQL reporting.

## Limitations and Future Improvements

This database was developed as an academic implementation using a small synthetic dataset. A production healthcare database would require additional security, validation, and normalization considerations.

Potential improvements include:

- Replace SSN-style identifiers with non-sensitive surrogate identifiers.
- Add `NOT NULL`, `UNIQUE`, and `CHECK` constraints for required fields and valid category values.
- Add a dedicated treatment or encounter table to support multiple physicians per patient and preserve treatment history.
- Redesign the payment model to identify the responsible payer explicitly and enforce whether a payment was made by a patient or an insurance provider.
- Reduce possible duplication between `HOSPITAL_TYPE` and the hospital specialization tables.
- Add indexes to frequently joined foreign-key columns.
- Include encounter dates, diagnoses, procedures, and payment-status fields.
- Add audit columns such as creation and modification timestamps.
- Test the design with a larger and more varied synthetic dataset.

These enhancements would improve data integrity, scalability, security, and support for more realistic healthcare reporting.

## Repository Structure

```text
oracle-hospital-database/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_analysis_queries.sql
├── diagrams/
│   └── hospital_database_erd.png
└── docs/
    └── data_dictionary.md
```

- `README.md` — provides the project overview, database design, results, and limitations.
- `01_create_tables.sql` — creates the tables and defines primary- and foreign-key constraints.
- `02_insert_data.sql` — populates the database with synthetic records.
- `03_analysis_queries.sql` — contains the reporting queries and their explanations.
- `hospital_database_erd.md` — presents the database entities, attributes, keys, and relationships in a Mermaid diagram.
- `data_dictionary.md` — documents the tables, columns, keys, and field definitions.

## Project Background and My Contribution

The conceptual phase originated as a four-person academic assignment. I proposed the hospital database domain, developed the initial data model, and completed most of the entity specifications and relational mapping.

With the instructor's approval, I independently completed the final Oracle SQL implementation, including table creation, data population, validation, troubleshooting, and reporting queries.