# Non-Profit Organization & Blood Donation Management System (NPOBDMS)

A comprehensive **SQL Server 2022** database project for managing a non-profit organization's operations, including blood donation coordination, volunteer management, financial tracking, and community project management.

---

## 📋 Project Info

| Field | Details |
|---|---|
| **Trainee** | Shamsul Arefin |
| **Trainee ID** | 1294499 |
| **Batch** | WADA/PNTL-M/69/01 |
| **Course** | Web Application Development using ASP.NET |
| **Module** | SQL Server 2022 |
| **Institute** | PeopleNTech Institute of Information Technology |
| **Programme** | IsDB-BISEW IT Scholarship Programme |
| **Submitted To** | Syed Zahidul Hassan, Show & Tell Consulting Ltd |
| **Submission Date** | 31 December 2025 |

---

## 🏢 Organization Context

The database was designed for **Baro Baishdia Village Development Society**, a non-profit founded on **2 March 2022** by **Shamsul Arefin** in Barisal, Bangladesh. The organization has 50 employees and a yearly budget of 10,000,000 BDT. Its mission spans community development projects and organized blood donation services.

---

## 📁 Repository Structure

```
NPOBDMS/
│
├── DDL.sql          # Database creation, tables, indexes, views,
│                    # stored procedures, functions, triggers
│
├── DML.sql          # Data insertion, queries, reporting, analytics
│
└── Case_Study.pdf   # Project documentation and architectural overview
```

---

## 🗄️ Database Architecture

### Core Infrastructure Tables
| Table | Purpose |
|---|---|
| `Organization` | High-level admin info, founder details, budget |
| `Country` | Standardized country lookup |
| `City` | City lookup linked to Country |
| `Religion` | Religious demographic filter |
| `BloodGroup` | 8 standard blood types (A+, A−, B+, B−, O+, O−, AB+, AB−) |
| `Education` | Academic qualifications |
| `Institute` | Educational institutions |
| `Designation` | Staff job titles |
| `Company` | Corporate affiliates for supporters |

### Human Capital Tables
| Table | Purpose |
|---|---|
| `Employee` | Permanent / contractual / probation staff |
| `Volunteer` | Volunteers with type: Full-Time, Part-Time, Occasional |
| `Supporter` | External advocates with company affiliations |
| `Beneficiary` | Community members receiving services |

### Medical & Operations Tables
| Table | Purpose |
|---|---|
| `Donor` | Blood donor registry |
| `Patient` | Patient demographic records |
| `BloodRequest` | Blood requests with status tracking (Pending / Fulfilled / Cancelled) |
| `BloodDonation` | Junction table linking donors to blood requests |
| `Donation` | Financial donations with payment method |
| `Event` | Org events: Medical Camp, Fundraising, Awareness, Training |
| `Project` | Community projects with budgets and timelines |

### Audit Tables
| Table | Purpose |
|---|---|
| `DonationAudit` | Logs every update to a donation record |
| `CompanyCheck` | Logs new company inserts |
| `CompanyLog` | Tracks all INSERT / UPDATE / DELETE on Company |

---

## ⚙️ DDL — What's Implemented

### Section 01 — Database Creation
- Custom `.mdf` (10 MB, max 100 MB, 5% growth) and `.ldf` (8 MB, max 50 MB, 5 MB growth) file configuration
- Existence check before creation (`IF DB_ID(...) IS NOT NULL DROP DATABASE`)

### Section 02 — Tables
- `IDENTITY(1,1)` primary keys on all tables
- `CHECK` constraints: phone format (`01XXXXXXXXX`), email format, non-negative amounts, valid blood groups, valid dates
- `DEFAULT` values: Nationality → `'Bangladeshi'`, dates → `GETDATE()`
- `FOREIGN KEY` relationships enforcing referential integrity

### Section 03 — Indexes
```sql
IX_Supporter_Email   -- Fast contact lookup
IX_Donor_Phone       -- Emergency donor search
IX_Donation_Date     -- Fast financial reporting
```

