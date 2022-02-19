IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [AspNetRoles] (
    [Id] int NOT NULL IDENTITY,
    [Description] nvarchar(max) NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [AspNetUsers] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [educations] (
    [ApplicationId] int NOT NULL IDENTITY,
    [ApplicationRecivedDate] DateTime NOT NULL,
    [ApplicationName] Varchar(100) NULL,
    [CaseId] Varchar(25) NULL,
    [Village] Varchar(100) NULL,
    [Taluka] Varchar(100) NULL,
    [District] Varchar(100) NULL,
    [CasteCertificateDate] DateTime NOT NULL,
    [CasteCertificateNumber] Varchar(25) NULL,
    [CasteCertificateIssuingAuthority] Varchar(100) NULL,
    [EducationType] Varchar(100) NULL,
    CONSTRAINT [PK_educations] PRIMARY KEY ([ApplicationId])
);
GO

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] int NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] int NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserRoles] (
    [UserId] int NOT NULL,
    [RoleId] int NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserTokens] (
    [UserId] int NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
GO

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220213164533_intial', N'5.0.14');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [educations] ADD [EntryBy] int NOT NULL DEFAULT 0;
GO

ALTER TABLE [educations] ADD [EntryDate] DateTime NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
GO

ALTER TABLE [educations] ADD [PurpuseType] Varchar(100) NULL;
GO

CREATE TABLE [applicationStatuses] (
    [EntityTranstionId] int NOT NULL IDENTITY,
    [ApplicationId] int NOT NULL,
    [Status] Varchar(20) NULL,
    [EntryBy] int NOT NULL,
    [EntryDate] DateTime NOT NULL,
    CONSTRAINT [PK_applicationStatuses] PRIMARY KEY ([EntityTranstionId])
);
GO

CREATE TABLE [dDLMasters] (
    [Id] int NOT NULL IDENTITY,
    [ValueFields] nvarchar(max) NULL,
    [DisplayFields] nvarchar(max) NULL,
    [Categroy] nvarchar(max) NULL,
    [EntryBy] int NOT NULL,
    [EntryDate] DateTime NOT NULL,
    CONSTRAINT [PK_dDLMasters] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [districts] (
    [DistrictID] int NOT NULL IDENTITY,
    [DistictName] nvarchar(max) NULL,
    CONSTRAINT [PK_districts] PRIMARY KEY ([DistrictID])
);
GO

CREATE TABLE [statusMasters] (
    [Id] int NOT NULL IDENTITY,
    [Status] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [EntryBy] int NOT NULL,
    [EntryDate] DateTime NOT NULL,
    CONSTRAINT [PK_statusMasters] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [talukas] (
    [TalukaId] int NOT NULL IDENTITY,
    [TalukaName] nvarchar(max) NULL,
    [DistrictID] int NOT NULL,
    CONSTRAINT [PK_talukas] PRIMARY KEY ([TalukaId])
);
GO

CREATE TABLE [villages] (
    [VillageId] int NOT NULL IDENTITY,
    [VillageName] nvarchar(max) NULL,
    [TalukaId] int NOT NULL,
    [DistrictID] int NOT NULL,
    CONSTRAINT [PK_villages] PRIMARY KEY ([VillageId])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20220218130212_intial01234', N'5.0.14');
GO

COMMIT;
GO

