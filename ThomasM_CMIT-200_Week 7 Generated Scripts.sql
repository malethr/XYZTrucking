USE [master]
GO
/****** Object:  Database [XYZ Trucking]    Script Date: 10/10/2016 8:45:33 AM ******/
CREATE DATABASE [XYZ Trucking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZ Trucking', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZ Trucking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XYZ Trucking_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZ Trucking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XYZ Trucking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZ Trucking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XYZ Trucking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XYZ Trucking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XYZ Trucking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XYZ Trucking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XYZ Trucking] SET ARITHABORT OFF 
GO
ALTER DATABASE [XYZ Trucking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XYZ Trucking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XYZ Trucking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XYZ Trucking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XYZ Trucking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XYZ Trucking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XYZ Trucking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XYZ Trucking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XYZ Trucking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XYZ Trucking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XYZ Trucking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XYZ Trucking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XYZ Trucking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XYZ Trucking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XYZ Trucking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XYZ Trucking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XYZ Trucking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XYZ Trucking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XYZ Trucking] SET  MULTI_USER 
GO
ALTER DATABASE [XYZ Trucking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XYZ Trucking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XYZ Trucking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XYZ Trucking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XYZ Trucking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XYZ Trucking]
GO
/****** Object:  Table [dbo].[DriverDemographicInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverDemographicInformation](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[DateOfHire] [date] NULL,
	[CommercialDriverLicense] [bit] NOT NULL,
 CONSTRAINT [PK_DriverDemographicInformation] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulManifest]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulManifest](
	[HaulManifestID] [int] IDENTITY(1,1) NOT NULL,
	[Item] [varchar](50) NOT NULL,
	[ItemDescription] [varchar](200) NULL,
	[ItemWeightPerUnit] [decimal](10, 2) NULL,
	[Quantity] [int] NOT NULL,
	[HaulRecordID] [int] NOT NULL,
 CONSTRAINT [PK_HaulManifest] PRIMARY KEY CLUSTERED 
(
	[HaulManifestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulRecord]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulRecord](
	[HaulRecordID] [int] IDENTITY(1,1) NOT NULL,
	[TruckUsedID] [int] NOT NULL,
	[Client] [varchar](200) NOT NULL,
	[CargoTypeID] [int] NULL,
	[DateHaulBegan] [datetime] NOT NULL,
	[DateDelivered] [datetime] NOT NULL,
	[Mileage] [bigint] NOT NULL,
	[HaulNotes] [varchar](200) NULL,
 CONSTRAINT [PK_HaulRecord] PRIMARY KEY CLUSTERED 
(
	[HaulRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUCargoType]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUCargoType](
	[CargoTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CargoType] [varchar](20) NOT NULL,
	[CargoTypeDescription] [varchar](50) NULL,
 CONSTRAINT [PK_LUCargoType] PRIMARY KEY CLUSTERED 
(
	[CargoTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUMaintenanceCode]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUMaintenanceCode](
	[MaintenanceCodeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceCode] [varchar](20) NOT NULL,
	[MaintenanceCodeDescription] [varchar](50) NULL,
 CONSTRAINT [PK_LUMaintenanceCode] PRIMARY KEY CLUSTERED 
(
	[MaintenanceCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUMaintenanceType]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUMaintenanceType](
	[MaintenanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_LUMaintenanceType] PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUTrailerType]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUTrailerType](
	[TrailerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerTypeAbbreviation] [varchar](20) NOT NULL,
	[TrailerTypeDescription] [varchar](50) NULL,
 CONSTRAINT [PK_LUTrailerType] PRIMARY KEY CLUSTERED 
(
	[TrailerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrailerInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrailerInformation](
	[TrailerInformationID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerCapacity] [int] NOT NULL,
	[TrailerTypeID] [int] NOT NULL,
	[TrailerMileage] [bigint] NOT NULL,
	[TrailerDescription] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TrailerInformation] PRIMARY KEY CLUSTERED 
(
	[TrailerInformationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TruckInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TruckInformation](
	[TruckID] [int] IDENTITY(1,1) NOT NULL,
	[TruckType] [varchar](20) NOT NULL,
	[TruckBodyType] [varchar](20) NOT NULL,
	[TruckNumber] [varchar](50) NOT NULL,
	[TruckLicenseNumber] [varchar](20) NULL,
	[TruckDescription] [varchar](50) NULL,
	[TruckEngineType] [varchar](20) NULL,
	[TruckFuelType] [varchar](20) NULL,
	[TruckCurrentMileage] [bigint] NOT NULL,
	[DriverID] [int] NOT NULL,
	[TrailerInformationID] [int] NULL,
 CONSTRAINT [PK_TruckInformation] PRIMARY KEY CLUSTERED 
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenance](
	[TruckMainenanceID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceStartDate] [date] NOT NULL,
	[MaintenanceEndDate] [date] NOT NULL,
	[MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceCodeID] [int] NOT NULL,
	[TruckID] [int] NOT NULL,
 CONSTRAINT [PK_TruckMaintenance] PRIMARY KEY CLUSTERED 
(
	[TruckMainenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DriverDemographicInformation] ON 

INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (1, N'Lionel Thomas', CAST(N'1975-01-26' AS Date), 20160112, CAST(N'2016-01-12' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (2, N'Stephen Gilbert', CAST(N'1956-11-04' AS Date), 20160119, CAST(N'2016-01-19' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (3, N'Benjamin Phinazee', CAST(N'1965-05-10' AS Date), 20160125, CAST(N'2016-01-25' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (4, N'Aaron Smith', CAST(N'1990-06-25' AS Date), 20160210, CAST(N'2016-02-10' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (5, N'Mario Rojas', CAST(N'1983-06-04' AS Date), 20160217, CAST(N'2016-02-17' AS Date), 0)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (6, N'Mark Gilbert', CAST(N'1983-08-24' AS Date), 20160307, CAST(N'2016-03-07' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (7, N'David Saville', CAST(N'1967-11-24' AS Date), 20160417, CAST(N'2016-04-17' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (8, N'Rick Wenthe', CAST(N'1989-06-04' AS Date), 20160427, CAST(N'2016-04-27' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (9, N'Dave Sowards', CAST(N'1968-12-13' AS Date), 20160429, CAST(N'2016-04-29' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (10, N'Cleveland Williams', CAST(N'1987-07-29' AS Date), 20160503, CAST(N'2016-05-03' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (11, N'Donald Maenle', CAST(N'1979-01-08' AS Date), 20160510, CAST(N'2016-05-10' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (12, N'Alex Grant', CAST(N'1980-09-29' AS Date), 20160516, CAST(N'2016-05-16' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (13, N'Brian Walker', CAST(N'1984-05-16' AS Date), 20160521, CAST(N'2016-05-21' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (14, N'Freddy Morris', CAST(N'1979-09-10' AS Date), 20160528, CAST(N'2016-05-28' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (15, N'Edward Hunt', CAST(N'1986-10-23' AS Date), 20160601, CAST(N'2016-06-01' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (16, N'John Martin', CAST(N'1983-02-14' AS Date), 20160723, CAST(N'2016-07-23' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (17, N'Harry Connor', CAST(N'1982-10-06' AS Date), 20160725, CAST(N'2016-07-25' AS Date), 1)
INSERT [dbo].[DriverDemographicInformation] ([DriverID], [Name], [DateOfBirth], [EmployeeNumber], [DateOfHire], [CommercialDriverLicense]) VALUES (18, N'Greg Sanger', CAST(N'1970-11-15' AS Date), 20160726, CAST(N'2016-07-26' AS Date), 1)
SET IDENTITY_INSERT [dbo].[DriverDemographicInformation] OFF
SET IDENTITY_INSERT [dbo].[HaulManifest] ON 

INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (1, N'Cabinets', N'Antiques', CAST(33.07 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (2, N'Paintings', N'Abstract Art Paintings', CAST(15.02 AS Decimal(10, 2)), 7, 1)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (3, N'Mirrors', N'Antiques', CAST(10.58 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (4, N'Vases', N'Ivory vases', CAST(25.23 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (5, N'Cabinets', N'Modern design', CAST(30.69 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (6, N'Bed frame', N'Contemporary bed design frames', CAST(43.16 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (7, N'Side Table', N'Green side table', CAST(12.14 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (8, N'Ice Cream', N'Organic Ice cream', CAST(2.50 AS Decimal(10, 2)), 250, 3)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (9, N'Oil', N'Ship''s oil', CAST(20000.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (10, N'BMW', N'Black 2000 Model', CAST(4700.21 AS Decimal(10, 2)), 3, 5)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (11, N'Toyota', N'Green 1998 Model', CAST(4230.30 AS Decimal(10, 2)), 2, 5)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (12, N'Mazda', N'Silver Sedan 2003 Model', CAST(4691.88 AS Decimal(10, 2)), 3, 5)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (13, N'Toyota', N'Silver 2013', CAST(4130.21 AS Decimal(10, 2)), 3, 6)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (14, N'Honda', N'Black 2012', CAST(4232.01 AS Decimal(10, 2)), 3, 6)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (15, N'Oil', N'Power Plant Oil', CAST(16000.00 AS Decimal(10, 2)), 1, 7)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (16, N'Lamp', N'Vintage Lamp', CAST(123.12 AS Decimal(10, 2)), 5, 8)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (17, N'Chandelier', N'Luxury Chandelier', CAST(410.12 AS Decimal(10, 2)), 1, 8)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (18, N'Alcohol Drink', N'Beer', CAST(109.10 AS Decimal(10, 2)), 60, 9)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (19, N'Soda in can', N'Cola', CAST(60.00 AS Decimal(10, 2)), 100, 9)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (20, N'Bottled Juice', N'Orange Juice', CAST(110.90 AS Decimal(10, 2)), 60, 9)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (21, N'Oil', N'Plane Oil', CAST(35000.00 AS Decimal(10, 2)), 1, 10)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (22, N'Chicken meat', N'Breast and Wing', CAST(20.00 AS Decimal(10, 2)), 70, 11)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (23, N'Ham', N'Glazed Ham', CAST(2.20 AS Decimal(10, 2)), 50, 11)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (24, N'Hyundai', N'Gold SUV', CAST(4156.03 AS Decimal(10, 2)), 3, 12)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (25, N'Toyota', N'Black 2017', CAST(4200.02 AS Decimal(10, 2)), 2, 12)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (26, N'Marcelo Artwork', N'1960s Paintings', CAST(20.00 AS Decimal(10, 2)), 2, 13)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (27, N'Grapes', N'Spain grapes', CAST(50.21 AS Decimal(10, 2)), 10, 14)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (28, N'Jackfruit', N'Davao Jackfruit', CAST(60.19 AS Decimal(10, 2)), 8, 14)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (29, N'Banana', N'Davao Banana', CAST(120.99 AS Decimal(10, 2)), 50, 14)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (30, N'Nitrogen gas', N'Use for chemical laboratory', CAST(10260.16 AS Decimal(10, 2)), 1, 15)
INSERT [dbo].[HaulManifest] ([HaulManifestID], [Item], [ItemDescription], [ItemWeightPerUnit], [Quantity], [HaulRecordID]) VALUES (31, N'Oil', N'Ships Oil', CAST(32000.00 AS Decimal(10, 2)), 1, 16)
SET IDENTITY_INSERT [dbo].[HaulManifest] OFF
SET IDENTITY_INSERT [dbo].[HaulRecord] ON 

INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (1, 2, N'Cindy Crawfrod', 4, CAST(N'2016-01-05 07:30:00.000' AS DateTime), CAST(N'2016-01-10 08:00:00.000' AS DateTime), 23, N'Signed by C. Crawford')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (2, 2, N'Cherrel Mitchell', 4, CAST(N'2016-01-15 08:30:00.000' AS DateTime), CAST(N'2016-01-22 15:00:00.000' AS DateTime), 50, N'Signed by C. Mitchell')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (3, 3, N'Diane Andersen', 3, CAST(N'2016-01-16 04:30:00.000' AS DateTime), CAST(N'2016-01-18 22:10:00.000' AS DateTime), 11, N'Signed by D. Andersen')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (4, 4, N'Noriel Hernandez', 2, CAST(N'2016-02-07 11:05:00.000' AS DateTime), CAST(N'2016-02-10 12:00:00.000' AS DateTime), 10, N'Signed by N. Hernandez')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (5, 5, N'Lionel Thomas', 1, CAST(N'2016-03-11 12:43:00.000' AS DateTime), CAST(N'2016-03-27 13:23:00.000' AS DateTime), 60, N'Signed by L. Thomas')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (6, 6, N'Donald Clinton', 4, CAST(N'2016-03-15 08:23:00.000' AS DateTime), CAST(N'2016-03-20 16:40:00.000' AS DateTime), 27, N'Signed by D. Clinton')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (7, 7, N'Kevin Ford', 2, CAST(N'2016-04-02 09:13:00.000' AS DateTime), CAST(N'2016-04-20 22:36:00.000' AS DateTime), 35, N'Signed by K. Ford')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (8, 8, N'Diane Matheson', 4, CAST(N'2016-04-03 07:36:00.000' AS DateTime), CAST(N'2016-04-05 21:46:00.000' AS DateTime), 14, N'Signed by D. Matheson')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (9, 9, N'Jane Simmons', 3, CAST(N'2016-04-10 10:23:00.000' AS DateTime), CAST(N'2016-04-20 23:55:00.000' AS DateTime), 30, N'Signed by J. Simmons')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (10, 10, N'Ken Rein', 2, CAST(N'2016-04-21 07:08:00.000' AS DateTime), CAST(N'2016-04-22 13:07:00.000' AS DateTime), 39, N'Signed by K. Rein')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (11, 11, N'John Blake', 3, CAST(N'2016-04-28 10:27:00.000' AS DateTime), CAST(N'2016-05-07 14:49:00.000' AS DateTime), 30, N'Signed by J. Blake')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (12, 12, N'Michael Edwards', 4, CAST(N'2016-05-01 06:07:00.000' AS DateTime), CAST(N'2016-05-20 01:12:00.000' AS DateTime), 61, N'Signed by M. Edwards')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (13, 13, N'Jake Collins', 4, CAST(N'2016-05-15 11:50:00.000' AS DateTime), CAST(N'2016-05-17 08:40:00.000' AS DateTime), 12, N'Signed by J. Collins')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (14, 14, N'John Blunt', 3, CAST(N'2016-05-16 10:43:00.000' AS DateTime), CAST(N'2016-05-23 06:41:00.000' AS DateTime), 33, N'Signed by J. Blunt')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (15, 15, N'Simon Murphy', 1, CAST(N'2016-05-20 12:23:00.000' AS DateTime), CAST(N'2016-06-05 18:09:00.000' AS DateTime), 56, N'Signed by S. Murphy')
INSERT [dbo].[HaulRecord] ([HaulRecordID], [TruckUsedID], [Client], [CargoTypeID], [DateHaulBegan], [DateDelivered], [Mileage], [HaulNotes]) VALUES (16, 16, N'Michael Edwards', 2, CAST(N'2016-06-10 09:13:00.000' AS DateTime), CAST(N'2016-06-20 19:10:00.000' AS DateTime), 30, N'Signed by M. Edwards')
SET IDENTITY_INSERT [dbo].[HaulRecord] OFF
SET IDENTITY_INSERT [dbo].[LUCargoType] ON 

INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (1, N'Hazardous', N'Dangerous goods')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (2, N'Liquid', N'Liquid and gaseous commodity')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (3, N'Refrigerated', N'Temperature sensitive cargo')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (4, N'Standard', N'Standard shipping van or container')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (5, N'Other', NULL)
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoType], [CargoTypeDescription]) VALUES (6, N'Break Bulk', N'Out of Shape')
SET IDENTITY_INSERT [dbo].[LUCargoType] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] ON 

INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCode], [MaintenanceCodeDescription]) VALUES (1, N'Routine', N'Preventive Maintenance')
INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCode], [MaintenanceCodeDescription]) VALUES (2, N'Unscheduled', N'Casualty Maintenance')
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceType] ON 

INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (1, N'Engine')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (2, N'Transmission')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (3, N'Tires')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (4, N'Body')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (5, N'Electrical')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (6, N'Hydraulic')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceType]) VALUES (7, N'Pneumatic')
SET IDENTITY_INSERT [dbo].[LUMaintenanceType] OFF
SET IDENTITY_INSERT [dbo].[LUTrailerType] ON 

INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (1, N'Tanker', N'Tank Body Trailer')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (2, N'Flat Bed', N'Open Body Trailer')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (3, N'Box', N'Enclosed Cargo Trailer')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (4, N'Refrigerated', N'Temperature Controlled Trailer')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (5, N'Specialized', N'Very specific class of Trailer')
SET IDENTITY_INSERT [dbo].[LUTrailerType] OFF
SET IDENTITY_INSERT [dbo].[TrailerInformation] ON 

INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (1, 2600, 1, 220000, N'Oil Tanker')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (2, 36000, 2, 120000, N'Extendible Flatbed')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (3, 42000, 4, 130000, N'Temperature controlled')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (4, 68000, 3, 190000, N'High Value Cargo')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (5, 38000, 2, 130000, N'2008 TRANSCRAFT DTL-2100 RS2')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (6, 37050, 2, 95000, N'2016 Transcraft-HD')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (7, 37060, 2, 93000, N'2014 Transcraft 325')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (8, 3600, 1, 123200, N'Fuel Tanker')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (9, 4100, 1, 129200, N'Fuel Tanker')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (10, 3600, 1, 111200, N'Chemical Tanker')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (11, 52000, 3, 132000, N'Closed Trailer')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (12, 46000, 4, 110000, N'Temperature Controlled Box')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (13, 47000, 4, 87200, N'Frozen Box')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (14, 63600, 4, 150200, N'Beverage Trailer')
INSERT [dbo].[TrailerInformation] ([TrailerInformationID], [TrailerCapacity], [TrailerTypeID], [TrailerMileage], [TrailerDescription]) VALUES (15, 37000, 1, 90000, N'Fuel Tanker')
SET IDENTITY_INSERT [dbo].[TrailerInformation] OFF
SET IDENTITY_INSERT [dbo].[TruckInformation] ON 

INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (1, N'Short', N'Single Unit', N'3618570', N'INT 430', N'2009 INTERNATIONAL 4300', N'Maxxforce DT', N'Diesel', 251841, 1, NULL)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (2, N'Long', N'Tractor Trailer', N'5214860', N'FRE 270', N'2000 FREIGHTLINER FL70', N'	MBE900', N'Diesel', 270000, 2, 4)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (3, N'Long', N'Tractor Trailer', N'9994448', N'FLD 120', N'2005 FREIGHTLINER FLD120', N'Series 60', N'Diesel', 280000, 3, 1)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (4, N'Long', N'Tractor Trailer', N'5515640', N'BCM 210', N'2008 FREIGHTLINER BUSINESS CLASS M2 106', N'ISC', N'Diesel', 189279, 4, 3)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (5, N'Long', N'Tractor Trailer', N'1400110', N'CAT 660', N'2015 CAT CT660', N'CT13', N'Diesel', 240000, 5, 2)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (6, N'Long', N'Tractor Trailer', N'1550763', N'CAS 018', N'2012 FREIGHTLINER 125', N'DD15', N'Diesel', 397031, 6, 6)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (7, N'Long', N'Tractor Trailer', N'2315462', N'WES 490', N'2012 WESTERN STAR', N'DD13', N'Diesel', 390039, 7, 8)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (8, N'Short', N'Single Unit', N'1599535', N'TEN 011', N'2011 INTERNATIONAL 6200', N'Maxxforce DT', N'Diesel', 261000, 8, NULL)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (9, N'Long', N'Tractor Trailer', N'2562565', N'SCH 565', N'2014 CAT DT256', N'CT13', N'Diesel', 230000, 9, 14)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (10, N'Long', N'Tractor Trailer', N'3304178', N'TUL 178', N'2009 FREIGHTLINER FL330', N'MBE800', N'Diesel', 260000, 10, 9)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (11, N'Long', N'Tractor Trailer', N'1125195', N'OKC 195', N'2007 FREIGHTLINER M3 106', N'ISC', N'Diesel', 215000, 11, 13)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (12, N'Long', N'Tractor Trailer', N'1027014', N'BAL 014', N'2010 INTERNATIONAL', N'MaxxforceDT', N'Diesel', 196000, 12, 7)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (13, N'Long', N'Tractor Trailer', N'7455016', N'CAT 016', N'2004 FREIGHTLINER FLD160', N'Series 60', N'Diesel', 222000, 13, 11)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (14, N'Long', N'Tractor Trailer', N'9951332', N'MRY 332', N'2003 FREIGHTLINER F60', N'MBE960', N'Diesel', 189000, 14, 12)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (15, N'Long', N'Tractor Trailer', N'8899216', N'SND 216', N'2013 WESTERN STAR', N'DD13', N'Diesel', 201000, 15, 10)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (16, N'Long', N'Tractor Trailer', N'12635', N'NEW 043', N'2014 FREIGHTLINER 053', N'DD15', N'Diesel', 230126, 17, 1)
INSERT [dbo].[TruckInformation] ([TruckID], [TruckType], [TruckBodyType], [TruckNumber], [TruckLicenseNumber], [TruckDescription], [TruckEngineType], [TruckFuelType], [TruckCurrentMileage], [DriverID], [TrailerInformationID]) VALUES (17, N'Short', N'Single', N'2231528', N'VIS 627', N'2015 FREIGHTLINER 115', N'DD15', N'Diesel', 230169, 18, NULL)
SET IDENTITY_INSERT [dbo].[TruckInformation] OFF
SET IDENTITY_INSERT [dbo].[TruckMaintenance] ON 

INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (1, CAST(N'2016-01-12' AS Date), CAST(N'2016-01-26' AS Date), 1, 2, 1)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (2, CAST(N'2016-02-04' AS Date), CAST(N'2016-02-14' AS Date), 3, 1, 2)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (3, CAST(N'2016-03-04' AS Date), CAST(N'2016-03-24' AS Date), 2, 2, 2)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (4, CAST(N'2016-04-18' AS Date), CAST(N'2016-04-24' AS Date), 4, 1, 3)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (5, CAST(N'2016-05-03' AS Date), CAST(N'2016-05-23' AS Date), 5, 2, 5)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (6, CAST(N'2016-05-24' AS Date), CAST(N'2016-06-10' AS Date), 1, 2, 6)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (7, CAST(N'2016-05-25' AS Date), CAST(N'2016-05-29' AS Date), 5, 2, 7)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (8, CAST(N'2016-05-29' AS Date), CAST(N'2016-06-05' AS Date), 6, 1, 8)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (9, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-03' AS Date), 3, 1, 9)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (10, CAST(N'2016-06-03' AS Date), CAST(N'2016-06-12' AS Date), 4, 2, 10)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (11, CAST(N'2016-06-24' AS Date), CAST(N'2016-06-30' AS Date), 2, 2, 11)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (12, CAST(N'2016-07-05' AS Date), CAST(N'2016-07-10' AS Date), 5, 1, 12)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (13, CAST(N'2016-07-05' AS Date), CAST(N'2016-07-30' AS Date), 7, 2, 13)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (14, CAST(N'2016-07-11' AS Date), CAST(N'2016-07-21' AS Date), 1, 2, 14)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (15, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-28' AS Date), 1, 1, 15)
INSERT [dbo].[TruckMaintenance] ([TruckMainenanceID], [MaintenanceStartDate], [MaintenanceEndDate], [MaintenanceTypeID], [MaintenanceCodeID], [TruckID]) VALUES (16, CAST(N'2016-08-10' AS Date), CAST(N'2016-08-15' AS Date), 4, 2, 16)
SET IDENTITY_INSERT [dbo].[TruckMaintenance] OFF
ALTER TABLE [dbo].[HaulManifest]  WITH CHECK ADD  CONSTRAINT [FK_HaulManifest_HaulRecord] FOREIGN KEY([HaulRecordID])
REFERENCES [dbo].[HaulRecord] ([HaulRecordID])
GO
ALTER TABLE [dbo].[HaulManifest] CHECK CONSTRAINT [FK_HaulManifest_HaulRecord]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_TruckInformation] FOREIGN KEY([TruckUsedID])
REFERENCES [dbo].[TruckInformation] ([TruckID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_TruckInformation]
GO
ALTER TABLE [dbo].[TruckInformation]  WITH CHECK ADD  CONSTRAINT [FK_TruckInformation_DriverDemographicInformation1] FOREIGN KEY([DriverID])
REFERENCES [dbo].[DriverDemographicInformation] ([DriverID])
GO
ALTER TABLE [dbo].[TruckInformation] CHECK CONSTRAINT [FK_TruckInformation_DriverDemographicInformation1]
GO
ALTER TABLE [dbo].[TruckInformation]  WITH CHECK ADD  CONSTRAINT [FK_TruckInformation_TrailerInformation] FOREIGN KEY([TrailerInformationID])
REFERENCES [dbo].[TrailerInformation] ([TrailerInformationID])
GO
ALTER TABLE [dbo].[TruckInformation] CHECK CONSTRAINT [FK_TruckInformation_TrailerInformation]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_TruckInformation] FOREIGN KEY([TruckID])
REFERENCES [dbo].[TruckInformation] ([TruckID])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_TruckInformation]
GO
/****** Object:  StoredProcedure [dbo].[ClientDateDeliveredSearch]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClientDateDeliveredSearch] (@Char VARCHAR(20), @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT  HR.HaulRecordID, HR.Client, HM.Item, HM.ItemDescription, HR.DateDelivered, D.DriverID, T.TruckID
FROM HaulRecord AS HR
JOIN HaulManifest AS HM
ON HR.HaulRecordID = HM.HaulRecordID
JOIN TruckInformation AS T
ON HR.TruckUsedID = T.TruckID
JOIN DriverDemographicInformation AS D
ON D.DriverID = T.DriverID					 /* SQL Statement using SQL Wildcard */
WHERE HR.Client LIKE @Char AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate 
ORDER BY HR.CLIENT

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDriverID]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDriverID] (@BeginDate DATE, @EndDate DATE)
AS
BEGIN
	DELETE FROM DriverDemographicInformation WHERE DateOfHire BETWEEN @BeginDate AND @EndDate