### Section 04 — Views
- `vBloodDonationSummary` — Blood donation history by group
- `vDonationReport` — Financial donation summary for stakeholders

### Section 05 — Stored Procedures

| Procedure | Description |
|---|---|
| `spInsertDonor` | Standard donor onboarding |
| `spGetDonorsByCity` | Retrieve local donors for emergencies |
| `spUpdateDonation` | Financial record adjustments |
| `spSearchDonors` | Multi-parameter donor search |
| `spGetDonorCount` | Count donors by city (OUTPUT param) |
| `spInsertDonorWithReturn` | Insert donor, return new ID (OUTPUT param) |
| `spCheckDonorExists` | Check by phone, returns 1 or 0 (RETURN value) |
| `spInsertDonorWithErrorHandling` | Full TRY-CATCH transaction-safe insert |

### Section 06 — Functions

| Function | Type | Description |
|---|---|---|
| `fnGetTotalDonation(@DonorId)` | Scalar | Lifetime donation value (last 12 months) |
| `fnGetDonorsByBloodGroup(@BloodGroupId)` | Inline TVF | List donors by blood group |
| `fnGetDonationSummary(@Year)` | Multi-statement TVF | Monthly breakdown of amounts & counts |

### Section 07 — Triggers

| Trigger | Event | Description |
|---|---|---|
| `trAfterDonationUpdate` | AFTER UPDATE | Logs old/new amount to `DonationAudit` |
| `trCheckDonationAmount` | AFTER INSERT, UPDATE | Rejects zero or negative donation amounts |
| `trAfterInsertCompany` | AFTER INSERT | Logs new company to `CompanyCheck` |
| `trg_Company_AllChanges` | AFTER INSERT, UPDATE, DELETE | Full change tracking to `CompanyLog` |

---

## 📊 DML — Query Coverage

The `DML.sql` file covers 26 sections including:

- All JOIN types (INNER, LEFT, RIGHT, FULL, CROSS, SELF)
- `DISTINCT`, `TOP`, `PERCENT`, `WITH TIES`
- String functions and concatenation
- `GROUP BY`, `HAVING`, `ROLLUP`, `CUBE`, `GROUPING SETS`
- Arithmetic and comparison expressions, `BETWEEN`, `OFFSET FETCH`
- Set operations: `UNION`, `UNION ALL`, `EXCEPT`, `INTERSECT`
- Subqueries, CTEs, and Recursive CTEs
- `CAST`, `CONVERT`, `TRY_CONVERT`, date & numeric functions
- `COALESCE`, `ISNULL`, `CASE`, `IIF`, `CHOOSE`
- Temporary tables and table variables
- Ranking functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`
- System stored procedures: `sp_helpdb`, `sp_help`, `sp_columns`, etc.
- `TRY-CATCH` error handling with `RAISERROR` and `THROW`

---

## 🚀 Getting Started

### Prerequisites
- Microsoft SQL Server 2022
- SQL Server Management Studio (SSMS) or Azure Data Studio

### Deployment

1. **Update the file path** in `DDL.sql` if your SQL Server data directory differs:
   ```sql
   -- Default path (change if needed):
   filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\NPOBDMS_data.mdf'
   ```

2. **Run DDL first**, then DML:
   ```
   1. Open DDL.sql in SSMS
   2. Execute (F5) — creates the database, all tables, indexes, views, SPs, functions, triggers
   3. Open DML.sql in SSMS
   4. Execute (F5) — inserts sample data and runs all query demonstrations
   ```

---

## 🔐 Data Integrity Rules

- Phone numbers must follow Bangladeshi 11-digit format starting with `01`
- Emails must contain `@` and `.`
- All financial amounts must be ≥ 0; donation amounts must be > 0 (enforced by trigger)
- Blood group names restricted to 8 valid biological types
- Project end date must be ≥ start date
- `DateOfBirth` cannot be a future date

---

## 📞 Contact

| | |
|---|---|
| **Organization** | Baro Baishdia Village Development Society |
| **Location** | Barisal, Bangladesh |
| **Email** | bvdsbangladesh@gmail.com |

---
