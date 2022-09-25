USE [backendDb]
GO



/****** Object:  Table [dbo].[sysUserRole]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[sysUserRole]
GO

/****** Object:  Table [dbo].[sysUser]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysUser]') AND type in (N'U'))
DROP TABLE [dbo].[sysUser]
GO

/****** Object:  Table [dbo].[sysSubDept]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysSubDept]') AND type in (N'U'))
DROP TABLE [dbo].[sysSubDept]
GO

/****** Object:  Table [dbo].[sysDocId]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDocId]') AND type in (N'U'))
DROP TABLE [dbo].[sysDocId]
GO

/****** Object:  Table [dbo].[sysDivs]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDivs]') AND type in (N'U'))
DROP TABLE [dbo].[sysDivs]
GO

/****** Object:  Table [dbo].[sysDept]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDept]') AND type in (N'U'))
DROP TABLE [dbo].[sysDept]
GO

/****** Object:  Table [dbo].[sysCounter]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysCounter]') AND type in (N'U'))
DROP TABLE [dbo].[sysCounter]
GO

/****** Object:  Table [dbo].[sysCompany]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysCompany]') AND type in (N'U'))
DROP TABLE [dbo].[sysCompany]
GO

/****** Object:  Table [dbo].[sysBranch]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysBranch]') AND type in (N'U'))
DROP TABLE [dbo].[sysBranch]
GO

/****** Object:  Table [dbo].[plcSubProv]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcSubProv]') AND type in (N'U'))
DROP TABLE [dbo].[plcSubProv]
GO

/****** Object:  Table [dbo].[plcSubDistrict]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcSubDistrict]') AND type in (N'U'))
DROP TABLE [dbo].[plcSubDistrict]
GO

/****** Object:  Table [dbo].[plcProv]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcProv]') AND type in (N'U'))
DROP TABLE [dbo].[plcProv]
GO

/****** Object:  Table [dbo].[plcFloor]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcFloor]') AND type in (N'U'))
DROP TABLE [dbo].[plcFloor]
GO

/****** Object:  Table [dbo].[plcDistrict]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcDistrict]') AND type in (N'U'))
DROP TABLE [dbo].[plcDistrict]
GO

/****** Object:  Table [dbo].[plcDirection]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcDirection]') AND type in (N'U'))
DROP TABLE [dbo].[plcDirection]
GO

/****** Object:  Table [dbo].[plcCountry]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcCountry]') AND type in (N'U'))
DROP TABLE [dbo].[plcCountry]
GO

/****** Object:  Table [dbo].[iCtUom]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iCtUom]') AND type in (N'U'))
DROP TABLE [dbo].[iCtUom]
GO

/****** Object:  Table [dbo].[hosRegistration]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosRegistration]') AND type in (N'U'))
DROP TABLE [dbo].[hosRegistration]
GO

/****** Object:  Table [dbo].[hosPatientCheckHdr]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosPatientCheckHdr]') AND type in (N'U'))
DROP TABLE [dbo].[hosPatientCheckHdr]
GO

/****** Object:  Table [dbo].[hosPatientCheckDtl]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosPatientCheckDtl]') AND type in (N'U'))
DROP TABLE [dbo].[hosPatientCheckDtl]
GO

/****** Object:  Table [dbo].[hosPatientCaseHdr]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosPatientCaseHdr]') AND type in (N'U'))
DROP TABLE [dbo].[hosPatientCaseHdr]
GO

/****** Object:  Table [dbo].[hosPatientCaseDtl]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosPatientCaseDtl]') AND type in (N'U'))
DROP TABLE [dbo].[hosPatientCaseDtl]
GO

/****** Object:  Table [dbo].[hosPatient]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosPatient]') AND type in (N'U'))
DROP TABLE [dbo].[hosPatient]
GO

/****** Object:  Table [dbo].[hosCheckSpecPrs]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosCheckSpecPrs]') AND type in (N'U'))
DROP TABLE [dbo].[hosCheckSpecPrs]
GO

/****** Object:  Table [dbo].[hosCheckSpecHdr]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosCheckSpecHdr]') AND type in (N'U'))
DROP TABLE [dbo].[hosCheckSpecHdr]
GO

/****** Object:  Table [dbo].[hosCheckSpecDtl]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosCheckSpecDtl]') AND type in (N'U'))
DROP TABLE [dbo].[hosCheckSpecDtl]
GO

/****** Object:  Table [dbo].[hosCheckSpecDev]    Script Date: 25/09/2022 11.40.30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[hosCheckSpecDev]') AND type in (N'U'))
DROP TABLE [dbo].[hosCheckSpecDev]
GO

/****** Object:  Table [dbo].[hosCheckSpecDev]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosCheckSpecDev](
	[id] [char](10) NOT NULL,
	[seqNo] [tinyint] IDENTITY(1,1) NOT NULL,
	[device_id] [char](20) NOT NULL,
	[deviceName] [varchar](50) NOT NULL,
	[qty] [varchar](50) NOT NULL,
	[Uom] [decimal](9, 6) NOT NULL,
	[baseAmt] [numeric](22, 0) NOT NULL,
	[addAmt] [numeric](22, 0) NOT NULL,
	[discAmt] [numeric](22, 0) NOT NULL,
	[trxAmt] [numeric](22, 0) NOT NULL,
	[remarks] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosCheckSpecDev_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosCheckSpecDtl]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosCheckSpecDtl](
	[seqNo] [tinyint] IDENTITY(1,1) NOT NULL,
	[id] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[botValue] [decimal](9, 6) NOT NULL,
	[botValUom] [decimal](9, 6) NOT NULL,
	[midValue] [decimal](9, 6) NOT NULL,
	[midValUom] [decimal](9, 6) NOT NULL,
	[topValue] [decimal](9, 6) NOT NULL,
	[topValUom] [decimal](9, 6) NOT NULL,
	[baseAmt] [numeric](22, 0) NOT NULL,
	[addAmt] [numeric](22, 0) NOT NULL,
	[discAmt] [numeric](22, 0) NOT NULL,
	[trxAmt] [numeric](22, 0) NOT NULL,
	[remarks] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosCheckSpecDtl_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosCheckSpecHdr]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosCheckSpecHdr](
	[id] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[remark] [varchar](100) NOT NULL,
	[baseAmt] [numeric](22, 0) NOT NULL,
	[addAmt] [numeric](22, 0) NOT NULL,
	[discAmt] [numeric](22, 0) NOT NULL,
	[trxAmt] [numeric](22, 0) NOT NULL,
	[remarks] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosCheckSpecHd_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosCheckSpecPrs]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosCheckSpecPrs](
	[id] [char](10) NOT NULL,
	[seqNo] [tinyint] IDENTITY(1,1) NOT NULL,
	[subDept_id] [char](10) NOT NULL,
	[subDeptName] [char](10) NOT NULL,
	[leader] [bit] NOT NULL,
	[emp_id] [char](20) NOT NULL,
	[empName] [varchar](50) NOT NULL,
	[rateAmt] [decimal](18, 0) NOT NULL,
	[baseAmt] [numeric](22, 0) NOT NULL,
	[addAmt] [numeric](22, 0) NOT NULL,
	[discAmt] [numeric](22, 0) NOT NULL,
	[trxAmt] [numeric](22, 0) NOT NULL,
	[remarks] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosCheckSpecPrs_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosPatient]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosPatient](
	[id] [char](20) NOT NULL,
	[nickname] [varchar](30) NOT NULL,
	[fullname] [varchar](50) NOT NULL,
	[birthdate] [date] NOT NULL,
	[age]  AS (datediff(hour,[birthdate],getdate())/(8766.0)),
	[gender] [tinyint] NOT NULL,
	[bloodType] [varchar](5) NOT NULL,
	[country_id] [char](3) NOT NULL,
	[Prov_id] [char](2) NOT NULL,
	[Prov_name] [varchar](50) NOT NULL,
	[subProv_id] [char](2) NOT NULL,
	[subProv_name] [varchar](50) NOT NULL,
	[district_id] [char](2) NOT NULL,
	[district_name] [varchar](50) NOT NULL,
	[subdistrict_id] [char](2) NOT NULL,
	[address] [varchar](80) NOT NULL,
	[mobileNo1] [varchar](20) NOT NULL,
	[mobileNo2] [varchar](20) NOT NULL,
	[phoneNo] [varchar](15) NOT NULL,
	[email] [varchar](80) NULL,
	[activity] [varchar](50) NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosPatient_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosPatientCaseDtl]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosPatientCaseDtl](
	[id] [char](20) NOT NULL,
	[seqNo] [tinyint] IDENTITY(1,1) NOT NULL,
	[symptoms] [varchar](500) NOT NULL,
	[medicine_id] [char](20) NOT NULL,
	[medicineName] [varchar](50) NOT NULL,
	[doses] [tinyint] NOT NULL,
	[qty] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosPatientCaseDtl_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosPatientCaseHdr]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosPatientCaseHdr](
	[registry_id] [char](20) NOT NULL,
	[patient_id] [char](20) NOT NULL,
	[patientName] [varchar](50) NOT NULL,
	[doctor_id] [char](15) NOT NULL,
	[doctorName] [varchar](50) NOT NULL,
	[id] [char](20) NOT NULL,
	[descriptions] [varchar](100) NULL,
	[caseDate] [datetime] NOT NULL,
	[isRefered] [bit] NOT NULL,
	[isPatientOk] [tinyint] NULL,
	[referedDate] [date] NOT NULL,
	[referedTo] [tinyint] NOT NULL,
	[hospitalName] [varchar](20) NOT NULL,
	[poly_id] [char](10) NOT NULL,
	[polyName] [varchar](50) NOT NULL,
	[baseAmt] [numeric](22, 0) NULL,
	[addedAmt] [numeric](22, 0) NULL,
	[discAmt] [numeric](22, 0) NULL,
	[trxAmt] [numeric](22, 0) NULL,
	[status] [tinyint] NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
	[symptom] [varchar](200) NULL,
	[firstDiag] [varchar](200) NULL,
 CONSTRAINT [hosPatientCaseHdr_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosPatientCheckDtl]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosPatientCheckDtl](
	[seqNo] [tinyint] IDENTITY(1,1) NOT NULL,
	[id] [char](20) NOT NULL,
	[checkType] [char](3) NOT NULL,
	[name] [varchar](50) NULL,
	[value] [decimal](9, 6) NULL,
	[uom] [char](5) NULL,
	[valueIndicator] [char](10) NULL,
	[remarks] [varchar](100) NULL,
	[baseAmt] [numeric](22, 0) NULL,
	[addedAmt] [numeric](22, 0) NULL,
	[discAmt] [numeric](22, 0) NULL,
	[trxAmt] [numeric](22, 0) NULL,
	[status] [tinyint] NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosPatientCheckDtl_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seqNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosPatientCheckHdr]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosPatientCheckHdr](
	[trxType] [char](3) NOT NULL,
	[case_id] [char](20) NOT NULL,
	[patient_id] [char](20) NOT NULL,
	[patientName] [varchar](50) NOT NULL,	
	[Doctor_id] [char](15) NOT NULL,
	[DoctorName] [varchar](50) NOT NULL,
	[id] [char](20) NOT NULL,
	[reff_id] char(20) NOT NULL,
	[SeqNo] tinyInt NOT NULL,
	[description] [varchar](100) NOT NULL,
	[checkDate] [datetime] NOT NULL,
	[resultByValue] [decimal](18, 6) NOT NULL,
	[resultByWords] [varchar](50) NOT NULL,
	[remarks] [varchar](200) NOT NULL,
	[recommendation] [varchar](100) NOT NULL,
	[schedule_id]char(20) NOT NULL, 
	[scheduleN]tinyint NOT NULL,
	[status] [tinyint] NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosPatientCheckHdr_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hosRegistration]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hosRegistration](
	[trxType] [char](3) NOT NULL,
	[appointment_id] [char](20) NOT NULL,
	[id] [char](20) NOT NULL,
	[registryDate] [date] NOT NULL,
	[patient_id] [char](20) NOT NULL,
	[patientName] [char](20) NOT NULL,
	[tax_id] [char](2) NOT NULL,
	[baseAmt] [numeric](22, 0) NOT NULL,
	[discAmt] [numeric](22, 0) NOT NULL,
	[taxAmt] [numeric](22, 0) NOT NULL,
	[trxAmt] [numeric](22, 0) NOT NULL,
	[payType] [tinyint] NOT NULL,
	[pay_id] [varchar](20) NULL,
	[status] [tinyint] NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [hosRegistrationHdr_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[iCtUom]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[iCtUom](
	[id] [char](5) NOT NULL,
	[name] [varchar](50) NULL,
	[remarks] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [PK_iCtUom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcCountry]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcCountry](
	[id] [char](3) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcCountry_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcDirection]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcDirection](
	[id] [char](10) NOT NULL,
	[name] [varchar](50) NULL,
	[direction] [varchar](100) NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [PK_plcDirection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcDistrict]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcDistrict](
	[subProv_id] [char](2) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcDistrict_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcFloor]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcFloor](
	[direction_id] [char](10) NOT NULL,
	[id] [char](5) NOT NULL,
	[name] [varchar](50) NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [PK_BuildingFloors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcProv]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcProv](
	[country_id] [char](3) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcProv_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcSubDistrict]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcSubDistrict](
	[district_id] [char](2) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcSubDistrict_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcSubProv]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcSubProv](
	[Prov_id] [char](2) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcSubProv_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysBranch]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysBranch](
	[id] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contactPerson] [varchar](50) NOT NULL,
	[contactPhone] [varchar](20) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NOT NULL,
 CONSTRAINT [sysBranch_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysCompany]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysCompany](
	[id] [char](5) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [sysCompany_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysCounter]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysCounter](
	[module_id] [char](3) NOT NULL,
	[counter_id] [char](3) NOT NULL,
	[lastCounter] [int] NOT NULL,
	[description] [varchar](160) NOT NULL,
	[pattern] [char](30) NOT NULL,
	[combiner] [char](20) NOT NULL,
	[refreshAt] [char](1) NOT NULL,
	[firstChar] [char](4) NOT NULL,
	[secondChar] [char](4) NOT NULL,
	[digits] [int] NOT NULL,
	[startYear] [char](4) NOT NULL,
	[startMonth] [char](2) NOT NULL,
	[startCount] [int] NOT NULL,
	[recounter] [int] NOT NULL,
	[autoGenerate] [bit] NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NOT NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysCounter_pkey] PRIMARY KEY CLUSTERED 
(
	[counter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysDept]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysDept](
	[Divs_id] [char](10) NOT NULL,
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysDept_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysDivs]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysDivs](
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysDivs_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysDocId]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysDocId](
	[module_id] [char](3) NOT NULL,
	[prefix_id] [char](3) NOT NULL,
	[doc_id] [char](20) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NOT NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysDocId_pkey] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysSubDept]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysSubDept](
	[Dept_id] [char](10) NOT NULL,
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysSubDept_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysUser]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysUser](
	[role_id] [char](20) NOT NULL,
	[id] [char](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[password] [nvarchar](1000) NOT NULL,
	[tokenForAccess] [nvarchar](1000) NOT NULL,
	[isLoggedIn] [bit] NOT NULL,
	[tokenHasRefreshed] [nvarchar](1000) NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NOT NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysUser_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [sysUser_email_key] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysUserRole]    Script Date: 25/09/2022 11.40.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysUserRole](
	[id] [char](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sys_User_role_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [sys_user_role_key] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ('') FOR [qty]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ('') FOR [Uom]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ((0)) FOR [baseAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ((0)) FOR [addAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ((0)) FOR [discAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ((0)) FOR [trxAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  DEFAULT ((0)) FOR [remarks]
GO

ALTER TABLE [dbo].[hosCheckSpecDev] ADD  CONSTRAINT [hosCheckSpecDev_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [botValue]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ('') FOR [botValUom]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [midValue]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ('') FOR [midValUom]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [topValue]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ('') FOR [topValUom]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [baseAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [addAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [discAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [trxAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  DEFAULT ((0)) FOR [remarks]
GO

ALTER TABLE [dbo].[hosCheckSpecDtl] ADD  CONSTRAINT [hosCheckSpecDtl_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ('') FOR [remark]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ((0)) FOR [baseAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ((0)) FOR [addAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ((0)) FOR [discAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ((0)) FOR [trxAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ((0)) FOR [remarks]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ('') FOR [createdBy]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  CONSTRAINT [hosCheckSpecHdr_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosCheckSpecHdr] ADD  DEFAULT ('') FOR [updatedBy]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ('') FOR [rateAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ((0)) FOR [baseAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ((0)) FOR [addAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ((0)) FOR [discAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ((0)) FOR [trxAmt]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  DEFAULT ((0)) FOR [remarks]
GO

ALTER TABLE [dbo].[hosCheckSpecPrs] ADD  CONSTRAINT [hosCheckSpecPrs_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  DEFAULT ('') FOR [symptoms]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  DEFAULT ('') FOR [medicine_id]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  DEFAULT ((0)) FOR [doses]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  DEFAULT ((0)) FOR [qty]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  DEFAULT ((0)) FOR [status]
GO

ALTER TABLE [dbo].[hosPatientCaseDtl] ADD  CONSTRAINT [hosPatientCaseDtl_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ('') FOR [descriptions]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ('') FOR [hospitalName]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ((0)) FOR [baseAmt]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ((0)) FOR [addedAmt]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ((0)) FOR [discAmt]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ((0)) FOR [trxAmt]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  DEFAULT ((0)) FOR [status]
GO

ALTER TABLE [dbo].[hosPatientCaseHdr] ADD  CONSTRAINT [hosPatientCaseHdr_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[hosRegistration] ADD  CONSTRAINT [hosRegistrationHdr_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[iCtUom] ADD  DEFAULT ('') FOR [remarks]
GO

ALTER TABLE [dbo].[plcCountry] ADD  CONSTRAINT [plcCountry_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcDistrict] ADD  CONSTRAINT [plcDistrict_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcFloor] ADD  DEFAULT (getdate()) FOR [updatedBy]
GO

ALTER TABLE [dbo].[plcProv] ADD  CONSTRAINT [plcProv_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcSubDistrict] ADD  CONSTRAINT [plcSubDistrict_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcSubProv] ADD  CONSTRAINT [plcSubProv_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysBranch] ADD  CONSTRAINT [sysBranch_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysBranch] ADD  CONSTRAINT [sysBranch_updatedAt_df]  DEFAULT (getdate()) FOR [updatedAt]
GO

ALTER TABLE [dbo].[sysCompany] ADD  CONSTRAINT [sysCompany_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysCompany] ADD  CONSTRAINT [sysCompany_updatedAt_df]  DEFAULT (getdate()) FOR [updatedAt]
GO

ALTER TABLE [dbo].[sysCounter] ADD  CONSTRAINT [sysCounter_autoGenerate_df]  DEFAULT ((0)) FOR [autoGenerate]
GO

ALTER TABLE [dbo].[sysDept] ADD  CONSTRAINT [sysDept_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysDivs] ADD  CONSTRAINT [sysDivs_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysSubDept] ADD  CONSTRAINT [sysSubDept_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysUser] ADD  CONSTRAINT [sysUser_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysUserRole] ADD  CONSTRAINT [sys_User_Role_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO


