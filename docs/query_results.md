# Validated Query Results

The refined portfolio version of this project was executed and validated using Oracle FreeSQL on July 19, 2026.

Validation confirmed that:

- All 10 tables were created successfully.
- All 57 synthetic records were inserted successfully.
- The transaction was committed without errors.
- All seven reporting queries executed successfully.
- The returned rows matched the documented results.

Dates below are displayed in `YYYY-MM-DD` format, and payment amounts are formatted as currency for readability.

## Query 1: Patients, Physicians, and Treatment Hospitals

| Patient | Physician | Hospital |
|---|---|---|
| Joe Daniels | Lindsey Childs | Sacred Heart |
| Lorenzo Derby | Karissa Belzer | Select Specialty |
| Samuel Smith | Anthony Gladdney | Baptist |
| Sarah Jackson | Doc Stuffins | Naval Hospital |
| Zion Rogers | Elena Boiko | West Florida |

## Query 2: Physicians, Practice Areas, Hospitals, and Patients

| Physician | Hospital | Physician Type | Practice Area | Patient |
|---|---|---|---|---|
| Anthony Gladdney | Baptist | Gen_Pract | Family Medicine | Samuel Smith |
| Doc Stuffins | Naval Hospital | Specialist | Surgery | Sarah Jackson |
| Elena Boiko | West Florida | Specialist | Neurology | Zion Rogers |
| Karissa Belzer | Select Specialty | Gen_Pract | Internal Medicine | Lorenzo Derby |
| Lindsey Childs | Sacred Heart | Specialist | Cardiology | Joe Daniels |

## Query 3: Patient Count by Physician

| Physician | Hospital | Patient Count |
|---|---|---:|
| Anthony Gladdney | Baptist | 1 |
| Doc Stuffins | Naval Hospital | 1 |
| Elena Boiko | West Florida | 1 |
| Karissa Belzer | Select Specialty | 1 |
| Lindsey Childs | Sacred Heart | 1 |

## Query 4: Patients, Treatment Hospitals, and Payment Dates

| Patient | Hospital | Payment Date |
|---|---|---|
| Zion Rogers | West Florida | 2021-05-26 |
| Samuel Smith | Baptist | 2022-02-16 |
| Lorenzo Derby | Select Specialty | 2024-01-07 |
| Sarah Jackson | Naval Hospital | 2024-02-23 |
| Joe Daniels | Sacred Heart | 2024-07-23 |

## Query 5: Payment Amount by Physician

| Physician | Total Payment Amount |
|---|---:|
| Doc Stuffins | $800.06 |
| Anthony Gladdney | $650.00 |
| Karissa Belzer | $550.00 |
| Lindsey Childs | $25.31 |
| Elena Boiko | $15.32 |

The totals represent payments associated with each physician's assigned patients; they do not represent compensation paid directly to physicians.

## Query 6: Hospital Classifications and Physicians

| Hospital | Hospital Type | Physician |
|---|---|---|
| Baptist | Community | Anthony Gladdney |
| Baptist | Free | Anthony Gladdney |
| Baptist | Teaching | Anthony Gladdney |
| Naval Hospital | Free | Doc Stuffins |
| Sacred Heart | Community | Lindsey Childs |
| Sacred Heart | Free | Lindsey Childs |
| Sacred Heart | Teaching | Lindsey Childs |
| Select Specialty | Community | Karissa Belzer |
| West Florida | Community | Elena Boiko |
| West Florida | Free | Elena Boiko |
| West Florida | Teaching | Elena Boiko |

## Query 7: Overlapping Hospital Specializations

| Hospital | Teaching Accreditation | Community County | Free-Hospital Sponsor |
|---|---|---|---|
| Baptist | ABS | Escambia | People First |
| Naval Hospital | — | — | Navy |
| Sacred Heart | CCNE | Escambia | Helping Hands |
| Select Specialty | — | Santa Rosa | — |
| West Florida | ACCME | Okaloosa | Florida Care |

Query 7 uses `LEFT JOIN` to retain every hospital, including hospitals that do not have a matching record in all three specialization tables.
