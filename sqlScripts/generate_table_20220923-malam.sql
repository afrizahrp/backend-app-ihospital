USE [backendDb]
GO

ALTER TABLE [dbo].[sysUserRole] DROP CONSTRAINT [sysUserRole_branch_id_fkey]
GO

ALTER TABLE [dbo].[sysUser] DROP CONSTRAINT [sysUser_branch_id_fkey]
GO

ALTER TABLE [dbo].[sysUser] DROP CONSTRAINT [fk_sys_user_role]
GO

ALTER TABLE [dbo].[sysSubDepartment] DROP CONSTRAINT [sysSubDepartment_id_fkey]
GO

ALTER TABLE [dbo].[sysDepartment] DROP CONSTRAINT [sysDepartment_division_id_fkey]
GO

ALTER TABLE [dbo].[sysBranch] DROP CONSTRAINT [sysBranch_company_id_fkey]
GO

ALTER TABLE [dbo].[plcSubProvince] DROP CONSTRAINT [plcSubProvince_province_id_fkey]
GO

ALTER TABLE [dbo].[plcSubDistrict] DROP CONSTRAINT [plcSubDistrict_district_id_fkey]
GO

ALTER TABLE [dbo].[plcProvince] DROP CONSTRAINT [plcProvince_country_id_fkey]
GO

ALTER TABLE [dbo].[plcDistrict] DROP CONSTRAINT [plcDistrict_subProvince_id_fkey]
GO

ALTER TABLE [dbo].[sysUserRole] DROP CONSTRAINT [sys_User_Role_createdAt_df]
GO

ALTER TABLE [dbo].[sysUser] DROP CONSTRAINT [sysUser_createdAt_df]
GO

ALTER TABLE [dbo].[sysSubDepartment] DROP CONSTRAINT [sysSubDepartment_createdAt_df]
GO

ALTER TABLE [dbo].[sysDivision] DROP CONSTRAINT [sysDivision_createdAt_df]
GO

ALTER TABLE [dbo].[sysDepartment] DROP CONSTRAINT [sysDepartment_createdAt_df]
GO

ALTER TABLE [dbo].[sysCounter] DROP CONSTRAINT [sysCounter_autoGenerate_df]
GO

ALTER TABLE [dbo].[sysCompany] DROP CONSTRAINT [sysCompany_updatedAt_df]
GO

ALTER TABLE [dbo].[sysCompany] DROP CONSTRAINT [sysCompany_createdAt_df]
GO

ALTER TABLE [dbo].[sysBranch] DROP CONSTRAINT [sysBranch_updatedAt_df]
GO

ALTER TABLE [dbo].[sysBranch] DROP CONSTRAINT [sysBranch_createdAt_df]
GO

ALTER TABLE [dbo].[plcSubProvince] DROP CONSTRAINT [plcSubProvince_createdAt_df]
GO

ALTER TABLE [dbo].[plcSubDistrict] DROP CONSTRAINT [plcSubDistrict_createdAt_df]
GO

ALTER TABLE [dbo].[plcProvince] DROP CONSTRAINT [plcProvince_createdAt_df]
GO

ALTER TABLE [dbo].[plcDistrict] DROP CONSTRAINT [plcDistrict_createdAt_df]
GO

ALTER TABLE [dbo].[plcCountry] DROP CONSTRAINT [plcCountry_createdAt_df]
GO

/****** Object:  Table [dbo].[tmpPatient]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmpPatient]') AND type in (N'U'))
DROP TABLE [dbo].[tmpPatient]
GO

/****** Object:  Table [dbo].[sysUserRole]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[sysUserRole]
GO

/****** Object:  Table [dbo].[sysUser]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysUser]') AND type in (N'U'))
DROP TABLE [dbo].[sysUser]
GO

/****** Object:  Table [dbo].[sysSubDepartment]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysSubDepartment]') AND type in (N'U'))
DROP TABLE [dbo].[sysSubDepartment]
GO

/****** Object:  Table [dbo].[sysDocId]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDocId]') AND type in (N'U'))
DROP TABLE [dbo].[sysDocId]
GO

/****** Object:  Table [dbo].[sysDivision]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDivision]') AND type in (N'U'))
DROP TABLE [dbo].[sysDivision]
GO

/****** Object:  Table [dbo].[sysDepartment]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysDepartment]') AND type in (N'U'))
DROP TABLE [dbo].[sysDepartment]
GO

/****** Object:  Table [dbo].[sysCounter]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysCounter]') AND type in (N'U'))
DROP TABLE [dbo].[sysCounter]
GO

/****** Object:  Table [dbo].[sysCompany]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysCompany]') AND type in (N'U'))
DROP TABLE [dbo].[sysCompany]
GO

/****** Object:  Table [dbo].[sysBranch]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysBranch]') AND type in (N'U'))
DROP TABLE [dbo].[sysBranch]
GO

/****** Object:  Table [dbo].[plcSubProvince]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcSubProvince]') AND type in (N'U'))
DROP TABLE [dbo].[plcSubProvince]
GO

/****** Object:  Table [dbo].[plcSubDistrict]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcSubDistrict]') AND type in (N'U'))
DROP TABLE [dbo].[plcSubDistrict]
GO

/****** Object:  Table [dbo].[plcProvince]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcProvince]') AND type in (N'U'))
DROP TABLE [dbo].[plcProvince]
GO

/****** Object:  Table [dbo].[plcDistrict]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcDistrict]') AND type in (N'U'))
DROP TABLE [dbo].[plcDistrict]
GO

/****** Object:  Table [dbo].[plcCountry]    Script Date: 23/09/2022 19.35.53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plcCountry]') AND type in (N'U'))
DROP TABLE [dbo].[plcCountry]
GO

/****** Object:  Table [dbo].[plcCountry]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[plcDistrict]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcDistrict](
	[subProvince_id] [char](2) NOT NULL,
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

/****** Object:  Table [dbo].[plcProvince]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcProvince](
	[country_id] [char](3) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcProvince_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[plcSubDistrict]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[plcSubProvince]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[plcSubProvince](
	[province_id] [char](2) NOT NULL,
	[id] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [plcSubProvince_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysBranch]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[sysCompany]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[sysCounter]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[sysDepartment]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysDepartment](
	[division_id] [char](10) NOT NULL,
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysDepartment_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysDivision]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysDivision](
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysDivision_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysDocId]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[sysSubDepartment]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysSubDepartment](
	[department_id] [char](10) NOT NULL,
	[id] [char](10) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[createdBy] [char](10) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedBy] [char](10) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[company_id] [char](5) NULL,
	[branch_id] [char](10) NOT NULL,
 CONSTRAINT [sysSubDepartment_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sysUser]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sysUser](
	[role_id] [char](20) NOT NULL,
	[id] [char](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
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

/****** Object:  Table [dbo].[sysUserRole]    Script Date: 23/09/2022 19.35.53 ******/
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

