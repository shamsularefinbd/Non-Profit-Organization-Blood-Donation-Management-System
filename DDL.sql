/*
--------------------------------------------------------------------------------
	SQL Project Name : Non-Profit Organisation & Blood Donation Management System (NPOBDS)
    
							    Trainee Name : Shamsul Arefin   
						    	  Trainee ID : 1294499      
								Batch ID : WADA/PNTL-R69 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [NPO & Blood Donation]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: CREATE INDEXES
			=> SECTION 04: CREATE VIEW & ALTER VIEW
			=> SECTION 05: STORED PROCEDURES
			=> SECTION 06: FUNCTIONS
			=> SECTION 07: AFTER TRIGGERS
*/


/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/


USE master
GO

IF DB_ID('NPOBDMS') IS NOT NULL
DROP DATABASE NPOBDMS
GO

CREATE DATABASE NPOBDMS
ON
(
	name = 'NPOBDMS_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\NPOBDMS_data.mdf',
	size = 10MB,
	maxsize = 100MB,
	filegrowth = 5%
)
LOG ON
(
	name = 'NPOBDMS_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\NPOBDMS_log.ldf',
	size = 8MB,
	maxsize = 50MB,
	filegrowth = 5MB
)
GO

USE NPOBDMS
GO


/*
==============================  SECTION 02  ==============================
		         Created Appropriate Tables with column definition related to the project
==========================================================================
*/

--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--


CREATE TABLE Organization
(
    OrganizationId INT PRIMARY KEY IDENTITY(1,1),
    OrganizationName VARCHAR(200) NOT NULL,
    EST_Date DATE NOT NULL,
    FounderName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    EmployeeNumber INT CHECK (EmployeeNumber >= 0),
    YearlyBudget DECIMAL(18,2) CHECK (YearlyBudget >= 0)
	)
GO


CREATE TABLE Country
(
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) UNIQUE NOT NULL
)
GO


CREATE TABLE Religion
(
    ReligionId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50)  UNIQUE NOT NULL
)
GO

CREATE TABLE BloodGroup
(
    BloodGroupId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(5) UNIQUE NOT NULL
        CHECK (Name IN ('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'))
)
GO

CREATE TABLE Education
(
    EducationId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    PassingYear INT CHECK (PassingYear >= 1950 AND PassingYear <= 2100)
)
GO

CREATE TABLE Institute
(
    InstituteId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(200) NOT NULL,
    Address VARCHAR(100)
)
GO

CREATE TABLE Designation
(
    DesignationId INT PRIMARY KEY IDENTITY(1,1),
    Desi_Name VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Company
(
    CompanyId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(200) NOT NULL ,
    Address VARCHAR(100)
)
GO


CREATE TABLE City
(
    CityId INT PRIMARY KEY IDENTITY(1,1),
    CityName VARCHAR(100) NOT NULL,
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId),
)
GO


CREATE TABLE Event
(
    EventId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(200) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(100),
    EventType VARCHAR(50) CHECK (EventType IN ('Fundraising', 'Awareness', 'Training', 'Medical Camp', 'Other')),
    OrganizationId INT FOREIGN KEY REFERENCES Organization(OrganizationId)
)
GO


CREATE TABLE Project
(
    ProjectId INT PRIMARY KEY IDENTITY(1,1),
    ProjectName VARCHAR(200) NOT NULL,
    Budget DECIMAL(18,2) CHECK (Budget >= 0),
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    ProjectBase VARCHAR(100),
    OrganizationId INT FOREIGN KEY REFERENCES Organization(OrganizationId),
    CONSTRAINT CK_Project_Dates CHECK (EndDate IS NULL OR EndDate >= StartDate)
)
GO


CREATE TABLE Supporter
(
    SupporterId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20) UNIQUE NOT NULL,
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20) UNIQUE,
    Nationality VARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    Website VARCHAR(200),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId),
    CompanyId INT FOREIGN KEY REFERENCES Company(CompanyId)
)
GO


CREATE TABLE Volunteer
(
    VolunteerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20) UNIQUE NOT NULL,
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20) UNIQUE,
    Nationality NVARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    Website VARCHAR(200),
    JoiningDate DATE DEFAULT GETDATE(),
    VolunteerType VARCHAR(50) CHECK (VolunteerType IN ('Full-Time', 'Part-Time', 'Occasional')),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId),
    EducationId INT FOREIGN KEY REFERENCES Education(EducationId),
    InstituteId INT FOREIGN KEY REFERENCES Institute(InstituteId),
    DesignationId INT FOREIGN KEY REFERENCES Designation(DesignationId)
)
GO


CREATE TABLE Donor
(
    DonorId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20) UNIQUE NOT NULL,
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20) UNIQUE,
    Nationality VARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId)
)
GO



CREATE TABLE Beneficiary
(
    BeneficiaryId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100),
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20),
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20),
    Nationality VARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId)
)
GO


CREATE TABLE Patient
(
    PatientId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100),
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20),
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20),
    Nationality VARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId)
)
GO



CREATE TABLE Employee
(
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NULL,
    FatherName VARCHAR(100),
    MotherName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
        CHECK (Email LIKE '%@%.%'),
    Phone VARCHAR(20) UNIQUE NOT NULL,
        CHECK (Phone LIKE '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PresentAddress VARCHAR(100),
    PermanentAddress VARCHAR(100),
    DateOfBirth DATE,
        CHECK (DateOfBirth <= GETDATE()),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    MaritalStatus VARCHAR(20) CHECK (MaritalStatus IN ('Single', 'Married', 'Divorced', 'Widowed')),
    NID VARCHAR(20) UNIQUE,
    Nationality VARCHAR(50) DEFAULT 'Bangladeshi',
    ZipCode VARCHAR(10),
    Website VARCHAR(200),
    JoiningDate DATE DEFAULT GETDATE(),
    EmployeeType VARCHAR(50) CHECK (EmployeeType IN ('Permanent', 'Contractual', 'Probation')),
    ReligionId INT FOREIGN KEY REFERENCES Religion(ReligionId),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId),
    EducationId INT FOREIGN KEY REFERENCES Education(EducationId),
    InstituteId INT FOREIGN KEY REFERENCES Institute(InstituteId),
    DesignationId INT FOREIGN KEY REFERENCES Designation(DesignationId)
)
GO


CREATE TABLE Donation
(
    DonationId INT PRIMARY KEY IDENTITY(1,1),
    DonorId INT FOREIGN KEY REFERENCES Donor(DonorId),
    Amount DECIMAL(18,2) NOT NULL CHECK (Amount > 0),
    DonationDate DATE DEFAULT GETDATE(),
    PaymentMethod VARCHAR(50) CHECK (PaymentMethod IN ('Cash', 'Bank', 'Mobile Banking', 'Card', 'Cheque'))
)
GO


CREATE TABLE BloodRequest
(
    BloodRequestId INT PRIMARY KEY IDENTITY(1,1),
    RequestGroupName VARCHAR(100) NOT NULL,
    PatientId INT FOREIGN KEY REFERENCES Patient(PatientId),
    BloodGroupId INT FOREIGN KEY REFERENCES BloodGroup(BloodGroupId),
    RequestDate DATE DEFAULT GETDATE(),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Fulfilled', 'Cancelled')) DEFAULT 'Pending',
    UnitsNeeded INT CHECK (UnitsNeeded > 0)
)
GO



CREATE TABLE BloodDonation
(
    BloodDonationId INT PRIMARY KEY IDENTITY(1,1),
    BloodRequestId INT FOREIGN KEY REFERENCES BloodRequest(BloodRequestId),
    DonorId INT FOREIGN KEY REFERENCES Donor(DonorId),
    BloodGroupId INT FOREIGN KEY REFERENCES BloodGroup(BloodGroupId),
    DonationDate DATE DEFAULT GETDATE(),
    UnitsGiven INT CHECK (UnitsGiven > 0) DEFAULT 1
)
GO



CREATE TABLE ImageTable
(
    ImageId INT PRIMARY KEY IDENTITY(1,1),
    SupporterId INT FOREIGN KEY REFERENCES Supporter(SupporterId),
    VolunteerId INT FOREIGN KEY REFERENCES Volunteer(VolunteerId),
    BeneficiaryId INT FOREIGN KEY REFERENCES Beneficiary(BeneficiaryId),
    EmployeeId INT FOREIGN KEY REFERENCES Employee(EmployeeId),
    DonorId INT FOREIGN KEY REFERENCES Donor(DonorId),
    PatientId INT FOREIGN KEY REFERENCES Patient(PatientId),
    ImagePath NVARCHAR(500) NOT NULL,
    UploadDate DATETIME DEFAULT GETDATE(),
    
)
GO