END;
GO
/****** Object:  StoredProcedure [dbo].[HaulRecordDateRange]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HaulRecordDateRange] (@TruckID INT, @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT T.TruckID, D.DriverID, HR.Client, HR.CargoTypeID, LU.CargoType, HR.DateHaulBegan, HR.DateDelivered, HR.Mileage, HR.HaulNotes
FROM TruckInformation AS T
JOIN DriverDemographicInformation as D
ON T.TruckID = D.DriverID
JOIN HaulRecord AS HR
ON T.TruckID = HR.TruckUsedID
JOIN LUCargoType AS LU
ON HR.CargoTypeID = LU.CargoTypeID
WHERE T.TruckID = @TruckID AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate
ORDER BY HR.HaulRecordID

END

GO
/****** Object:  StoredProcedure [dbo].[HaulRecordManifestDateRange]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HaulRecordManifestDateRange] (@TruckID INT, @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT T.TruckID, D.DriverID, HR.Client, HR.CargoTypeID, LU.CargoType, HR.DateHaulBegan, HR.DateDelivered, HR.Mileage, HR.HaulNotes,
HM.Item, HM.ItemDescription, HM.ItemWeightPerUnit, HM.Quantity
FROM TruckInformation AS T
JOIN DriverDemographicInformation AS D
ON T.DriverID = D.DriverID
JOIN HaulRecord AS HR
ON T.TruckID = HR.TruckUsedID 
JOIN HaulManifest AS HM
ON HR.HaulRecordID = HM.HaulRecordID
JOIN LUCargoType AS LU
ON LU.CargoTypeID = HR.CargoTypeID
WHERE T.TruckID = @TruckID AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate
ORDER BY HR.HaulRecordID

END

GO
/****** Object:  StoredProcedure [dbo].[InsertDriverInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertDriverInformation] (@Name VARCHAR(50),@DateOfBirth DATE, @EmployeeNumber INT, @DateOfHire DATE, @CommercialDriverLicense BIT)
AS
BEGIN

BEGIN TRANSACTION;

INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES (@Name,@DateOfBirth,@EmployeeNumber,@DateOfHire,@CommercialDriverLicense);

COMMIT TRANSACTION;

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertHaulManifest]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHaulManifest] (@Item VARCHAR(50),@ItemDescription VARCHAR(200),@ItemWeightPerUnit DECIMAL(10,2),@Quantity INT,@HaulRecordID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO HaulManifest(Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) 
     VALUES (@Item,@ItemDescription,@ItemWeightPerUnit,@Quantity,@HaulRecordID)
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertHaulRecord]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHaulRecord] (@TruckUsedID INT ,@Client VARCHAR(200) ,@CargoTypeID INT,@DateHaulBegan DATETIME,@DateDelivered DATETIME,@Mileage BIGINT,@HaulNotes VARCHAR(200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) 
     VALUES (@TruckUsedID,@Client,@CargoTypeID,@DateHaulBegan,@DateDelivered,@Mileage,@HaulNotes)
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertLUCargoType]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLUCargoType] (@CargoType VARCHAR (20), @CargoTypeDescription VARCHAR (200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO LUCargoType(CargoType, CargoTypeDescription) 
     VALUES (@CargoType, @CargoTypeDescription);
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertLUTrailerType]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertLUTrailerType] (@TrailerTypeAbbreviation VARCHAR (20), @TrailerTypeDescription VARCHAR (200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO LUTrailerType(TrailerTypeAbbreviation, TrailerTypeDescription) 
     VALUES (@TrailerTypeAbbreviation, @TrailerTypeDescription);
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertTrailerInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTrailerInformation] (@TrailerCapacity INT,@TrailerTypeID INT,@TrailerMileage BIGINT,@TrailerDescription VARCHAR(200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (@TrailerCapacity,@TrailerTypeID,@TrailerMileage,@TrailerDescription)
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertTruckInformation]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTruckInformation] (@TruckType VARCHAR(20),@TruckBodyType VARCHAR(20),@TruckNumber VARCHAR(20),@TruckLicenseNumber VARCHAR(20),@TruckDescription VARCHAR(50),@TruckEngineType VARCHAR(20),@TruckFuelType VARCHAR(20),@TruckCurrentMileage BIGINT, @DriverID INT, @TrailerInformationID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES (@TruckType,@TruckBodyType,@TruckNumber,@TruckLicenseNumber,@TruckDescription,@TruckEngineType,@TruckFuelType,@TruckCurrentMileage,@DriverID,@TrailerInformationID)
COMMIT TRANSACTION;
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertTruckMaintenance]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTruckMaintenance] (@MaintenanceStartDate DATE,@MaintenanceEndDate DATE,@MaintenanceTypeID INT,@MaintenanceCodeID INT,@TruckID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES (@MaintenanceStartDate,@MaintenanceEndDate,@MaintenanceTypeID,@MaintenanceCodeID,@TruckID)
COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[TruckMaintenanceDateRange]    Script Date: 10/10/2016 8:45:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TruckMaintenanceDateRange] (@BeginDate DATE, @EndDate DATE)

AS

BEGIN

SELECT T.TruckID, T.TruckType, M.MaintenanceStartDate, M.MaintenanceEndDate, 
M.MaintenanceTypeID, LUT.MaintenanceType, M.MaintenanceCodeID, LUC.MaintenanceCode
FROM TruckInformation AS T
JOIN TruckMaintenance AS M
ON T.TruckID = M.TruckID
JOIN LUMaintenanceType AS LUT
ON M.MaintenanceTypeID = LUT.MaintenanceTypeID
JOIN LUMaintenanceCode AS LUC
ON M.MaintenanceCodeID = LUC.MaintenanceCodeID
WHERE M.MaintenanceStartDate BETWEEN @BeginDate AND @EndDate
ORDER BY T.TruckType

END
GO
USE [master]
GO
ALTER DATABASE [XYZ Trucking] SET  READ_WRITE 
GO
