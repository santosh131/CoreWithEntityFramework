USE [master]
GO
/****** Object:  Database [employee]    Script Date: 4/25/2024 11:03:31 AM ******/
CREATE DATABASE [employee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'employee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\employee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'employee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\employee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [employee] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [employee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [employee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [employee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [employee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [employee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [employee] SET ARITHABORT OFF 
GO
ALTER DATABASE [employee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [employee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [employee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [employee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [employee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [employee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [employee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [employee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [employee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [employee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [employee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [employee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [employee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [employee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [employee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [employee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [employee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [employee] SET RECOVERY FULL 
GO
ALTER DATABASE [employee] SET  MULTI_USER 
GO
ALTER DATABASE [employee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [employee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [employee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [employee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [employee] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'employee', N'ON'
GO
ALTER DATABASE [employee] SET QUERY_STORE = OFF
GO
USE [employee]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[address1] [varchar](255) NULL,
	[address2] [varchar](255) NULL,
	[city] [varchar](100) NULL,
	[state_province] [varchar](100) NULL,
	[country] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[postal_code] [varchar](20) NULL,
	[country_code] [varchar](10) NULL,
	[fax] [varchar](20) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [char](2) NOT NULL,
	[country_name] [varchar](40) NULL,
	[region_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](30) NOT NULL,
	[location_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dependents]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dependents](
	[dependent_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[relationship] [varchar](25) NOT NULL,
	[employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dependent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [int] NOT NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [varchar](35) NOT NULL,
	[min_salary] [decimal](8, 2) NULL,
	[max_salary] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[street_address] [varchar](40) NULL,
	[postal_code] [varchar](12) NULL,
	[city] [varchar](30) NOT NULL,
	[state_province] [varchar](25) NULL,
	[country_id] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 4/25/2024 11:03:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[region_id] [int] IDENTITY(1,1) NOT NULL,
	[region_name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([address_id], [address1], [address2], [city], [state_province], [country], [phone], [postal_code], [country_code], [fax], [employee_id]) VALUES (1, N'123 st', N'st3', N'NY', N'NY', N'USA', N'1234567890', N'5000', N'001', NULL, 100)
SET IDENTITY_INSERT [dbo].[Address] OFF
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'AR', N'Argentina', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'AU', N'Australia', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'BE', N'Belgium', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'BR', N'Brazil', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CA', N'Canada', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CH', N'Switzerland', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'CN', N'China', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'DE', N'Germany', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'DK', N'Denmark', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'EG', N'Egypt', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'FR', N'France', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'HK', N'HongKong', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IL', N'Israel', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IN', N'India', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'IT', N'Italy', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'JP', N'Japan', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'KW', N'Kuwait', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'MX', N'Mexico', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'NG', N'Nigeria', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'NL', N'Netherlands', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'SG', N'Singapore', 3)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'UK', N'United Kingdom', 1)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'US', N'United States of America', 2)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'ZM', N'Zambia', 4)
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'ZW', N'Zimbabwe', 4)
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (1, N'Administration', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (2, N'Marketing', 1800)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (3, N'Purchasing', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (4, N'Human Resources', 2400)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (5, N'Shipping', 1500)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (6, N'IT', 1400)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (7, N'Public Relations', 2700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (8, N'Sales', 2500)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (9, N'Executive', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (10, N'Finance', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (11, N'Accounting', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (13, N'test 13', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (99, N'TestDepartment', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (100, N'TestDepartment', 1700)
INSERT [dbo].[departments] ([department_id], [department_name], [location_id]) VALUES (101, N'TestDepartment2', 1700)
SET IDENTITY_INSERT [dbo].[departments] OFF
SET IDENTITY_INSERT [dbo].[dependents] ON 

INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (1, N'Penelope', N'Gietz', N'Child', 206)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (2, N'Nick', N'Higgins', N'Child', 205)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (3, N'Ed', N'Whalen', N'Child', 200)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (4, N'Jennifer', N'King', N'Child', 100)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (5, N'Johnny', N'Kochhar', N'Child', 101)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (6, N'Bette', N'De Haan', N'Child', 102)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (7, N'Grace', N'Faviet', N'Child', 109)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (8, N'Matthew', N'Chen', N'Child', 110)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (9, N'Joe', N'Sciarra', N'Child', 111)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (10, N'Christian', N'Urman', N'Child', 112)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (11, N'Zero', N'Popp', N'Child', 113)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (12, N'Karl', N'Greenberg', N'Child', 108)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (13, N'Uma', N'Mavris', N'Child', 203)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (14, N'Vivien', N'Hunold', N'Child', 103)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (15, N'Cuba', N'Ernst', N'Child', 104)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (16, N'Fred', N'Austin', N'Child', 105)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (17, N'Helen', N'Pataballa', N'Child', 106)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (18, N'Dan', N'Lorentz', N'Child', 107)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (19, N'Bob', N'Hartstein', N'Child', 201)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (20, N'Lucille', N'Fay', N'Child', 202)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (21, N'Kirsten', N'Baer', N'Child', 204)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (22, N'Elvis', N'Khoo', N'Child', 115)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (23, N'Sandra', N'Baida', N'Child', 116)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (24, N'Cameron', N'Tobias', N'Child', 117)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (25, N'Kevin', N'Himuro', N'Child', 118)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (26, N'Rip', N'Colmenares', N'Child', 119)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (27, N'Julia', N'Raphaely', N'Child', 114)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (28, N'Woody', N'Russell', N'Child', 145)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (29, N'Alec', N'Partners', N'Child', 146)
INSERT [dbo].[dependents] ([dependent_id], [first_name], [last_name], [relationship], [employee_id]) VALUES (30, N'Sandra', N'Taylor', N'Child', 176)
SET IDENTITY_INSERT [dbo].[dependents] OFF
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (100, N'Steven', N'King', N'steven.king@sqltutorial.org', N'515.123.4567', CAST(N'1987-06-17' AS Date), 4, CAST(24000.00 AS Decimal(8, 2)), NULL, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (101, N'Neena', N'Kochhar', N'neena.kochhar@sqltutorial.org', N'515.123.4568', CAST(N'1989-09-21' AS Date), 5, CAST(17000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (102, N'Lex', N'De Haan', N'lex.de haan@sqltutorial.org', N'515.123.4569', CAST(N'1993-01-13' AS Date), 5, CAST(17000.00 AS Decimal(8, 2)), 100, 9)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (103, N'Alexander', N'Hunold', N'alexander.hunold@sqltutorial.org', N'590.423.4567', CAST(N'1990-01-03' AS Date), 9, CAST(9000.00 AS Decimal(8, 2)), 102, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (104, N'Bruce', N'Ernst', N'bruce.ernst@sqltutorial.org', N'590.423.4568', CAST(N'1991-05-21' AS Date), 9, CAST(6000.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (105, N'David', N'Austin', N'david.austin@sqltutorial.org', N'590.423.4569', CAST(N'1997-06-25' AS Date), 9, CAST(4800.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (106, N'Valli', N'Pataballa', N'valli.pataballa@sqltutorial.org', N'590.423.4560', CAST(N'1998-02-05' AS Date), 9, CAST(4800.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (107, N'Diana', N'Lorentz', N'diana.lorentz@sqltutorial.org', N'590.423.5567', CAST(N'1999-02-07' AS Date), 9, CAST(4200.00 AS Decimal(8, 2)), 103, 6)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (108, N'Nancy', N'Greenberg', N'nancy.greenberg@sqltutorial.org', N'515.124.4569', CAST(N'1994-08-17' AS Date), 7, CAST(12000.00 AS Decimal(8, 2)), 101, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (109, N'Daniel', N'Faviet', N'daniel.faviet@sqltutorial.org', N'515.124.4169', CAST(N'1994-08-16' AS Date), 6, CAST(9000.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (110, N'John', N'Chen', N'john.chen@sqltutorial.org', N'515.124.4269', CAST(N'1997-09-28' AS Date), 6, CAST(8200.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (111, N'Ismael', N'Sciarra', N'ismael.sciarra@sqltutorial.org', N'515.124.4369', CAST(N'1997-09-30' AS Date), 6, CAST(7700.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (112, N'Jose Manuel', N'Urman', N'jose manuel.urman@sqltutorial.org', N'515.124.4469', CAST(N'1998-03-07' AS Date), 6, CAST(7800.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (113, N'Luis', N'Popp', N'luis.popp@sqltutorial.org', N'515.124.4567', CAST(N'1999-12-07' AS Date), 6, CAST(6900.00 AS Decimal(8, 2)), 108, 10)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (114, N'Den', N'Raphaely', N'den.raphaely@sqltutorial.org', N'515.127.4561', CAST(N'1994-12-07' AS Date), 14, CAST(11000.00 AS Decimal(8, 2)), 100, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (115, N'Alexander', N'Khoo', N'alexander.khoo@sqltutorial.org', N'515.127.4562', CAST(N'1995-05-18' AS Date), 13, CAST(3100.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (116, N'Shelli', N'Baida', N'shelli.baida@sqltutorial.org', N'515.127.4563', CAST(N'1997-12-24' AS Date), 13, CAST(2900.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (117, N'Sigal', N'Tobias', N'sigal.tobias@sqltutorial.org', N'515.127.4564', CAST(N'1997-07-24' AS Date), 13, CAST(2800.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (118, N'Guy', N'Himuro', N'guy.himuro@sqltutorial.org', N'515.127.4565', CAST(N'1998-11-15' AS Date), 13, CAST(2600.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (119, N'Karen', N'Colmenares', N'karen.colmenares@sqltutorial.org', N'515.127.4566', CAST(N'1999-08-10' AS Date), 13, CAST(2500.00 AS Decimal(8, 2)), 114, 3)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (120, N'Matthew', N'Weiss', N'matthew.weiss@sqltutorial.org', N'650.123.1234', CAST(N'1996-07-18' AS Date), 19, CAST(8000.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (121, N'Adam', N'Fripp', N'adam.fripp@sqltutorial.org', N'650.123.2234', CAST(N'1997-04-10' AS Date), 19, CAST(8200.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (122, N'Payam', N'Kaufling', N'payam.kaufling@sqltutorial.org', N'650.123.3234', CAST(N'1995-05-01' AS Date), 19, CAST(7900.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (123, N'Shanta', N'Vollman', N'shanta.vollman@sqltutorial.org', N'650.123.4234', CAST(N'1997-10-10' AS Date), 19, CAST(6500.00 AS Decimal(8, 2)), 100, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (126, N'Irene', N'Mikkilineni', N'irene.mikkilineni@sqltutorial.org', N'650.124.1224', CAST(N'1998-09-28' AS Date), 18, CAST(2700.00 AS Decimal(8, 2)), 120, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (145, N'John', N'Russell', N'john.russell@sqltutorial.org', NULL, CAST(N'1996-10-01' AS Date), 15, CAST(14000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (146, N'Karen', N'Partners', N'karen.partners@sqltutorial.org', NULL, CAST(N'1997-01-05' AS Date), 15, CAST(13500.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (176, N'Jonathon', N'Taylor', N'jonathon.taylor@sqltutorial.org', NULL, CAST(N'1998-03-24' AS Date), 16, CAST(8600.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (177, N'Jack', N'Livingston', N'jack.livingston@sqltutorial.org', NULL, CAST(N'1998-04-23' AS Date), 16, CAST(8400.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (178, N'Kimberely', N'Grant', N'kimberely.grant@sqltutorial.org', NULL, CAST(N'1999-05-24' AS Date), 16, CAST(7000.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (179, N'Charles', N'Johnson', N'charles.johnson@sqltutorial.org', NULL, CAST(N'2000-01-04' AS Date), 16, CAST(6200.00 AS Decimal(8, 2)), 100, 8)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (192, N'Sarah', N'Bell', N'sarah.bell@sqltutorial.org', N'650.501.1876', CAST(N'1996-02-04' AS Date), 17, CAST(4000.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (193, N'Britney', N'Everett', N'britney.everett@sqltutorial.org', N'650.501.2876', CAST(N'1997-03-03' AS Date), 17, CAST(3900.00 AS Decimal(8, 2)), 123, 5)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (200, N'Jennifer', N'Whalen', N'jennifer.whalen@sqltutorial.org', N'515.123.4444', CAST(N'1987-09-17' AS Date), 3, CAST(4400.00 AS Decimal(8, 2)), 101, 1)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (201, N'Michael', N'Hartstein', N'michael.hartstein@sqltutorial.org', N'515.123.5555', CAST(N'1996-02-17' AS Date), 10, CAST(13000.00 AS Decimal(8, 2)), 100, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (202, N'Pat', N'Fay', N'pat.fay@sqltutorial.org', N'603.123.6666', CAST(N'1997-08-17' AS Date), 11, CAST(6000.00 AS Decimal(8, 2)), 201, 2)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (203, N'Susan', N'Mavris', N'susan.mavris@sqltutorial.org', N'515.123.7777', CAST(N'1994-06-07' AS Date), 8, CAST(6500.00 AS Decimal(8, 2)), 101, 4)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (204, N'Hermann', N'Baer', N'hermann.baer@sqltutorial.org', N'515.123.8888', CAST(N'1994-06-07' AS Date), 12, CAST(10000.00 AS Decimal(8, 2)), 101, 7)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (205, N'Shelley', N'Higgins', N'shelley.higgins@sqltutorial.org', N'515.123.8080', CAST(N'1994-06-07' AS Date), 2, CAST(12000.00 AS Decimal(8, 2)), 101, 11)
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [salary], [manager_id], [department_id]) VALUES (206, N'William', N'Gietz', N'william.gietz@sqltutorial.org', N'515.123.8181', CAST(N'1994-06-07' AS Date), 1, CAST(8300.00 AS Decimal(8, 2)), 205, 11)
SET IDENTITY_INSERT [dbo].[employees] OFF
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (1, N'Public Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (2, N'Accounting Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (3, N'Administration Assistant', CAST(3000.00 AS Decimal(8, 2)), CAST(6000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (4, N'President', CAST(20000.00 AS Decimal(8, 2)), CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (5, N'Administration Vice President', CAST(15000.00 AS Decimal(8, 2)), CAST(30000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (6, N'Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (7, N'Finance Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (8, N'Human Resources Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (9, N'Programmer', CAST(4000.00 AS Decimal(8, 2)), CAST(10000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (10, N'Marketing Manager', CAST(9000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (11, N'Marketing Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (12, N'Public Relations Representative', CAST(4500.00 AS Decimal(8, 2)), CAST(10500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (13, N'Purchasing Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (14, N'Purchasing Manager', CAST(8000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (15, N'Sales Manager', CAST(10000.00 AS Decimal(8, 2)), CAST(20000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (16, N'Sales Representative', CAST(6000.00 AS Decimal(8, 2)), CAST(12000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (17, N'Shipping Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (18, N'Stock Clerk', CAST(2000.00 AS Decimal(8, 2)), CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (19, N'Stock Manager', CAST(5500.00 AS Decimal(8, 2)), CAST(8500.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[jobs] OFF
SET IDENTITY_INSERT [dbo].[locations] ON 

INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1400, N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1500, N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1700, N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', N'US')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1800, N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', N'CA')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2400, N'8204 Arthur St', NULL, N'London', NULL, N'UK')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2500, N'Magdalen Centre, The Oxford Science Park', N'OX9 9ZB', N'Oxford', N'Oxford', N'UK')
INSERT [dbo].[locations] ([location_id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2700, N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', N'DE')
SET IDENTITY_INSERT [dbo].[locations] OFF
SET IDENTITY_INSERT [dbo].[regions] ON 

INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (1, N'Europe')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (2, N'Americas')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (3, N'Asia')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (4, N'Middle East and Africa')
SET IDENTITY_INSERT [dbo].[regions] OFF
ALTER TABLE [dbo].[countries] ADD  DEFAULT (NULL) FOR [country_name]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (NULL) FOR [location_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [manager_id]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT (NULL) FOR [department_id]
GO
ALTER TABLE [dbo].[jobs] ADD  DEFAULT (NULL) FOR [min_salary]
GO
ALTER TABLE [dbo].[jobs] ADD  DEFAULT (NULL) FOR [max_salary]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [street_address]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[locations] ADD  DEFAULT (NULL) FOR [state_province]
GO
ALTER TABLE [dbo].[regions] ADD  DEFAULT (NULL) FOR [region_name]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[countries]  WITH CHECK ADD FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([region_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dependents]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [employee] SET  READ_WRITE 
GO