-- ==========================================
-- SECTION 03: CREATE INDEXES
-- ==========================================

-- Clustered Index (already created with PRIMARY KEY)
-- Non-Clustered Indexes

CREATE NONCLUSTERED INDEX IX_Supporter_Phone ON Supporter(Phone)
GO

CREATE NONCLUSTERED INDEX IX_Supporter_Email ON Supporter(Email)
GO

CREATE NONCLUSTERED INDEX IX_Donor_Phone ON Donor(Phone)
GO

CREATE NONCLUSTERED INDEX IX_Donation_Date ON Donation(DonationDate)
GO

CREATE NONCLUSTERED INDEX IX_BloodRequest_Date ON BloodRequest(RequestDate)
GO



-- ==========================================
-- SECTION 04: CREATE VIEW & ALTER VIEW
-- ==========================================

-- View 1: Donor Details with Blood Group
CREATE VIEW vDonorDetails
AS
SELECT 
    d.DonorId,
    CONCAT(d.FirstName, ' ', d.LastName) AS FullName,
    d.Phone,
    d.Email,
    c.CityName AS City,
    r.Name AS Religion
FROM Donor d
INNER JOIN City c ON d.CityId = c.CityId
INNER JOIN Religion r ON d.ReligionId = r.ReligionId
GO

-- View 2: Blood Donation Summary
CREATE VIEW vBloodDonationSummary
WITH ENCRYPTION 
AS
SELECT 
    bg.Name AS BloodGroup,
    COUNT(bd.BloodDonationId) AS TotalDonations,
    SUM(bd.UnitsGiven) AS TotalUnits
FROM BloodDonation bd
INNER JOIN BloodGroup bg ON bd.BloodGroupId = bg.BloodGroupId
GROUP BY bg.Name
GO

-- View 3: Donation Report
CREATE VIEW vDonationReport
WITH SCHEMABINDING
AS
SELECT 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
    don.Amount,
    don.DonationDate,
    don.PaymentMethod,
    YEAR(don.DonationDate) AS DonationYear
FROM Donation don
INNER JOIN Donor d ON don.DonorId = d.DonorId
GO

-- ALTER View
ALTER VIEW vDonorDetails
AS
SELECT 
    d.DonorId,
    CONCAT(d.FirstName, ' ', d.LastName) AS FullName,
    d.Phone,
    d.Email,
    d.PresentAddress,
    c.CityName AS City,
    co.Name AS Country,
    r.Name AS Religion
FROM Donor d
INNER JOIN City c ON d.CityId = c.CityId
INNER JOIN Country co ON d.CountryId = co.CountryId
INNER JOIN Religion r ON d.ReligionId = r.ReligionId
GO

-- ==========================================
-- SECTION 05: STORED PROCEDURES
-- ==========================================

-- SP 1: Insert New Donor
CREATE PROC spInsertDonor
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Phone VARCHAR(20),
    @Email VARCHAR(100),
    @ReligionId INT,
    @CityId INT,
    @CountryId INT
AS
BEGIN
    INSERT INTO Donor (FirstName, LastName, Phone, Email, ReligionId, CityId, CountryId)
    VALUES (@FirstName, @LastName, @Phone, @Email, @ReligionId, @CityId, @CountryId)
    
    PRINT 'Donor inserted successfully!'
END
GO

-- SP 2: Get Donors by City
CREATE PROC spGetDonorsByCity
    @CityId INT
AS
BEGIN
    SELECT 
        CONCAT(FirstName, ' ', LastName) AS FullName,
        Phone,
        Email
    FROM Donor
    WHERE CityId = @CityId
END
GO

-- SP 3: Update Donation Amount
CREATE PROC spUpdateDonation
    @DonationId INT,
    @NewAmount DECIMAL(18,2)
AS
BEGIN
    UPDATE Donation
    SET Amount = @NewAmount
    WHERE DonationId = @DonationId
    
    PRINT 'Donation amount updated!'
END
GO

