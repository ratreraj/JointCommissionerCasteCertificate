USE [master]
GO
/****** Object:  Database [JointCommissionerCasteCertificate]    Script Date: 24-02-2022 12:05:42 ******/
CREATE DATABASE [JointCommissionerCasteCertificate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JointCommissionerCasteCertificate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JointCommissionerCasteCertificate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JointCommissionerCasteCertificate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JointCommissionerCasteCertificate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JointCommissionerCasteCertificate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ARITHABORT OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET RECOVERY FULL 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET  MULTI_USER 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JointCommissionerCasteCertificate', N'ON'
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET QUERY_STORE = OFF
GO
USE [JointCommissionerCasteCertificate]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicationStatuses]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationStatuses](
	[EntityTranstionId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [nvarchar](max) NULL,
	[Status] [varchar](20) NULL,
	[Remark] [varchar](500) NULL,
	[EntryBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_applicationStatuses] PRIMARY KEY CLUSTERED 
(
	[EntityTranstionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dDLMasters]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dDLMasters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValueFields] [nvarchar](max) NULL,
	[DisplayFields] [nvarchar](max) NULL,
	[Categroy] [nvarchar](max) NULL,
	[EntryBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dDLMasters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[DistictName] [nvarchar](max) NULL,
 CONSTRAINT [PK_districts] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[educations]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[educations](
	[AppId] [nvarchar](450) NOT NULL,
	[EntityTranstionId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationRecivedDate] [datetime] NOT NULL,
	[ApplicationName] [varchar](100) NULL,
	[CaseId] [varchar](25) NULL,
	[Village] [varchar](100) NULL,
	[Taluka] [varchar](100) NULL,
	[District] [varchar](100) NULL,
	[CasteCertificateDate] [datetime] NOT NULL,
	[CasteCertificateNumber] [varchar](25) NULL,
	[CasteCertificateIssuingAuthority] [varchar](100) NULL,
	[EducationType] [varchar](100) NULL,
	[PurpuseType] [varchar](100) NULL,
	[EntryBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_educations] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusMasters]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusMasters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EntryBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_statusMasters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[talukas]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[talukas](
	[TalukaId] [int] IDENTITY(1,1) NOT NULL,
	[TalukaName] [nvarchar](max) NULL,
	[DistrictID] [int] NOT NULL,
 CONSTRAINT [PK_talukas] PRIMARY KEY CLUSTERED 
(
	[TalukaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[villages]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[villages](
	[VillageId] [int] IDENTITY(1,1) NOT NULL,
	[VillageName] [nvarchar](max) NULL,
	[TalukaId] [int] NOT NULL,
	[DistrictID] [int] NOT NULL,
 CONSTRAINT [PK_villages] PRIMARY KEY CLUSTERED 
(
	[VillageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220223044458_intial', N'5.0.14')
GO
SET IDENTITY_INSERT [dbo].[applicationStatuses] ON 

INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [Status], [Remark], [EntryBy], [EntryDate]) VALUES (1, N'230222100001', N'DY', N'okay', 3, CAST(N'2022-02-23T11:07:04.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[applicationStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Administrator', N'Admin', N'Admin', N'8819969809')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Clerk', N'Clerk', N'Clerk', N'00000000000')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Dysp', N'Dysp', N'Dysp', N'00000000000')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'raj', N'Admin', N'Admin', N'ratre.raj@gmail.com', N'RATRE.RAJ@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJUUuLaKT8IFQihCrbscRIfUPfZwiF+4ho/DeBSqeqbc3RsZFyMl4cb+ZJiKddUmJA==', N'UU2MPJQ3YR26YE2UATBDNJJU7QBSA3II', N'3e7a02cf-5bfd-4700-b551-24ad9536443c', N'8819969809', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'raj', N'ClerkTest1', N'CLERKTEST1', N'ClerkTest1@gmail.com', N'CLERKTEST1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOCjPkrEGXDkpZ5c/s8Dhr6bCgT2ZnfkrJ3VJ5LWe77tc3mT8WcU5gfjTSX6+FScdQ==', N'YVC6ICXU7QJWKLIXYRRVZBX3EH4VDI57', N'bbb28040-ed8f-4054-844a-8d7c0d1f964e', N'8888888888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'Ram Kumar', N'DyspTest', N'DYSPTEST', N'demo@gmail.com', N'DEMO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFiAjbfem4xZKuZl3R809VQ+C6oWk1/kVY/vBS3s3eo9TO2vs3hYJhgpN2USMpZZ4g==', N'EGSOYMCDVY5OPVALPE37I27BCDHCI5NU', N'b410ccdb-4b12-4a80-8a5d-7d324c89627d', N'8888888888', 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[dDLMasters] ON 

INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (1, N'ED', N'Education', N'PURPOSETYPE', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (7, N'SR', N'Service
', N'PURPOSETYPE', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (8, N'PS', N'Pre service
', N'PURPOSETYPE', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (9, N'EL', N'Election
', N'PURPOSETYPE', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (10, N'OT', N'Other
', N'PURPOSETYPE', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (11, N'EI', N'Education 1', N'EDUCATION', 1, CAST(N'2022-02-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[dDLMasters] OFF
GO
SET IDENTITY_INSERT [dbo].[districts] ON 

INSERT [dbo].[districts] ([DistrictID], [DistictName]) VALUES (1, N'Ahmednagar ')
INSERT [dbo].[districts] ([DistrictID], [DistictName]) VALUES (2, N'Akola')
SET IDENTITY_INSERT [dbo].[districts] OFF
GO
SET IDENTITY_INSERT [dbo].[educations] ON 

INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [EducationType], [PurpuseType], [EntryBy], [EntryDate]) VALUES (N'230222100001', 1, CAST(N'2022-02-23T00:00:00.000' AS DateTime), N'Raj', N'1', N'1', N'3', N'1', CAST(N'2022-02-23T00:00:00.000' AS DateTime), N'10001', N'tests', N'EI', N'ED', 2, CAST(N'2022-02-23T11:06:58.123' AS DateTime))
SET IDENTITY_INSERT [dbo].[educations] OFF
GO
SET IDENTITY_INSERT [dbo].[statusMasters] ON 

INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (1, N'CK', N'Clerk Dashboard', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (3, N'DY', N'Dysp Dashbaord', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (4, N'OF', N'Officer Dashboard', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[statusMasters] OFF
GO
SET IDENTITY_INSERT [dbo].[talukas] ON 

INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (1, N'Akola ', 2)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (2, N'Akot', 2)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (3, N'Akole', 1)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (4, N'Shevgaon', 1)
SET IDENTITY_INSERT [dbo].[talukas] OFF
GO
SET IDENTITY_INSERT [dbo].[villages] ON 

INSERT [dbo].[villages] ([VillageId], [VillageName], [TalukaId], [DistrictID]) VALUES (1, N'Akole', 3, 1)
INSERT [dbo].[villages] ([VillageId], [VillageName], [TalukaId], [DistrictID]) VALUES (2, N'Agastinagar', 3, 1)
INSERT [dbo].[villages] ([VillageId], [VillageName], [TalukaId], [DistrictID]) VALUES (3, N'No Village', 2, 2)
SET IDENTITY_INSERT [dbo].[villages] OFF
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 24-02-2022 12:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24-02-2022 12:05:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 24-02-2022 12:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 24-02-2022 12:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 24-02-2022 12:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 24-02-2022 12:05:43 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 24-02-2022 12:05:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationId]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetApplicationId]
as
begin

Declare  @ApplicationId nvarchar(450)
Declare @cout int

select @cout=COUNT( AppId) from educations where CONVERT(varchar, EntryDate,103)=CONVERT(varchar, GETDATE(),103)
if(@cout=0)
begin
print '1'
SELECT  @ApplicationId= FORMAT(GETDATE(), 'ddMMyy')+'100001' 
select @ApplicationId as [ApplicationId]
 end 
 else
begin
print '2'

select  top 1 @ApplicationId= AppId  from educations where CONVERT(varchar, EntryDate,103)=CONVERT(varchar, GETDATE(),103) order by AppId
select @ApplicationId= FORMAT(GETDATE(), 'ddMMyy')+CAST( CAST( SUBSTRING(@ApplicationId  , 7, len(@ApplicationId)) as bigint)+1 as nvarchar) 
SELECT  @ApplicationId as  [ApplicationId]

end

end
GO
/****** Object:  StoredProcedure [dbo].[GetEducationById]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetEducationById]
@ApplicationId varchar(450)
As 
Begin
select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId, Village,Taluka,  District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
EducationType,  PurpuseType, 
s.Status , isnull(s.Remark,'') as Remark
from educations e 

inner join  applicationStatuses s on e.AppId=s.ApplicationId
where AppId=@ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[GetEducationDetails]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[GetEducationDetails]
@UserId int ,
@Status varchar(20)
as
Begin
select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId,v.VillageName as Village, t.TalukaName as Taluka, d.DistictName as District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
ed.DisplayFields as EducationType, pr.DisplayFields as PurpuseType, 
s.Status , isnull(s.Remark,'') as Remark
from educations e 
inner join  villages v on  e.Village=v.VillageId
inner join talukas t on  t.TalukaId=e.Taluka
inner join  districts d on d.DistrictID=e.District
inner join  dDLMasters ed on  e.EducationType=ed.ValueFields and ed.Categroy='EDUCATION'
inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
inner join  applicationStatuses s on e.AppId=s.ApplicationId
--where s.EntryBy=@UserId and s.Status=@Status

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationStatus]    Script Date: 24-02-2022 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateApplicationStatus]
@ApplicationId  varchar(450),
@Status varchar(20),
@Remark varchar(500),
@UserId int
AS
Begin

Update applicationStatuses set Status=@Status,Remark=@Remark,EntryBy=@UserId where  ApplicationId=@ApplicationId

END
GO
USE [master]
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET  READ_WRITE 
GO
