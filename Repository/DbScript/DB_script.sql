USE [master]
GO
/****** Object:  Database [JointCommissionerCasteCertificate]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[actionStatus]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actionStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentStatus] [varchar](20) NULL,
	[NextStatus] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[Direction] [varchar](20) NULL,
	[RoleId] [int] NOT NULL,
	[NextRoleId] [int] NOT NULL,
 CONSTRAINT [PK_actionStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicationStatuses]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationStatuses](
	[EntityTranstionId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [nvarchar](max) NULL,
	[CurrentStatus] [varchar](20) NULL,
	[CurrentDate] [datetime] NOT NULL,
	[PerviousStatus] [varchar](20) NULL,
	[PerviousDate] [datetime] NOT NULL,
	[Remark] [varchar](500) NULL,
	[EntryBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_applicationStatuses] PRIMARY KEY CLUSTERED 
(
	[EntityTranstionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[dashboardSetting]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dashboardSetting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK_dashboardSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dDLMasters]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[districts]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[educations]    Script Date: 18-04-2022 09:10:22 ******/
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
	[CasteCertificateDate] [datetime] NULL,
	[CasteCertificateNumber] [varchar](25) NULL,
	[CasteCertificateIssuingAuthority] [varchar](100) NULL,
	[ServiceType] [varchar](100) NULL,
	[PurpuseType] [varchar](100) NULL,
	[Post] [varchar](50) NULL,
	[Rank] [varchar](50) NULL,
	[OfficerName] [varchar](100) NULL,
	[CourtConttept] [varchar](250) NULL,
	[Tribe] [varchar](100) NULL,
	[ComplainerName] [varchar](100) NULL,
	[RespondentName] [varchar](100) NULL,
	[Evidence] [varchar](250) NULL,
	[EntryBy] [int] NULL,
	[EntryDate] [datetime] NULL,
	[VCCompltedDate] [datetime] NULL,
	[HearingDate] [datetime] NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_educations] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusHistory]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusHistory](
	[EntityTranstionId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [nvarchar](max) NULL,
	[EntityTranstionIdFk] [int] NOT NULL,
	[CurrentStatus] [varchar](20) NULL,
	[CurrentDate] [datetime] NOT NULL,
	[PerviousStatus] [varchar](20) NULL,
	[PerviousDate] [datetime] NOT NULL,
	[Remark] [varchar](500) NULL,
	[EntryBy] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_statusHistory] PRIMARY KEY CLUSTERED 
(
	[EntityTranstionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusMasters]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[talukas]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  Table [dbo].[villages]    Script Date: 18-04-2022 09:10:22 ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220410083225_intial', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220410152051_intial001', N'5.0.14')
GO
SET IDENTITY_INSERT [dbo].[actionStatus] ON 

INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (1, N'CK', N'OF', N'Clerck->Officer', N'Forrword', 2, 4)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (2, N'OF', N'DY', N'Officer ->Dysp ', N'Forrword', 4, 3)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (4, N'OF', N'CK', N'Officer -> Clerck', N'Backword', 4, 2)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (5, N'DY', N'PI', N'Dysp -> PI', N'Forrword', 3, 5)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (6, N'DY', N'OF', N'Dysp -> Officer', N'Backword', 3, 4)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (7, N'PI', N'DY', N'PI -> Dysp ', N'Backword', 5, 3)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (8, N'CT', N'OF', N'Court -> Officer ', N'Backword', 6, 4)
INSERT [dbo].[actionStatus] ([ID], [CurrentStatus], [NextStatus], [Description], [Direction], [RoleId], [NextRoleId]) VALUES (9, N'OF', N'CT', N'Officer -> Court', N'Forrword', 4, 6)
SET IDENTITY_INSERT [dbo].[actionStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[applicationStatuses] ON 

INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (1, N'100422100001', N'DY', CAST(N'2022-04-12T19:23:32.430' AS DateTime), N'PI', CAST(N'2022-04-12T19:17:17.153' AS DateTime), N'approved', 2, 3, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (2, N'110422100001', N'CT', CAST(N'2022-04-12T19:40:23.187' AS DateTime), N'OF', CAST(N'2022-04-12T19:11:10.530' AS DateTime), N'test', 2, 5, CAST(N'2022-04-11T09:47:54.950' AS DateTime))
INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (3, N'120422100002', N'PI', CAST(N'2022-04-12T19:47:31.390' AS DateTime), N'DY', CAST(N'2022-04-12T19:44:03.263' AS DateTime), N'okay', 2, 4, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (4, N'120422100003', N'CT', CAST(N'2022-04-12T19:34:15.393' AS DateTime), N'OF', CAST(N'2022-04-12T19:10:31.253' AS DateTime), N'test', 2, 0, CAST(N'2022-04-12T19:01:41.107' AS DateTime))
INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (5, N'120422100004', N'DY', CAST(N'2022-04-12T19:26:38.717' AS DateTime), N'PI', CAST(N'2022-04-12T19:17:31.300' AS DateTime), N'approved', 2, 3, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[applicationStatuses] ([EntityTranstionId], [ApplicationId], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [UpdatedBy], [EntryDate]) VALUES (6, N'170422100001', N'OF', CAST(N'2022-04-17T22:20:32.950' AS DateTime), N'CK', CAST(N'2022-04-17T21:36:53.950' AS DateTime), N'okay', 2, 6, CAST(N'2022-04-17T21:36:53.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[applicationStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Administrator', N'Admin', N'Admin', N'8819969809')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Clerk', N'Clerk', N'Clerk', N'00000000000')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Dysp', N'Dysp', N'Dysp', N'00000000000')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (4, N'Officer', N'Officer', N'Officer', N'00000000000')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (5, N'PI', N'PI', N'PI', N'00000000000')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (6, N'Court', N'Court', N'Court', N'00000000000')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (5, 6)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'raj', N'Admin', N'Admin', N'ratre.raj@gmail.com', N'RATRE.RAJ@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEJUUuLaKT8IFQihCrbscRIfUPfZwiF+4ho/DeBSqeqbc3RsZFyMl4cb+ZJiKddUmJA==', N'UU2MPJQ3YR26YE2UATBDNJJU7QBSA3II', N'3e7a02cf-5bfd-4700-b551-24ad9536443c', N'8819969809', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'raj', N'ClerkTest1', N'CLERKTEST1', N'ClerkTest1@gmail.com', N'CLERKTEST1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOCjPkrEGXDkpZ5c/s8Dhr6bCgT2ZnfkrJ3VJ5LWe77tc3mT8WcU5gfjTSX6+FScdQ==', N'YVC6ICXU7QJWKLIXYRRVZBX3EH4VDI57', N'bbb28040-ed8f-4054-844a-8d7c0d1f964e', N'8888888888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'Ram Kumar', N'DyspTest', N'DYSPTEST', N'demo@gmail.com', N'DEMO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFiAjbfem4xZKuZl3R809VQ+C6oWk1/kVY/vBS3s3eo9TO2vs3hYJhgpN2USMpZZ4g==', N'EGSOYMCDVY5OPVALPE37I27BCDHCI5NU', N'b410ccdb-4b12-4a80-8a5d-7d324c89627d', N'8888888888', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'Nitin Shinde', N'PITest1', N'PITEST1', N'demo@gmail.com', N'DEMO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBv6qpHIlX5mEvSm+yDSNbEc/JjZ9c6K/bm9QEKkRlSkJUgdNZhnLBkBnLRSffVTiA==', N'IXB36SSNSVYCKAEXKC537SZLH7GHG5ZE', N'67ee3a56-8cd4-4c7d-9523-d03872534112', N'8819969809', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (5, N'Kamal', N'CourtTesy', N'COURTTESY', N'demo@gmail.com', N'DEMO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEN4q6962eZs7dh1kTn8o1zEc+fZ7KXYgSq6ZLanwIf6Yv20xm8XrrdMf30FFPiAM4A==', N'CZIB4GZAXSRIOUQTIZ6Z6OU77QIKCNAK', N'1c823548-4aef-4fe1-b38e-6727d8ce592e', N'9999999999', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (6, N'Officer 1', N'OfficeeTest', N'OFFICEETEST', N'demo@gmail.com', N'DEMO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECCQxinYKCI68PAUKhzgXyx7mhAy3TEhJt1BedUlVXyvOVEaUIkAVWQ+iILDqscdyA==', N'5AO6D332R77LHZHUS27FKQCZGZQMHVTW', N'8850bec6-e3d1-4e34-917d-eee6b79866e6', N'8888888888', 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[dashboardSetting] ON 

INSERT [dbo].[dashboardSetting] ([ID], [Status], [RoleID], [RoleName]) VALUES (1, N'CK', 2, N'Clerk')
INSERT [dbo].[dashboardSetting] ([ID], [Status], [RoleID], [RoleName]) VALUES (2, N'OF', 4, N'Officer')
INSERT [dbo].[dashboardSetting] ([ID], [Status], [RoleID], [RoleName]) VALUES (3, N'DY', 3, N'Dysp')
INSERT [dbo].[dashboardSetting] ([ID], [Status], [RoleID], [RoleName]) VALUES (4, N'PI', 5, N'PI')
INSERT [dbo].[dashboardSetting] ([ID], [Status], [RoleID], [RoleName]) VALUES (5, N'CT', 6, N'Court')
SET IDENTITY_INSERT [dbo].[dashboardSetting] OFF
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
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (11, N'SG', N'Semi Goverment', N'SERVICETYPE', 1, CAST(N'2022-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (15, N'CL', N'Complent', N'PURPOSETYPE', 1, CAST(N'2022-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (16, N'CA', N'Caste Appeal ', N'PURPOSETYPE', 1, CAST(N'2022-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (17, N'CG', N'Central Goverment', N'SERVICETYPE', 1, CAST(N'2022-04-10T21:01:43.627' AS DateTime))
INSERT [dbo].[dDLMasters] ([Id], [ValueFields], [DisplayFields], [Categroy], [EntryBy], [EntryDate]) VALUES (18, N'TD', N'Tribe Demo', N'TRIBE', 1, CAST(N'2022-04-10T21:04:39.590' AS DateTime))
SET IDENTITY_INSERT [dbo].[dDLMasters] OFF
GO
SET IDENTITY_INSERT [dbo].[districts] ON 

INSERT [dbo].[districts] ([DistrictID], [DistictName]) VALUES (1, N'Ahmednagar ')
INSERT [dbo].[districts] ([DistrictID], [DistictName]) VALUES (2, N'Akola')
SET IDENTITY_INSERT [dbo].[districts] OFF
GO
SET IDENTITY_INSERT [dbo].[educations] ON 

INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'100422100001', 1, CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'Raj', N'1001', N'test', N'3', N'1', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'10001', N'tests', NULL, N'ED', NULL, NULL, NULL, N'None', N'TD', NULL, NULL, NULL, 2, CAST(N'2022-04-10T21:42:29.700' AS DateTime), NULL, NULL, N'okay')
INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'110422100001', 2, CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'Raj', N'1', N'bhadrapur', N'3', N'1', CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'10001', N'tests', N'CG', N'SR', N'SP', N'VI', N'MR SP', NULL, N'TD', NULL, NULL, NULL, 2, CAST(N'2022-04-12T19:08:45.740' AS DateTime), NULL, NULL, N'Okay')
INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'120422100002', 3, CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'Meera', N'0023', N'chandrapur', N'3', N'1', CAST(N'2022-02-14T00:00:00.000' AS DateTime), N'10089', N'tests', NULL, N'CA', NULL, NULL, NULL, N'text', N'TD', NULL, NULL, NULL, 2, CAST(N'2022-04-12T19:38:52.490' AS DateTime), NULL, NULL, N'Test')
INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'120422100003', 6, CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'Aniee', N'10034', N'test', N'1', N'2', CAST(N'2022-04-18T00:00:00.000' AS DateTime), N'1005', N'test', NULL, N'ED', NULL, NULL, NULL, N'test', N'TD', NULL, NULL, NULL, 2, CAST(N'2022-04-12T19:01:41.107' AS DateTime), NULL, NULL, N'test')
INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'120422100004', 7, CAST(N'2022-04-11T00:00:00.000' AS DateTime), N'Thakur', N'10056', N'test', N'3', N'1', CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'19001', N'test', N'CG', N'PS', N'TI', N'II', N'MR TI', N'test', N'TD', NULL, NULL, NULL, 2, CAST(N'2022-04-12T19:03:56.103' AS DateTime), NULL, NULL, N'test')
INSERT [dbo].[educations] ([AppId], [EntityTranstionId], [ApplicationRecivedDate], [ApplicationName], [CaseId], [Village], [Taluka], [District], [CasteCertificateDate], [CasteCertificateNumber], [CasteCertificateIssuingAuthority], [ServiceType], [PurpuseType], [Post], [Rank], [OfficerName], [CourtConttept], [Tribe], [ComplainerName], [RespondentName], [Evidence], [EntryBy], [EntryDate], [VCCompltedDate], [HearingDate], [Remark]) VALUES (N'170422100001', 8, CAST(N'2022-04-17T00:00:00.000' AS DateTime), N'raj', N'1002', N'test', N'3', N'1', CAST(N'2022-04-17T00:00:00.000' AS DateTime), N'2178', N'tests', NULL, N'CL', NULL, NULL, NULL, N'none', N'TD', N'raj', N'kumar', N'none', 2, CAST(N'2022-04-17T21:48:45.443' AS DateTime), NULL, NULL, N'okay')
SET IDENTITY_INSERT [dbo].[educations] OFF
GO
SET IDENTITY_INSERT [dbo].[statusHistory] ON 

INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (1, N'100422100001', 1, N'CK', CAST(N'2022-04-10T21:42:30.930' AS DateTime), N'CK', CAST(N'2022-04-10T21:42:30.967' AS DateTime), N'okay', 0, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (2, N'110422100001', 2, N'CK', CAST(N'2022-04-11T09:47:54.950' AS DateTime), N'CK', CAST(N'2022-04-11T09:47:54.950' AS DateTime), N'Okay', 0, CAST(N'2022-04-11T09:47:54.950' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (3, N'100422100001', 1, N'OF', CAST(N'2022-04-12T11:38:21.440' AS DateTime), N'CK', CAST(N'2022-04-10T21:42:30.930' AS DateTime), N'okay', 6, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (4, N'120422100002', 3, N'CK', CAST(N'2022-04-12T18:38:32.637' AS DateTime), N'CK', CAST(N'2022-04-12T18:38:32.637' AS DateTime), N'Approve', 0, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (5, N'120422100003', 4, N'CK', CAST(N'2022-04-12T19:01:41.107' AS DateTime), N'CK', CAST(N'2022-04-12T19:01:41.107' AS DateTime), N'test', 0, CAST(N'2022-04-12T19:01:41.107' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (6, N'120422100004', 5, N'CK', CAST(N'2022-04-12T19:03:56.103' AS DateTime), N'CK', CAST(N'2022-04-12T19:03:56.103' AS DateTime), N'test', 0, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (7, N'120422100003', 4, N'OF', CAST(N'2022-04-12T19:10:31.253' AS DateTime), N'CK', CAST(N'2022-04-12T19:01:41.107' AS DateTime), N'ToApprove', 6, CAST(N'2022-04-12T19:01:41.107' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (8, N'110422100001', 2, N'OF', CAST(N'2022-04-12T19:11:10.530' AS DateTime), N'CK', CAST(N'2022-04-11T09:47:54.950' AS DateTime), N'ToApprove', 6, CAST(N'2022-04-11T09:47:54.950' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (9, N'120422100004', 5, N'OF', CAST(N'2022-04-12T19:12:24.830' AS DateTime), N'CK', CAST(N'2022-04-12T19:03:56.103' AS DateTime), N'ToApprove', 6, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (10, N'120422100002', 3, N'OF', CAST(N'2022-04-12T19:12:41.137' AS DateTime), N'CK', CAST(N'2022-04-12T18:38:32.637' AS DateTime), N'ToApprove', 6, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (11, N'100422100001', 1, N'DY', CAST(N'2022-04-12T19:15:29.150' AS DateTime), N'OF', CAST(N'2022-04-12T11:38:21.440' AS DateTime), N'approved', 3, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (12, N'120422100002', 3, N'DY', CAST(N'2022-04-12T19:15:52.103' AS DateTime), N'OF', CAST(N'2022-04-12T19:12:41.137' AS DateTime), N'approved', 3, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (13, N'120422100004', 5, N'DY', CAST(N'2022-04-12T19:16:05.560' AS DateTime), N'OF', CAST(N'2022-04-12T19:12:24.830' AS DateTime), N'approved', 3, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (14, N'100422100001', 1, N'PI', CAST(N'2022-04-12T19:17:17.153' AS DateTime), N'DY', CAST(N'2022-04-12T19:15:29.150' AS DateTime), N'okay', 4, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (15, N'120422100004', 5, N'PI', CAST(N'2022-04-12T19:17:31.300' AS DateTime), N'DY', CAST(N'2022-04-12T19:16:05.560' AS DateTime), N'okay', 4, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (16, N'120422100002', 3, N'PI', CAST(N'2022-04-12T19:17:44.403' AS DateTime), N'DY', CAST(N'2022-04-12T19:15:52.103' AS DateTime), N'okay', 4, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (17, N'100422100001', 1, N'DY', CAST(N'2022-04-12T19:23:32.430' AS DateTime), N'PI', CAST(N'2022-04-12T19:17:17.153' AS DateTime), N'approved', 3, CAST(N'2022-04-10T21:42:31.007' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (18, N'120422100004', 5, N'DY', CAST(N'2022-04-12T19:26:38.717' AS DateTime), N'PI', CAST(N'2022-04-12T19:17:31.300' AS DateTime), N'approved', 3, CAST(N'2022-04-12T19:03:56.103' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (19, N'120422100002', 3, N'DY', CAST(N'2022-04-12T19:27:15.140' AS DateTime), N'PI', CAST(N'2022-04-12T19:17:44.403' AS DateTime), N'approved', 3, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (20, N'120422100002', 3, N'OF', CAST(N'2022-04-12T19:30:25.530' AS DateTime), N'DY', CAST(N'2022-04-12T19:27:15.140' AS DateTime), N'okay', 6, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (21, N'120422100002', 3, N'CK', CAST(N'2022-04-12T19:32:17.320' AS DateTime), N'OF', CAST(N'2022-04-12T19:30:25.530' AS DateTime), N'okay', 2, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (22, N'120422100003', 4, N'CT', CAST(N'2022-04-12T19:34:15.393' AS DateTime), N'OF', CAST(N'2022-04-12T19:10:31.253' AS DateTime), N'test', 0, CAST(N'2022-04-12T19:01:41.107' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (23, N'120422100002', 3, N'OF', CAST(N'2022-04-12T19:39:31.057' AS DateTime), N'CK', CAST(N'2022-04-12T19:32:17.320' AS DateTime), N'test', 6, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (24, N'110422100001', 2, N'CT', CAST(N'2022-04-12T19:40:23.187' AS DateTime), N'OF', CAST(N'2022-04-12T19:11:10.530' AS DateTime), N'test', 5, CAST(N'2022-04-11T09:47:54.950' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (25, N'120422100002', 3, N'CT', CAST(N'2022-04-12T19:40:34.730' AS DateTime), N'OF', CAST(N'2022-04-12T19:39:31.057' AS DateTime), N'test', 5, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (26, N'120422100002', 3, N'OF', CAST(N'2022-04-12T19:42:50.843' AS DateTime), N'CT', CAST(N'2022-04-12T19:40:34.730' AS DateTime), N'test', 6, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (27, N'120422100002', 3, N'DY', CAST(N'2022-04-12T19:44:03.263' AS DateTime), N'OF', CAST(N'2022-04-12T19:42:50.843' AS DateTime), N'approved', 3, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (28, N'120422100002', 3, N'PI', CAST(N'2022-04-12T19:47:31.390' AS DateTime), N'DY', CAST(N'2022-04-12T19:44:03.263' AS DateTime), N'okay', 4, CAST(N'2022-04-12T18:38:32.637' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (29, N'170422100001', 6, N'CK', CAST(N'2022-04-17T21:36:53.950' AS DateTime), N'CK', CAST(N'2022-04-17T21:36:53.950' AS DateTime), N'okay', 0, CAST(N'2022-04-17T21:36:53.950' AS DateTime))
INSERT [dbo].[statusHistory] ([EntityTranstionId], [ApplicationId], [EntityTranstionIdFk], [CurrentStatus], [CurrentDate], [PerviousStatus], [PerviousDate], [Remark], [EntryBy], [EntryDate]) VALUES (30, N'170422100001', 6, N'OF', CAST(N'2022-04-17T22:20:32.950' AS DateTime), N'CK', CAST(N'2022-04-17T21:36:53.950' AS DateTime), N'okay', 6, CAST(N'2022-04-17T21:36:53.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[statusHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[statusMasters] ON 

INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (1, N'CK', N'Clerk Dashboard', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (3, N'DY', N'Dysp Dashbaord', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (4, N'OF', N'Officer Dashboard', 1, CAST(N'2022-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (5, N'PI', N'PI Dashboard', 1, CAST(N'2022-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[statusMasters] ([Id], [Status], [Description], [EntryBy], [EntryDate]) VALUES (6, N'CT', N'Court Dashboard', 1, CAST(N'2022-03-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[statusMasters] OFF
GO
SET IDENTITY_INSERT [dbo].[talukas] ON 

INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (1, N'Akola ', 2)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (2, N'Akot', 2)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (3, N'Akole', 1)
INSERT [dbo].[talukas] ([TalukaId], [TalukaName], [DistrictID]) VALUES (4, N'Shevgaon', 1)
SET IDENTITY_INSERT [dbo].[talukas] OFF
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 18-04-2022 09:10:22 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 18-04-2022 09:10:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 18-04-2022 09:10:22 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 18-04-2022 09:10:22 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 18-04-2022 09:10:22 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 18-04-2022 09:10:22 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 18-04-2022 09:10:22 ******/
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
/****** Object:  StoredProcedure [dbo].[GeDashboardSetting]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GeDashboardSetting]
@RoleID int
As
Begin

select * from [dbo].[dashboardSetting] where RoleID=@RoleID

END
GO
/****** Object:  StoredProcedure [dbo].[GetActionStatus]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetActionStatus]
@RoleID int ,
@CurrentStatus varchar(3)
As
Begin

select NextStatus,Description,Description +'- ' + Direction as[Direction]  from actionStatus  where RoleId=@RoleID and CurrentStatus=@CurrentStatus

End
GO
/****** Object:  StoredProcedure [dbo].[GetAppHistory]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAppHistory]
@AppId Varchar(20)
as
Begin


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [EntityTranstionId]
      ,[ApplicationId]
      ,[EntityTranstionIdFk]
      , s.Description as  [CurrentStatus]
      ,convert(date,[CurrentDate],103) as [CurrentDate]
      , ss.Description as  [PerviousStatus]
      ,convert(date,[PerviousDate],103) as [PerviousDate]
      ,[Remark]
      ,h.[EntryBy]
      ,h.[EntryDate]
  FROM [JointCommissionerCasteCertificate].[dbo].[statusHistory] h
  left join  statusMasters s on s.Status=h.CurrentStatus
   left join  statusMasters ss on ss.Status=h.PerviousStatus


  where  ApplicationId=@AppId

  END
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationId]    Script Date: 18-04-2022 09:10:22 ******/
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

select  top 1 @ApplicationId= AppId  from educations where CONVERT(varchar, EntryDate,103)=CONVERT(varchar, GETDATE(),103) order by AppId  desc
select @ApplicationId= FORMAT(GETDATE(), 'ddMMyy')+CAST( CAST( SUBSTRING(@ApplicationId  , 7, len(@ApplicationId)) as bigint)+1 as nvarchar) 
SELECT  @ApplicationId as  [ApplicationId]

end

end
GO
/****** Object:  StoredProcedure [dbo].[GetEducationByAppId]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetEducationByAppId]
@ApplicationId varchar(20)
as 
begin


select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId,e.Village as Village, t.TalukaName as Taluka, d.DistictName as District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
ed.DisplayFields as ServiceType, pr.DisplayFields as PurpuseType, 
s.CurrentStatus , isnull(s.Remark,'') as Remark,
[Post]
      ,[Rank]
      ,[OfficerName]
      ,[CourtConttept]
      , tr.DisplayFields as  [Tribe]
      ,[ComplainerName]
      ,[RespondentName]
      ,[Evidence]
from educations e 
--inner join  villages v on  e.Village=v.VillageId
inner join talukas t on  t.TalukaId=e.Taluka
inner join  districts d on d.DistrictID=e.District
left join  dDLMasters tr on  e.ServiceType=tr.ValueFields and tr.Categroy='TRIBE'
left join  dDLMasters ed on  e.ServiceType=ed.ValueFields and ed.Categroy='SERVICETYPE'
inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
inner join  applicationStatuses s on e.AppId=s.ApplicationId

where AppId=@ApplicationId
--where s.EntryBy=@UserId and s.CuurentStatus=@CuurentStatus

END
GO
/****** Object:  StoredProcedure [dbo].[GetEducationById]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetEducationById]
@ApplicationId varchar(450)
As 
Begin
select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId, Village,Taluka,  District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
 ServiceType ,  PurpuseType, tribe,
 [Post]
      ,[Rank]
      ,[OfficerName]
      ,[CourtConttept]
      ,[ComplainerName]
      ,[RespondentName]
      ,[Evidence],
s.CurrentStatus , s.Remark as Remark
from educations e 

inner join  applicationStatuses s on e.AppId=s.ApplicationId
where AppId=@ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[GetEducationDetails]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetEducationDetails]
@UserId int ,
@CurrentStatus varchar(20)
as
Begin
IF(@CurrentStatus='CK')
BEGIN


select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId,e.Village as Village, t.TalukaName as Taluka, d.DistictName as District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
isnull(ed.DisplayFields,'-') as ServiceType, pr.DisplayFields as PurpuseType, 
sm.Description as  CurrentStatus , isnull(s.Remark,'') as Remark
from educations e 
--inner join  villages v on  e.Village=v.VillageId
inner join talukas t on  t.TalukaId=e.Taluka
inner join  districts d on d.DistrictID=e.District
left join  dDLMasters ed on  e.ServiceType=ed.ValueFields and ed.Categroy='SERVICETYPE'
inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
inner join  applicationStatuses s on e.AppId=s.ApplicationId
inner join  statusMasters sm  on sm.Status=s.CurrentStatus
where  s.EntryBy=@UserId and s.CurrentStatus=@CurrentStatus
order by  e.EntryDate 
END 
ELSE
BEGIN
select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId,e.Village as Village, t.TalukaName as Taluka, d.DistictName as District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
isnull(ed.DisplayFields,'-') as ServiceType, pr.DisplayFields as PurpuseType, 
sm.Description as  CurrentStatus , isnull(s.Remark,'') as Remark
from educations e 
--inner join  villages v on  e.Village=v.VillageId
inner join talukas t on  t.TalukaId=e.Taluka
inner join  districts d on d.DistrictID=e.District
left join  dDLMasters ed on  e.ServiceType=ed.ValueFields and ed.Categroy='SERVICETYPE'
inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
inner join  applicationStatuses s on e.AppId=s.ApplicationId
inner join  statusMasters sm  on sm.Status=s.CurrentStatus
where  s.UpdatedBy=@UserId and s.CurrentStatus=@CurrentStatus
order by  e.EntryDate 
END


end
GO
/****** Object:  StoredProcedure [dbo].[GetEducationExport]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetEducationExport]

as
Begin
--IF(@CurrentStatus='CK')
--BEGIN


--select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
--CaseId,e.Village as Village, t.TalukaName as Taluka, d.DistictName as District,
--CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
--isnull(ed.DisplayFields,'-') as ServiceType, pr.DisplayFields as PurpuseType, 
--sm.Description as  CurrentStatus , isnull(s.Remark,'') as Remark
--from educations e 
----inner join  villages v on  e.Village=v.VillageId
--inner join talukas t on  t.TalukaId=e.Taluka
--inner join  districts d on d.DistrictID=e.District
--left join  dDLMasters ed on  e.ServiceType=ed.ValueFields and ed.Categroy='SERVICETYPE'
--inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
--inner join  applicationStatuses s on e.AppId=s.ApplicationId
--inner join  statusMasters sm  on sm.Status=s.CurrentStatus
--where  s.EntryBy=@UserId and s.CurrentStatus=@CurrentStatus
--order by  e.EntryDate 
--END 
--ELSE
--BEGIN
select AppId,e.EntityTranstionId, CONVERT(VARCHAR, ApplicationRecivedDate,103) as ApplicationRecivedDate ,ApplicationName,
CaseId,e.Village as Village, t.TalukaName as Taluka, d.DistictName as District,
CONVERT(VARCHAR, CasteCertificateDate,103) as CasteCertificateDate,CasteCertificateNumber, CasteCertificateIssuingAuthority,
isnull(ed.DisplayFields,'-') as ServiceType, pr.DisplayFields as PurpuseType, 
sm.Description as  CurrentStatus , isnull(s.Remark,'') as Remark
from educations e 
--inner join  villages v on  e.Village=v.VillageId
inner join talukas t on  t.TalukaId=e.Taluka
inner join  districts d on d.DistrictID=e.District
left join  dDLMasters ed on  e.ServiceType=ed.ValueFields and ed.Categroy='SERVICETYPE'
inner join  dDLMasters pr on  e.PurpuseType=pr.ValueFields and pr.Categroy='PURPOSETYPE'
inner join  applicationStatuses s on e.AppId=s.ApplicationId
inner join  statusMasters sm  on sm.Status=s.CurrentStatus
--where  s.UpdatedBy=@UserId and s.CurrentStatus=@CurrentStatus
order by  e.EntryDate 
--END


end
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetUsers]
@CurrentStatus varchar(3),
@NextStatus varchar(3)
as
Begin


declare @roleid int
select @roleid=NextRoleId from actionStatus where  CurrentStatus=@CurrentStatus and NextStatus=@NextStatus


select u.Id,u.Name from  AspNetUsers u 
inner  join  AspNetUserRoles r on u.Id=r.UserId
where r.RoleId=@roleid

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationStatus]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateApplicationStatus]
@ApplicationId  varchar(450),
@CurrentStatus varchar(20),
@Remark varchar(500),
@UserId int
AS
Begin

DECLARE @PerviousStatus varchar(3);
DECLARE @PerviousDate datetime;

 IF exists(select * from applicationStatuses where ApplicationId=@ApplicationId)
 begin
 select @PerviousStatus=CurrentStatus,@PerviousDate=CurrentDate from applicationStatuses where ApplicationId=@ApplicationId
 Update applicationStatuses set  CurrentStatus=@CurrentStatus,
CurrentDate=GETDATE(),PerviousStatus=@PerviousStatus,PerviousDate=@PerviousDate,
Remark=@Remark,UpdatedBy=@UserId where  ApplicationId=@ApplicationId

 END
 else
 begin
 set  @PerviousStatus=@CurrentStatus
 set @PerviousDate=getdate()
 Update applicationStatuses set  CurrentStatus=@CurrentStatus,
CurrentDate=GETDATE(),PerviousStatus=@PerviousStatus,PerviousDate=@PerviousDate,
Remark=@Remark,EntryBy=@UserId,UpdatedBy=@UserId where  ApplicationId=@ApplicationId

 end




END
GO
/****** Object:  Trigger [dbo].[TriStatusHistory]    Script Date: 18-04-2022 09:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriStatusHistory]
ON [dbo].[applicationStatuses]
AFTER INSERT, UPDATE
AS 
BEGIN
    SET NOCOUNT ON;
	
    --
    -- Check if this is an INSERT, UPDATE or DELETE Action.
    -- 
    DECLARE @action as char(1);

    SET @action = 'I'; -- Set Action to Insert by default.
	
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        SET @action = 'U'
       END
   
	
	IF(@action='I')
	BEGIN
	print 'P'

	INSERT INTO [dbo].[statusHistory]
           ([ApplicationId]
           ,[EntityTranstionIdFk]
           ,[CurrentStatus]
           ,[CurrentDate]
           ,[PerviousStatus]
           ,[PerviousDate]
           ,[Remark]
           ,[EntryBy]
           ,[EntryDate])
	SELECT [ApplicationId]
	  ,[EntityTranstionId]      
      ,[CurrentStatus]
      ,[CurrentDate]
      ,[PerviousStatus]
      ,[PerviousDate]
      ,[Remark]
      ,[EntryBy]
      ,[EntryDate] FROM INSERTED
	END
	ELSE
	BEGIN
	print 'p2'
	

	INSERT INTO [dbo].[statusHistory]
           ([ApplicationId]
           ,[EntityTranstionIdFk]
           ,[CurrentStatus]
           ,[CurrentDate]
           ,[PerviousStatus]
           ,[PerviousDate]
           ,[Remark]
           ,[EntryBy]
           ,[EntryDate])
	SELECT [ApplicationId]
	  ,[EntityTranstionId]      
      ,[CurrentStatus]
      ,[CurrentDate]
      ,[PerviousStatus]
      ,[PerviousDate]
      ,[Remark]
      ,[UpdatedBy]
      ,[EntryDate] FROM  inserted
	END

       

  

    END
GO
ALTER TABLE [dbo].[applicationStatuses] ENABLE TRIGGER [TriStatusHistory]
GO
USE [master]
GO
ALTER DATABASE [JointCommissionerCasteCertificate] SET  READ_WRITE 
GO
