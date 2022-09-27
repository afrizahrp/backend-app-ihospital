BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[sysCompany] (
    [id] CHAR(5) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [sysCompany_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysBranch] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [address] VARCHAR(100) NOT NULL,
    [phone] VARCHAR(20) NOT NULL,
    [email] VARCHAR(50) NOT NULL,
    [contactPerson] VARCHAR(50) NOT NULL,
    [contactPhone] VARCHAR(20) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5) NOT NULL,
    CONSTRAINT [sysBranch_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysCounter] (
    [module_id] CHAR(3) NOT NULL,
    [counter_id] CHAR(3) NOT NULL,
    [lastCounter] INT,
    [description] VARCHAR(160) NOT NULL,
    [pattern] CHAR(30) NOT NULL,
    [combiner] CHAR(20) NOT NULL,
    [refreshAt] CHAR(1) NOT NULL,
    [firstChar] CHAR(4) NOT NULL,
    [secondChar] CHAR(4) NOT NULL,
    [digits] INT NOT NULL,
    [startYear] CHAR(4) NOT NULL,
    [startMonth] CHAR(2) NOT NULL,
    [startCount] INT NOT NULL,
    [recounter] INT NOT NULL,
    [autoGenerate] BIT NOT NULL CONSTRAINT [sysCounter_autoGenerate_df] DEFAULT 0,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5) NOT NULL,
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysCounter_pkey] PRIMARY KEY CLUSTERED ([module_id],[counter_id],[startYear],[startMonth])
);

-- CreateTable
CREATE TABLE [dbo].[sysDocId] (
    [module_id] CHAR(3) NOT NULL,
    [prefix_id] CHAR(3) NOT NULL,
    [doc_id] CHAR(20) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5) NOT NULL,
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysDocId_pkey] PRIMARY KEY CLUSTERED ([doc_id])
);

-- CreateTable
CREATE TABLE [dbo].[sysUser] (
    [role_id] CHAR(20) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [email] VARCHAR(30) NOT NULL,
    [phone] VARCHAR(20) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [tokenForAccess] NVARCHAR(1000),
    [isLoggedIn] BIT NOT NULL,
    [tokenHasRefreshed] NVARCHAR(1000),
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5) NOT NULL,
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysUser_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [sysUser_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[sysUserRole] (
    [id] CHAR(20) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [isAdmin] BIT NOT NULL,
    [description] VARCHAR(150) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5) NOT NULL,
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysUserRole_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosCheckSpecDev] (
    [id] CHAR(10) NOT NULL,
    [seqNo] TINYINT NOT NULL IDENTITY(1,1),
    [device_id] CHAR(20) NOT NULL,
    [deviceName] VARCHAR(50) NOT NULL,
    [deviceType] VARCHAR(50) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] CHAR(10) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [remarks] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosCheckSpecDev_pkey] PRIMARY KEY CLUSTERED ([id],[seqNo])
);

-- CreateTable
CREATE TABLE [dbo].[hosCheckSpecDtl] (
    [seqNo] TINYINT NOT NULL IDENTITY(1,1),
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [botValue] DECIMAL(9,6) NOT NULL,
    [botValUom] CHAR(10) NOT NULL,
    [midValue] DECIMAL(9,6) NOT NULL,
    [midValUom] CHAR(10) NOT NULL,
    [topValue] DECIMAL(9,6) NOT NULL,
    [topValUom] CHAR(10) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] CHAR(10) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [remarks] VARCHAR(250) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosCheckSpecDtl_pkey] PRIMARY KEY CLUSTERED ([id],[seqNo])
);

-- CreateTable
CREATE TABLE [dbo].[hosCheckSpecHdr] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [description] VARCHAR(100) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] CHAR(10) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [remarks] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosCheckSpecHdr_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosCheckSpecPrs] (
    [id] CHAR(10) NOT NULL,
    [seqNo] TINYINT NOT NULL IDENTITY(1,1),
    [subDept_id] CHAR(10) NOT NULL,
    [subDeptName] CHAR(10) NOT NULL,
    [leader] BIT NOT NULL,
    [emp_id] CHAR(20) NOT NULL,
    [empName] VARCHAR(50) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] CHAR(10) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [remarks] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosCheckSpecPrs_pkey] PRIMARY KEY CLUSTERED ([id],[seqNo])
);

