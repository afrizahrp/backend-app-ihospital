CREATE TABLE hosPatient (
id					char(20) NOT NULL,
nickname			varchar(30)NOT NULL,
fullname			varchar(50)NOT NULL,
birthdate			date NOT NULL,
gender				tinyint NOT NULL,
bloodTyoe			varchar(5)NOT NULL,
country_id			char(3)NOT NULL,
province_id			char(2)NOT NULL,
province_name		varchar(50)NOT NULL,
subProvince_id		char(2)NOT NULL,
subProvince_name	varchar(50)NOT NULL,
district_id			char(2)NOT NULL,
district_name		varchar(50)NOT NULL,
subdistrict_id		char(2)NOT NULL,
address				varchar(80)NOT NULL,
mobileNo1			varchar(20)NOT NULL,
mobileNo2			varchar(20)NOT NULL,
phoneNo				varchar(15)NOT NULL,
Activity			varchar(50),	
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

ALTER TABLE [dbo].[hosPatient] ADD  CONSTRAINT [hosPatient_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO

--ALTER TABLE [dbo].[plcProvince]  WITH CHECK ADD  CONSTRAINT [hosPatient_id_fkey] FOREIGN KEY([country_id])
--REFERENCES [dbo].[plcCountry] ([id])
--GO

--ALTER TABLE [dbo].[plcProvince] CHECK CONSTRAINT [plcProvince_country_id_fkey]
--GO