-- SP 4: Delete Donor
CREATE PROC spDeleteDonor
    @DonorId INT
AS
BEGIN
    DELETE FROM Donor
    WHERE DonorId = @DonorId
    
    PRINT 'Donor deleted successfully!'
END
GO

-- ALTER Stored Procedure
ALTER PROC spInsertDonor
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Phone VARCHAR(20),
    @Email VARCHAR(100),
    @DateOfBirth DATE,
    @Gender VARCHAR(10),
    @ReligionId INT,
    @CityId INT,
    @CountryId INT
AS
BEGIN
    INSERT INTO Donor (FirstName, LastName, Phone, Email, DateOfBirth, Gender, ReligionId, CityId, CountryId)
    VALUES (@FirstName, @LastName, @Phone, @Email, @DateOfBirth, @Gender, @ReligionId, @CityId, @CountryId)
    
    PRINT 'Donor inserted successfully with more details!'
END
GO


--STORED PROCEDURE WITH MULTIPLE INPUT PARAMETERS
CREATE PROC spSearchDonors
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @CityId INT = NULL,
    @BloodGroupId INT = NULL
AS
BEGIN
    SELECT 
        d.DonorId,
        CONCAT(d.FirstName, ' ', d.LastName) AS FullName,
        d.Phone,
        d.Email,
        c.CityName
    FROM Donor d
    LEFT JOIN City c ON d.CityId = c.CityId
    WHERE 
        (@FirstName IS NULL OR d.FirstName LIKE '%' + @FirstName + '%')
        AND (@LastName IS NULL OR d.LastName LIKE '%' + @LastName + '%')
        AND (@CityId IS NULL OR d.CityId = @CityId)
END
GO


--STORED PROCEDURE WITH OUTPUT PARAMETERS
CREATE PROC spGetDonorCount
    @CityId INT = NULL,
    @TotalCount INT OUTPUT
AS
BEGIN
    SELECT @TotalCount = COUNT(*)
    FROM Donor
    WHERE @CityId IS NULL OR CityId = @CityId
END
GO



--STORED PROCEDURE WITH INPUT AND OUTPUT PARAMETERS
CREATE PROC spInsertDonorWithReturn
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Phone VARCHAR(20),
    @Email VARCHAR(100),
    @DateOfBirth DATE,
    @Gender VARCHAR(10),
    @ReligionId INT,
    @CityId INT,
    @CountryId INT,
    @NewDonorId INT OUTPUT
AS
BEGIN
    INSERT INTO Donor (FirstName, LastName, Phone, Email, DateOfBirth, Gender, 
                       ReligionId, CityId, CountryId)
    VALUES (@FirstName, @LastName, @Phone, @Email, @DateOfBirth, @Gender, 
            @ReligionId, @CityId, @CountryId)
    
    SET @NewDonorId = SCOPE_IDENTITY()
    
    PRINT 'Donor inserted successfully with ID: ' + CAST(@NewDonorId AS VARCHAR)
END
GO



--STORED PROCEDURE WITH RETURN VALUE
CREATE PROC spCheckDonorExists
    @Phone VARCHAR(20)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Donor WHERE Phone = @Phone)
        RETURN 1  
    ELSE
        RETURN 0 
END
GO


--STORED PROCEDURE WITH ERROR HANDLING (TRY-CATCH)
CREATE PROC spInsertDonorWithErrorHandling
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Phone VARCHAR(20),
    @Email VARCHAR(100),
    @ReligionId INT,
    @CityId INT,
    @CountryId INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
        
        INSERT INTO Donor (FirstName, LastName, Phone, Email, ReligionId, CityId, CountryId)
        VALUES (@FirstName, @LastName, @Phone, @Email, @ReligionId, @CityId, @CountryId)
        
        COMMIT TRANSACTION
        PRINT 'Donor inserted successfully!'
        RETURN 1
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
        
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE()
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY()
        DECLARE @ErrorState INT = ERROR_STATE()
        
        PRINT 'Error: ' + @ErrorMessage
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
        RETURN -1
    END CATCH
END
GO

-- ==========================================
-- SECTION 06: FUNCTIONS
-- ==========================================

-- 1. SCALAR FUNCTION
CREATE FUNCTION fnGetTotalDonation(@DonorId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2)
    SELECT @total = SUM(Amount)
    FROM Donation
    WHERE DonorId = @DonorId
    RETURN ISNULL(@total, 0)