-- CreateTable
CREATE TABLE [dbo].[hosDoctor] (
    [id] CHAR(20) NOT NULL,
    [birthdate] DATETIME2 NOT NULL,
    [gender] TINYINT NOT NULL,
    [fullName] VARCHAR(80) NOT NULL,
    [nickName] VARCHAR(20) NOT NULL,
    [joinDate] DATETIME2 NOT NULL,
    [hiredStatus] TINYINT NOT NULL,
    [activeStatus] BIT NOT NULL,
    [onlineStatus] TINYINT NOT NULL,
    [mobile] VARCHAR(20),
    [email] VARCHAR(50),
    [socMedia_id] VARCHAR(60),
    [pictUrl] VARCHAR(80),
    [avatar] VARCHAR(80),
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosDoctor_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosPatient] (
    [id] CHAR(20) NOT NULL,
    [nickName] VARCHAR(30) NOT NULL,
    [fullName] VARCHAR(50) NOT NULL,
    [birthDate] DATE NOT NULL,
    [ageInYear] TINYINT,
    [ageInMonth] TINYINT,
    [gender] CHAR(6) NOT NULL,
    [bloodType] VARCHAR(5) NOT NULL,
    [religion] VARCHAR(15) NOT NULL,
    [maritalStatus] CHAR(7) NOT NULL,
    [country_id] CHAR(3) NOT NULL,
    [prov_id] CHAR(2) NOT NULL,
    [provName] VARCHAR(50) NOT NULL,
    [subProv_id] CHAR(2) NOT NULL,
    [subProvName] VARCHAR(50) NOT NULL,
    [district_id] CHAR(2) NOT NULL,
    [districtName] VARCHAR(50) NOT NULL,
    [subdistrict_id] CHAR(2) NOT NULL,
    [subdistrictName] VARCHAR(50),
    [address] VARCHAR(80) NOT NULL,
    [mobileNo1] VARCHAR(20) NOT NULL,
    [mobileNo2] VARCHAR(20) NOT NULL,
    [phoneNo] VARCHAR(15) NOT NULL,
    [email] VARCHAR(80),
    [occupation] VARCHAR(50),
    [createdBy] CHAR(10),
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10),
    [updatedAt] DATETIME NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10),
    CONSTRAINT [hosPatient_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [hosPatient_id_key] UNIQUE NONCLUSTERED ([id]),
    CONSTRAINT [hosPatient_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[hosPatientCaseDtl] (
    [id] CHAR(20) NOT NULL,
    [seqNo] TINYINT NOT NULL IDENTITY(1,1),
    [trxType] CHAR(3) NOT NULL,
    [description] VARCHAR(100) NOT NULL,
    [medicine_id] CHAR(20) NOT NULL,
    [medicineName] VARCHAR(50) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] CHAR(10) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosPatientCaseDtl_pkey] PRIMARY KEY CLUSTERED ([id],[seqNo])
);

-- CreateTable
CREATE TABLE [dbo].[hosPatientCaseHdr] (
    [registry_id] CHAR(20) NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [patientName] VARCHAR(50) NOT NULL,
    [doctor_id] CHAR(20) NOT NULL,
    [doctorName] VARCHAR(50) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [descriptions] VARCHAR(100),
    [caseDate] DATETIME NOT NULL,
    [symptom] VARCHAR(200),
    [firstDiag] VARCHAR(200),
    [isPatientOk] TINYINT,
    [isreferred] BIT NOT NULL,
    [ref_id] CHAR(20),
    [referCase] VARCHAR(100),
    [referDate] DATE NOT NULL,
    [referTo] VARCHAR(80) NOT NULL,
    [toPoly_id] CHAR(10) NOT NULL,
    [toPolyName] VARCHAR(50) NOT NULL,
    [status] TINYINT,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosPatientCaseHdr_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosPatientCheckDtl] (
    [seqNo] TINYINT NOT NULL IDENTITY(1,1),
    [id] CHAR(20) NOT NULL,
    [trxType] CHAR(3) NOT NULL,
    [name] VARCHAR(50),
    [value] DECIMAL(9,6),
    [uomValue] CHAR(10),
    [IndicatorValue] CHAR(10),
    [remarks] VARCHAR(100),
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [tax_rate] TINYINT NOT NULL,
    [price] DECIMAL(18,0) NOT NULL,
    [qty] VARCHAR(50) NOT NULL,
    [Uom] DECIMAL(9,6) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [addedAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [status] TINYINT,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosPatientCheckDtl_pkey] PRIMARY KEY CLUSTERED ([id],[seqNo])
);