/****** Object:  Table [dbo].[tmpPatient]    Script Date: 23/09/2022 19.35.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tmpPatient](
	[id] [char](20) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [tmpPatient_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[plcCountry] ADD  CONSTRAINT [plcCountry_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcDistrict] ADD  CONSTRAINT [plcDistrict_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcProvince] ADD  CONSTRAINT [plcProvince_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcSubDistrict] ADD  CONSTRAINT [plcSubDistrict_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcSubProvince] ADD  CONSTRAINT [plcSubProvince_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
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

ALTER TABLE [dbo].[sysDepartment] ADD  CONSTRAINT [sysDepartment_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysDivision] ADD  CONSTRAINT [sysDivision_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysSubDepartment] ADD  CONSTRAINT [sysSubDepartment_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysUser] ADD  CONSTRAINT [sysUser_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[sysUserRole] ADD  CONSTRAINT [sys_User_Role_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

ALTER TABLE [dbo].[plcDistrict]  WITH CHECK ADD  CONSTRAINT [plcDistrict_subProvince_id_fkey] FOREIGN KEY([subProvince_id])
REFERENCES [dbo].[plcSubProvince] ([id])
GO

ALTER TABLE [dbo].[plcDistrict] CHECK CONSTRAINT [plcDistrict_subProvince_id_fkey]
GO

ALTER TABLE [dbo].[plcProvince]  WITH CHECK ADD  CONSTRAINT [plcProvince_country_id_fkey] FOREIGN KEY([country_id])
REFERENCES [dbo].[plcCountry] ([id])
GO

ALTER TABLE [dbo].[plcProvince] CHECK CONSTRAINT [plcProvince_country_id_fkey]
GO

ALTER TABLE [dbo].[plcSubDistrict]  WITH CHECK ADD  CONSTRAINT [plcSubDistrict_district_id_fkey] FOREIGN KEY([district_id])
REFERENCES [dbo].[plcDistrict] ([id])
GO

ALTER TABLE [dbo].[plcSubDistrict] CHECK CONSTRAINT [plcSubDistrict_district_id_fkey]
GO

ALTER TABLE [dbo].[plcSubProvince]  WITH CHECK ADD  CONSTRAINT [plcSubProvince_province_id_fkey] FOREIGN KEY([province_id])
REFERENCES [dbo].[plcProvince] ([id])
GO

ALTER TABLE [dbo].[plcSubProvince] CHECK CONSTRAINT [plcSubProvince_province_id_fkey]
GO

ALTER TABLE [dbo].[sysBranch]  WITH CHECK ADD  CONSTRAINT [sysBranch_company_id_fkey] FOREIGN KEY([company_id])
REFERENCES [dbo].[sysCompany] ([id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[sysBranch] CHECK CONSTRAINT [sysBranch_company_id_fkey]
GO

ALTER TABLE [dbo].[sysDepartment]  WITH CHECK ADD  CONSTRAINT [sysDepartment_division_id_fkey] FOREIGN KEY([division_id])
REFERENCES [dbo].[sysDivision] ([id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[sysDepartment] CHECK CONSTRAINT [sysDepartment_division_id_fkey]
GO

ALTER TABLE [dbo].[sysSubDepartment]  WITH CHECK ADD  CONSTRAINT [sysSubDepartment_id_fkey] FOREIGN KEY([department_id])
REFERENCES [dbo].[sysDepartment] ([id])
GO

ALTER TABLE [dbo].[sysSubDepartment] CHECK CONSTRAINT [sysSubDepartment_id_fkey]
GO

ALTER TABLE [dbo].[sysUser]  WITH CHECK ADD  CONSTRAINT [fk_sys_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[sysUserRole] ([id])
GO

ALTER TABLE [dbo].[sysUser] CHECK CONSTRAINT [fk_sys_user_role]
GO

ALTER TABLE [dbo].[sysUser]  WITH CHECK ADD  CONSTRAINT [sysUser_branch_id_fkey] FOREIGN KEY([branch_id])
REFERENCES [dbo].[sysBranch] ([id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[sysUser] CHECK CONSTRAINT [sysUser_branch_id_fkey]
GO

ALTER TABLE [dbo].[sysUserRole]  WITH CHECK ADD  CONSTRAINT [sysUserRole_branch_id_fkey] FOREIGN KEY([branch_id])
REFERENCES [dbo].[sysBranch] ([id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[sysUserRole] CHECK CONSTRAINT [sysUserRole_branch_id_fkey]
GO