END
GO

-- 2. SIMPLE TABLE-VALUED FUNCTION
CREATE FUNCTION fnGetDonorsByBloodGroup(@BloodGroupId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        d.DonorId,
        CONCAT(d.FirstName, ' ', d.LastName) AS FullName,
        d.Phone,
        d.Email
    FROM Donor d
    INNER JOIN BloodDonation bd ON d.DonorId = bd.DonorId
    WHERE bd.BloodGroupId = @BloodGroupId
)
GO

-- 3. MULTI-STATEMENT TABLE-VALUED FUNCTION
CREATE FUNCTION fnGetDonationSummary(@Year INT)
RETURNS @DonationTable TABLE
(
    Month INT,
    TotalAmount DECIMAL(18,2),
    DonationCount INT
)
AS
BEGIN
    INSERT INTO @DonationTable
    SELECT 
        MONTH(DonationDate) AS Month,
        SUM(Amount) AS TotalAmount,
        COUNT(*) AS DonationCount
    FROM Donation
    WHERE YEAR(DonationDate) = @Year
    GROUP BY MONTH(DonationDate)
    
    RETURN
END
GO

-- ALTER Function
ALTER FUNCTION fnGetTotalDonation(@DonorId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2)
    SELECT @total = SUM(Amount)
    FROM Donation
    WHERE DonorId = @DonorId AND DonationDate >= DATEADD(YEAR, -1, GETDATE())
    RETURN ISNULL(@total, 0)
END
GO

-- ==========================================
-- SECTION 07: AFTER TRIGGERS
-- ==========================================

-- Trigger 1: Audit Log for Donations
CREATE TABLE DonationAudit
(
    AuditId INT IDENTITY(1,1) PRIMARY KEY,
    DonationId INT,
    OldAmount DECIMAL(18,2),
    NewAmount DECIMAL(18,2),
    ModifiedDate DATETIME DEFAULT GETDATE()
)
GO

CREATE TRIGGER trAfterDonationUpdate
ON Donation
AFTER UPDATE
AS
BEGIN
    INSERT INTO DonationAudit (DonationId, OldAmount, NewAmount)
    SELECT 
        i.DonationId,
        d.Amount AS OldAmount,
        i.Amount AS NewAmount
    FROM inserted i
    INNER JOIN deleted d ON i.DonationId = d.DonationId
    
    PRINT 'Donation audit logged!'
END
GO

-- Trigger 2: Validate Donation Amount
CREATE TRIGGER trCheckDonationAmount
ON Donation
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Amount <= 0)
    BEGIN
        RAISERROR('Donation amount must be greater than zero!', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO


-- Trigger 3: Validate Donation Amount

CREATE TABLE CompanyCheck
(
    LogId INT PRIMARY KEY IDENTITY(1,1),
    CompanyId INT,
    Name VARCHAR(200),
    Address VARCHAR(100),
    InsertedBy VARCHAR(100) DEFAULT SYSTEM_USER,
    InsertedAt DATETIME DEFAULT GETDATE()
)
GO


CREATE TRIGGER trAfterInsertCompany
ON Company
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON

    INSERT INTO CompanyCheck (CompanyId, Name, Address)
    SELECT CompanyId, Name, Address FROM inserted
END
GO

---Trigger 4:INSERT, UPDATE, DELETE IN TRIGGER 

CREATE TRIGGER trg_Company_AllChanges
ON Company
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON

    -- INSERT
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO CompanyLog (CompanyId, CompanyName, Address, ActionType)
        SELECT CompanyId, Name, Address, 'INSERT'
        FROM inserted
    END

    -- DELETE
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO CompanyLog (CompanyId, CompanyName, Address, ActionType)
        SELECT CompanyId, Name, Address, 'DELETE'
        FROM deleted
    END

    -- UPDATE
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO CompanyLog (CompanyId, CompanyName, Address, ActionType)
        SELECT CompanyId, Name, Address, 'UPDATE (NEW)'
        FROM inserted
        INSERT INTO CompanyLog (CompanyId, CompanyName, Address, ActionType)
        SELECT CompanyId, Name, Address, 'UPDATE (OLD)'
        FROM deleted
    END
END
GO