-- CreateTable
CREATE TABLE [dbo].[hosPatientCheckHdr] (
    [trxType] CHAR(3) NOT NULL,
    [case_id] CHAR(20) NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [patientName] VARCHAR(50) NOT NULL,
    [doctor_id] CHAR(20) NOT NULL,
    [doctorName] VARCHAR(50) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [reff_id] CHAR(20) NOT NULL,
    [SeqNo] TINYINT NOT NULL,
    [description] VARCHAR(100) NOT NULL,
    [checkDate] DATETIME NOT NULL,
    [resultByValue] DECIMAL(18,6) NOT NULL,
    [resultByWords] VARCHAR(50) NOT NULL,
    [remarks] VARCHAR(200) NOT NULL,
    [recommendation] VARCHAR(100) NOT NULL,
    [schedule_id] CHAR(20) NOT NULL,
    [scheduleN] TINYINT NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosPatientCheckHdr_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosRegistration] (
    [trxType] CHAR(3) NOT NULL,
    [isEmergency] BIT NOT NULL,
    [emergency_id] CHAR(20) NOT NULL,
    [isAppointment] BIT NOT NULL,
    [appointment_id] CHAR(20) NOT NULL,
    [isInsurance] BIT NOT NULL,
    [insurance_id] CHAR(20) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [registryDate] DATE NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [patientName] VARCHAR(50) NOT NULL,
    [patientCase] CHAR(100) NOT NULL,
    [isrefer] BIT NOT NULL,
    [ref_id] CHAR(20),
    [referredCase] VARCHAR(200) NOT NULL,
    [referredDate] DATE NOT NULL,
    [referredFrom] VARCHAR(80) NOT NULL,
    [fromPoly_id] CHAR(10) NOT NULL,
    [fromPolyName] VARCHAR(50) NOT NULL,
    [fromDoctor_id] CHAR(20) NOT NULL,
    [fromDoctorName] VARCHAR(50) NOT NULL,
    [toPoly_id] CHAR(10) NOT NULL,
    [toPolyName] VARCHAR(50) NOT NULL,
    [toDoctor_id] CHAR(20) NOT NULL,
    [toDoctorName] VARCHAR(50) NOT NULL,
    [payType] TINYINT NOT NULL,
    [pay_id] VARCHAR(20),
    [status] TINYINT,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosRegistration_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosEmergencyNote] (
    [id] CHAR(20) NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [patientName] VARCHAR(50) NOT NULL,
    [doctor_id] CHAR(20) NOT NULL,
    [doctorName] VARCHAR(50) NOT NULL,
    [descriptions] VARCHAR(250) NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosEmergencyNote_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosInsurance] (
    [id] CHAR(20) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [types] CHAR(3) NOT NULL,
    [address] VARCHAR(100) NOT NULL,
    [phone] VARCHAR(20) NOT NULL,
    [contactPerson] VARCHAR(50) NOT NULL,
    [contactPhone] VARCHAR(20) NOT NULL,
    [contactEmail] VARCHAR(50) NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosInsurance_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosInsuranceDtl] (
    [id] CHAR(20) NOT NULL,
    [insurance_id] CHAR(20) NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [patientName] VARCHAR(50) NOT NULL,
    [startDate] DATE NOT NULL,
    [endDate] DATE NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosInsuranceDtl_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosInsuranceAlloc] (
    [insurance_id] CHAR(20) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [patient_id] CHAR(20) NOT NULL,
    [registration_id] CHAR(20) NOT NULL,
    [trxType] CHAR(3) NOT NULL,
    [class_id] CHAR(20) NOT NULL,
    [trxMode] CHAR(1) NOT NULL,
    [trx_id] CHAR(20) NOT NULL,
    [trxDate] DATE NOT NULL,
    [description] VARCHAR(100) NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [taxRate] TINYINT NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosInsuranceAlloc_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosInsuranceLedger] (
    [insurance_id] CHAR(20) NOT NULL,
    [id] CHAR(20) NOT NULL,
    [trxType] CHAR(3) NOT NULL,
    [class_id] CHAR(20) NOT NULL,
    [trxMode] CHAR(1) NOT NULL,
    [trx_id] CHAR(20) NOT NULL,
    [trxDate] DATE NOT NULL,
    [curr_id] CHAR(3) NOT NULL,
    [curr_rate] DECIMAL(9,4) NOT NULL,
    [description] VARCHAR(100) NOT NULL,
    [limitAmt] DECIMAL(15,4) NOT NULL,
    [baseAmt] DECIMAL(15,4) NOT NULL,
    [discAmt] DECIMAL(15,4) NOT NULL,
    [tax_id] CHAR(3) NOT NULL,
    [taxRate] TINYINT NOT NULL,
    [taxAmt] DECIMAL(15,4) NOT NULL,
    [trxAmt] DECIMAL(15,4) NOT NULL,
    [claimAmt] DECIMAL(15,4) NOT NULL,
    [balanceAmt] DECIMAL(15,4) NOT NULL,
    [status] TINYINT NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosInsuranceLedger_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[hosSpecialist] (
    [div_id] CHAR(10) NOT NULL,
    [dept_id] CHAR(10) NOT NULL,
    [subDept_id] CHAR(10) NOT NULL,
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [reqCert] VARCHAR(200),
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [hosSpecialist_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[iCtUom] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50),
    [remarks] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [iCtUom_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcCountry] (
    [id] CHAR(3) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcCountry_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcDirection] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(50),
    [direction] VARCHAR(100),
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcDirection_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcDistrict] (
    [subProv_id] CHAR(2) NOT NULL,
    [id] CHAR(2) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcDistrict_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcFloor] (
    [direction_id] CHAR(10) NOT NULL,
    [id] CHAR(5) NOT NULL,
    [name] VARCHAR(50),
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcFloor_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcProv] (
    [country_id] CHAR(3) NOT NULL,
    [id] CHAR(2) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcProv_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcSubDistrict] (
    [district_id] CHAR(2) NOT NULL,
    [id] CHAR(2) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcSubDistrict_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[plcSubProv] (
    [Prov_id] CHAR(2) NOT NULL,
    [id] CHAR(2) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [plcSubProv_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysDept] (
    [Divs_id] CHAR(10) NOT NULL,
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysDept_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysSubDept] (
    [Dept_id] CHAR(10) NOT NULL,
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysSubDept_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysDivision] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysDivision_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
