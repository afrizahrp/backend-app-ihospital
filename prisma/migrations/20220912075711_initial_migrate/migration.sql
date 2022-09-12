BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[sysCompany] (
    [id] CHAR(5) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sysCompany_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL CONSTRAINT [sysCompany_updatedAt_df] DEFAULT CURRENT_TIMESTAMP,
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
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sysBranch_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL CONSTRAINT [sysBranch_updatedAt_df] DEFAULT CURRENT_TIMESTAMP,
    [company_id] CHAR(5) NOT NULL,
    CONSTRAINT [sysBranch_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysCounter] (
    [module_id] CHAR(3) NOT NULL,
    [counter_id] CHAR(3) NOT NULL,
    [lastCounter] INT NOT NULL,
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
    CONSTRAINT [sysCounter_pkey] PRIMARY KEY CLUSTERED ([counter_id])
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
    [isAdmin] BIT NOT NULL,
    [id] CHAR(20) NOT NULL,
    [name] VARCHAR(50) NOT NULL,
    [email] VARCHAR(30) NOT NULL,
    [phone] VARCHAR(20) NOT NULL,
    [password] VARCHAR(255) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sysUser_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
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
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sys_User_Role_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sys_User_role_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [sys_user_role_key] UNIQUE NONCLUSTERED ([name])
);

-- CreateTable
CREATE TABLE [dbo].[tmpPatient] (
    [id] CHAR(20) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    CONSTRAINT [tmpPatient_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysDivision] (
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sysDivision_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysDivision_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sysDepartment] (
    [division_id] CHAR(10) NOT NULL,
    [id] CHAR(10) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [sysDepartment_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL,
    [company_id] CHAR(5),
    [branch_id] CHAR(10) NOT NULL,
    CONSTRAINT [sysDepartment_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- AddForeignKey
ALTER TABLE [dbo].[sysBranch] ADD CONSTRAINT [sysBranch_company_id_fkey] FOREIGN KEY ([company_id]) REFERENCES [dbo].[sysCompany]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sysUser] ADD CONSTRAINT [sysUser_branch_id_fkey] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[sysBranch]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sysUser] ADD CONSTRAINT [fk_sys_user_role] FOREIGN KEY ([role_id]) REFERENCES [dbo].[sysUserRole]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[sysUserRole] ADD CONSTRAINT [sysUserRole_branch_id_fkey] FOREIGN KEY ([branch_id]) REFERENCES [dbo].[sysBranch]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sysDepartment] ADD CONSTRAINT [sysDepartment_division_id_fkey] FOREIGN KEY ([division_id]) REFERENCES [dbo].[sysDivision]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
