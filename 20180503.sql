USE [master]
GO
/****** Object:  Database [Hospital_Portal]    Script Date: 5/3/18 1:33:58 AM ******/
CREATE DATABASE [Hospital_Portal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital_Postal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital_Postal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_Postal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital_Postal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital_Portal] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital_Portal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital_Portal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital_Portal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital_Portal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital_Portal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital_Portal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital_Portal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital_Portal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital_Portal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital_Portal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital_Portal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital_Portal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital_Portal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital_Portal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital_Portal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital_Portal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital_Portal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital_Portal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital_Portal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital_Portal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital_Portal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital_Portal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital_Portal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital_Portal] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital_Portal] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital_Portal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital_Portal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital_Portal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital_Portal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hospital_Portal] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hospital_Portal]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[MeetingId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[MeetingName] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[Duration] [time](7) NULL,
	[Date] [date] NOT NULL,
	[Content] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[MeetingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mission]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mission](
	[MissionId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Place] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Createby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Updateby] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Mission] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MissionWorker]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionWorker](
	[MissionWorkerId] [int] IDENTITY(1,1) NOT NULL,
	[MissionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_MissionWorker] PRIMARY KEY CLUSTERED 
(
	[MissionWorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationName] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NOT NULL,
	[RoomSize] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftNO] [int] NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[ShiftDayID] [int] NOT NULL,
	[Other] [nvarchar](300) NULL,
 CONSTRAINT [PK_WorkShift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftDay]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftDay](
	[ShiftDayID] [int] IDENTITY(1,1) NOT NULL,
	[ShiftDay] [nvarchar](50) NOT NULL,
	[DayInWeek] [nvarchar](50) NOT NULL,
	[ShiftScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_WorkDay] PRIMARY KEY CLUSTERED 
(
	[ShiftDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftSchedule]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftSchedule](
	[ShiftScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Createby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Updateby] [int] NOT NULL,
	[Week] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ShiftSchedule] PRIMARY KEY CLUSTERED 
(
	[ShiftScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftSchedulerManager]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftSchedulerManager](
	[Week] [nvarchar](10) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Waiting] [int] NOT NULL,
	[Checked] [int] NULL,
 CONSTRAINT [PK_ShiftSchedulerManager] PRIMARY KEY CLUSTERED 
(
	[Week] ASC,
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShiftWorker]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftWorker](
	[ShiftWorkerId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ShiftWorker] PRIMARY KEY CLUSTERED 
(
	[ShiftWorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/3/18 1:33:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Avatar] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](50) NOT NULL,
	[DayOfBirth] [date] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](600) NULL,
	[Certificate] [nvarchar](600) NULL,
	[Status] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (1, N'BOARD OF DIRECTOR', N'A board of directors is a recognized group of people who jointly oversee the activities of an organization, which can be either a for-profit business, nonprofit organization, or a government agency.', 1, N'D0')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (2, N'GENERAL PLANNING DEPARTMENT', N'A general plan is a broad planning guideline to a city''s or county''s future development goals and provides policy statements to achieve those development goals.', 1, N'D1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (3, N'NURSING DEPARTMENT ', N'The Department of Nursing, in accord with CCSU, believes that the primary goal of the nursing faculty is to empower the BSN student to attain the highest standards of professional achievement, public service, and personal development. ', 1, N'D2')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (4, N'PSYCHOLOGY DEPARTMEN', N'The Department of Psychology at Stanford University is devoted to training scientists who will work to advance theory and to create knowledge that helps us address real-world problems. Accomplishing this mission requires a broad range of perspectives and backgrounds.', 1, N'D3')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (5, N'OUTPATIENT DEPARTMENT', N'An outpatient department or outpatient clinic is the part of a hospital designed for the treatment of outpatients, people with health problems who visit the hospital for diagnosis or treatment, but do not at this time require a bed or to be admitted for overnight care.', 1, N'D4')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (6, N'DEPARTMENT OF CHILD HEALTHCARE', N'Children with Special Health Care Needs. The Children with Special Health Care Needs Program is in the Healthy Starts and Transitions unit in the Office of Healthy Communities at the Department of Health.', 1, N'D5')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (7, N'EMERGENCY DEPARTMENT', N'An emergency department (ED), also known as an accident & emergency department (A&E), emergency room (ER), emergency ward (EW) or casualty department, is a medical treatment facility specializing in emergency medicine, the acute care of patients who present without prior appointment', 1, N'D6')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (8, N'PEDIATRIC DEPARTMENT', N'Pediatrics is the branch of medicine that involves the medical care of infants, children, and adolescents. The American Academy of Pediatrics recommends people be under pediatric care up to the age of 21. ', 1, N'P1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (12, N'GENERAL SURGERY DEPARTMENT', N'General surgery is a surgical specialty that focuses on abdominal contents including esophagus, stomach, small bowel, colon, liver, pancreas, gallbladder, appendix and bile ducts, and often the thyroid gland', 1, N'G1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (13, N'ENT – EYE – ODONTOLOGY DEPARTMENT', N'The Department of Otolaryngology at New York Eye and Ear Infirmary of Mount Sinai provides a full range of services for all conditions of the ear, nose, throat, sinuses, head and neck. ', 1, N'E1')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Meeting] ON 

INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (1, 1, N'Improve skill meeting', CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(N'2018-05-01' AS Date), N'Improve skill meeting', N'Improve skill meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (2, 2, N'Capston meeting', CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(N'2018-04-02' AS Date), N'Capston meeting', N'Capston meeting', 2, CAST(N'2018-04-01 23:47:21.000' AS DateTime), 2, CAST(N'2018-04-03 17:22:43.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (3, 1, N'Weekly meeting', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time), CAST(N'2018-04-13' AS Date), N'Weekly meeting', N'Weekly meeting', 2, CAST(N'2018-04-02 13:28:38.000' AS DateTime), 2, CAST(N'2018-04-02 13:28:58.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (4, 1, N'Weekly Meeting', CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), CAST(N'2018-04-21' AS Date), N'Weekly Meeting', N'Weekly meeting', 2, CAST(N'2018-04-03 17:22:34.000' AS DateTime), 2, CAST(N'2018-04-15 20:37:57.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (5, 1, N'Weekly Meeting', CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time), CAST(N'2018-04-29' AS Date), N'Weekly Meeting', N'Weekly meeting', 2, CAST(N'2018-04-03 17:23:42.000' AS DateTime), 2, CAST(N'2018-04-03 17:24:46.000' AS DateTime), 3)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (6, 1, N'Weekly Meeting', CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'2018-04-29' AS Date), N'Weekly Meeting', N'Weekly meeting', 2, CAST(N'2018-04-03 17:26:00.000' AS DateTime), 2, CAST(N'2018-04-08 22:35:14.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (7, 2, N'Meeting', CAST(N'06:00:00' AS Time), CAST(N'08:30:00' AS Time), CAST(N'2018-04-26' AS Date), N'Meeting', N'Meeting', 2, CAST(N'2018-04-23 07:50:15.000' AS DateTime), 2, CAST(N'2018-04-26 22:54:49.000' AS DateTime), 3)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (8, 10, N'Daily meeting', CAST(N'01:30:00' AS Time), CAST(N'02:20:00' AS Time), CAST(N'2018-05-05' AS Date), N'Daily meeting', N'Daily meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (9, 5, N'Daily meeting', CAST(N'02:30:00' AS Time), CAST(N'03:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Daily meeting', N'Daily meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (10, 5, N'Board meeting', CAST(N'02:30:00' AS Time), CAST(N'03:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Board meeting', N'Board meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (11, 5, N'Investigative meeting', CAST(N'02:30:00' AS Time), CAST(N'03:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Investigative meeting', N'Investigative meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (12, 2, N'Interview ', CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Interview ', N'You should carry pen and notebook', 2, CAST(N'2018-04-27 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-27 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (13, 4, N'Daily meeting', CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Daily meeting', N'Daily meeting', 2, CAST(N'2018-04-28 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-28 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (14, 5, N'Investigative meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-10' AS Date), N'Investigative meeting', N'Investigative meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (15, 5, N'Committee meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-10' AS Date), N'Committee meeting', N'Committee meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (16, 5, N'Committee meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-20' AS Date), N'Committee meeting', N'Committee meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (17, 5, N'One-on-one meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-20' AS Date), N'One-on-one meeting', N'One-on-one meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (18, 5, N'One-on-one meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-20' AS Date), N'One-on-one meeting', N'One-on-one meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (19, 3, N'Staff meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-20' AS Date), N'Staff meeting', N'Staff meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (20, 4, N'Staff meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-20' AS Date), N'Staff meeting', N'Staff meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (21, 4, N'Team meeting', CAST(N'02:30:00' AS Time), CAST(N'04:30:00' AS Time), CAST(N'2018-05-25' AS Date), N'Team meeting', N'Team meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Meeting] OFF
SET IDENTITY_INSERT [dbo].[Mission] ON 

INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (1, CAST(N'2018-05-14' AS Date), CAST(N'2018-05-18' AS Date), N'Ha Noi', N'Improve skill meeting', N'Improve skill meeting', 3, 2, CAST(N'2018-03-30 02:04:05.000' AS DateTime), 2, CAST(N'2018-04-07 23:57:18.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (2, CAST(N'2018-05-04' AS Date), CAST(N'2018-05-20' AS Date), N'Ha Noi', N'Improve skill meeting', N'Improve skill meeting', 2, 2, CAST(N'2018-04-02 13:31:15.000' AS DateTime), 2, CAST(N'2018-04-23 07:47:50.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (3, CAST(N'2018-05-01' AS Date), CAST(N'2018-05-07' AS Date), N'Campuchia', N'Staff meeting', N'Staff meeting', 2, 2, CAST(N'2018-04-03 16:34:32.000' AS DateTime), 2, CAST(N'2018-04-03 21:40:05.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (4, CAST(N'2018-05-01' AS Date), CAST(N'2018-05-05' AS Date), N'NewYork', N'Staff meeting', N'Staff meeting', 2, 4, CAST(N'2018-04-09 13:51:01.000' AS DateTime), 4, CAST(N'2018-04-26 22:55:15.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (5, CAST(N'2018-05-15' AS Date), CAST(N'2018-05-20' AS Date), N'HCM', N'Staff meeting', N'Staff meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-23 07:47:09.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (6, CAST(N'2018-05-16' AS Date), CAST(N'2018-05-24' AS Date), N'HCM', N'Improve skill meeting', N'Improve skill meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:52:55.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (7, CAST(N'2018-05-17' AS Date), CAST(N'2018-05-24' AS Date), N'Vinh Long', N'Committee meeting', N'Committee meeting', 2, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:04.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (8, CAST(N'2018-05-18' AS Date), CAST(N'2018-05-24' AS Date), N'Da Lat', N'Committee meeting', N'Committee meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:11.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (9, CAST(N'2018-05-19' AS Date), CAST(N'2018-05-24' AS Date), N'Lam Dong', N'Committee meeting', N'Committee meeting', 2, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:19.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (10, CAST(N'2018-05-20' AS Date), CAST(N'2018-05-24' AS Date), N'Hai Duong', N'Interview', N'Interview ', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:29.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (11, CAST(N'2018-05-21' AS Date), CAST(N'2018-05-26' AS Date), N'Ha noi', N'Interview', N'Interview ', 2, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:36.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (12, CAST(N'2018-05-22' AS Date), CAST(N'2018-05-26' AS Date), N'HCM', N'Interview', N'Interview ', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:44.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (13, CAST(N'2018-05-23' AS Date), CAST(N'2018-05-26' AS Date), N'Tra Vinh', N'Interview', N'Interview ', 2, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:51.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (14, CAST(N'2018-05-24' AS Date), CAST(N'2018-05-26' AS Date), N'Long An', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:52:45.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (15, CAST(N'2018-05-25' AS Date), CAST(N'2018-05-26' AS Date), N'Mong Cai', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-05-03 01:30:24.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (16, CAST(N'2018-05-26' AS Date), CAST(N'2018-05-31' AS Date), N'L.A', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:53:59.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (17, CAST(N'2018-05-27' AS Date), CAST(N'2018-05-13' AS Date), N'Moscow', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-05-03 01:30:35.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (18, CAST(N'2018-05-28' AS Date), CAST(N'2018-05-31' AS Date), N'Paris', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-05-03 01:30:46.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (19, CAST(N'2018-05-29' AS Date), CAST(N'2018-05-31' AS Date), N'Chicago', N'Investigative meeting', N'Investigative meeting', 1, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-27 00:54:09.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mission] OFF
SET IDENTITY_INSERT [dbo].[MissionWorker] ON 

INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (25, 3, 7)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (26, 3, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (27, 3, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (44, 1, 2)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (62, 5, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (63, 5, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (64, 2, 2)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (65, 2, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (66, 2, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (67, 4, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (68, 4, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (69, 14, 3)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (70, 14, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (71, 14, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (72, 6, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (73, 6, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (74, 6, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (75, 6, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (76, 6, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (77, 7, 2)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (78, 7, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (79, 7, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (80, 7, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (81, 8, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (82, 8, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (83, 8, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (84, 8, 11)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (85, 8, 12)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (86, 9, 3)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (87, 9, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (88, 9, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (89, 10, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (90, 10, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (91, 10, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (92, 10, 11)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (93, 11, 2)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (94, 11, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (95, 11, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (96, 11, 12)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (97, 12, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (98, 12, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (99, 12, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (100, 12, 12)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (101, 12, 11)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (102, 13, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (103, 13, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (104, 13, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (105, 16, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (106, 16, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (107, 16, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (108, 19, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (109, 19, 9)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (110, 19, 12)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (111, 19, 11)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (112, 15, 4)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (113, 15, 5)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (114, 15, 15)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (115, 17, 40)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (116, 17, 41)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (117, 17, 37)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (118, 18, 8)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (119, 18, 6)
INSERT [dbo].[MissionWorker] ([MissionWorkerId], [MissionId], [UserId]) VALUES (120, 18, 24)
SET IDENTITY_INSERT [dbo].[MissionWorker] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (1, N'Emergency Notification', N'<p>&nbsp;</p>
<p class="MsoNormal"><strong>Emergency Notification Alerts Staff of Critical Events</strong></p>
<p class="MsoNormal">There are many situations when you urgently need to alert a group of people of information. This can include dangerous weather, a security situation they should be aware of, or perhaps it&rsquo;s an influx of patients. Your staff depends on fast, accurate notification of critical information on the right communications device to prepare them and to ensure their safety in the event of an emergency.</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal"><strong>Emergency Notification and Incident Management</strong></p>
<p class="MsoNormal">Spok helps you quickly and reliably notify staff during emergency situations without calling trees and confusion. Automatically deliver messages, collect responses, escalate to others, and log all activities for reporting and analysis.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:01:42.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (2, N'Critical Test Results', N'<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Improving Care Coordination by Sharing Test Results Quickly and Effectively </strong></p>
<p class="MsoNormal">Many institutions currently use a manual procedure to communicate and log critical test results management (CTRM) process steps. Automating this process with Spok&reg;<span style="mso-spacerun: yes;">&nbsp; </span>Critical Test Results Management can significantly reduce costs and save valuable time while improving patient care and reducing litigation costs. This unique product securely and rapidly transfers information to the right caregivers when time is critical to patient care.</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Closed-Loop Communications for Joint Commission and Lab CAP Accreditation</strong></p>
<p class="MsoNormal">Spok Critical Test Results Management includes automatic message delivery confirmation, an event log and audit trail, and is compatible with existing hospital technology systems. It includes a closed-loop communication feature that allows the receiving caregiver to confirm that he/she has received and understood the critical alert. There is also a configurable escalation feature that alerts others when the initial caregiver doesn&rsquo;t react to a critical alert in a timely manner.</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:35:05.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (3, N'Deliver Results to the Right Physician', N'<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Deliver Results to the Right Physician</strong></p>
<p class="MsoNormal">Because Spok technology is built for the entire healthcare organization, our many integrations and data sources help ensure that the appropriate people receive the messages they need day or night. This means critical results can be delivered to the right on-call physician who can then begin treatment for the patient.</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Integrating With the Spok Suite of Communication Workflow Solutions</strong></p>
<p class="MsoNormal">Spok Critical Test Results Management integrates with Spok Mobile&reg; for encrypted smartphone communications. This supports secure, traceable communications and message delivery confirmations. Spok Critical Test Results Management integrates with the Spok directory and on-call scheduling solutions. This provides a centralized view of this critical information and eliminates data duplication.</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:46:03.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (4, N'Improving Patient Satisfaction', N'<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Improving Patient Satisfaction and Nurse Efficiency with Mobile Alerts from Nurse Call Systems</strong></p>
<p class="MsoNormal">Providing patients the ability to communicate with their assigned nurse within seconds of hitting the nurse call button offers a less stressful environment for the patient. In fact, patient satisfaction scores often hinge on communications with assigned nurses.</p>
<p class="MsoNormal" style="tab-stops: 56.25pt;">On the flip side, nurses typically juggle too many patients and tasks. RNs often perform duties an orderly or supply technician could do. Communication technology is needed to make nurses&rsquo; shifts flow more smoothly and eliminate excess walking and redundant effort.</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Spok Nurse Call Integration Solutions</strong></p>
<p class="MsoNormal">With Spok&reg; Messenger, you can deliver nurse call alerts directly to the appropriate nurse on his or her mobile device, enabling the nurse to respond quickly to the patient need or request. You can also direct requests for water, general information, or bathroom assistance to non-clinical staff as appropriate. Leveraging today&rsquo;s variety of mobile devices helps nurses spend more time on direct patient care.</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:47:32.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (5, N'Patient Monitoring', N'<p class="MsoNormal"><strong>Fast Response to Alerts Saves Lives</strong></p>
<p class="MsoNormal">Enhance the value of patient monitoring by sending system-generated alarm notifications directly to nurses to ensure critical patient conditions are triaged quickly.</p>
<p class="MsoNormal">Spok Alarm Surveillance powered by Bernoulli captures live streaming patient data from patient monitoring systems to create unique smart alarms by taking into consideration various key measurements. These smart alarms suppress nuisance and alarms that aren&rsquo;t clinically actionable and only deliver actionable alarms directly to the right clinician, resulting in fewer interruptions to the care team.</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:53:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (6, N'Committee meeting', N'content', CAST(N'2018-03-30 01:42:01.000' AS DateTime), 2, CAST(N'2018-03-30 01:42:01.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (7, N'Staff meeting', N'<p style="text-align: center;"><span style="text-decoration: underline;"><a href="https://www.facebook.com/">face</a>qweqw<em>qweqweqdqwd</em></span></p>
<p style="text-align: left;">wwwwwwwwwwww</p>
<p style="text-align: right;"><strong>eeeeeeeeeee</strong></p>', CAST(N'2018-04-21 16:43:28.000' AS DateTime), 2, CAST(N'2018-04-26 15:57:38.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (8, N'EHR Interoperability', N'<p class="MsoNormal"><strong style="mso-bidi-font-weight: normal;">Maximize the Return on Your EHR System Investment</strong></p>
<p class="MsoNormal">Hospitals and health systems have spent upwards of $1 billion in electronic health record (EHR) systems. We&rsquo;ve entered the era of EHR optimization: Now that your EHR is fully implemented, how can you maximize your investment?</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal">EHRs contain a wealth of information. However, they were designed to be systems of record rather than systems of communication. Spok can use the information in electronic patient records to make alerts and messages more actionable. Adding detailed clinical information to a patient event with data from the EHR, noting a patient&rsquo;s medication allergies for example, helps drive faster, more efficient decision-making for providers.</p>
<p class="MsoNormal">&nbsp;</p>
<p class="MsoNormal">Spok Care Connect integrates with all major EHR vendors, including Epic&reg;, Cerner&reg;, and MEDITECH&reg;.</p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-05-03 00:53:47.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (9, N'Investigative meeting', N'Investigative meeting', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-26 15:53:45.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (10, N'Improve skill meeting', N'Improve skill meeting', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-26 15:53:45.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (11, N'Improve skill meeting', N'Improve skill meeting', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-26 15:53:45.000' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Notification] OFF
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Scheduler')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (1, N'Room201', 12, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (2, N'Room303', 10, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (3, N'Room202', 50, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (4, N'Room203', 100, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (5, N'Room301', 20, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (7, N'Room302', 40, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (8, N'Room401', 60, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (9, N'Room402', 50, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (10, N'Room403', 20, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (11, N'Room501', 15, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (12, N'Room502', 20, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (1, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (2, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 2, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (3, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 3, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (4, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 4, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (5, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 5, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (6, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 6, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (7, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 7, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (8, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 8, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (9, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 8, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (10, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 9, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (11, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 9, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (12, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 10, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (13, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 10, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (14, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 11, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (15, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 11, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (16, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 12, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (17, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 12, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (18, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 13, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (19, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 13, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (20, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 14, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (21, 1, CAST(N'04:00:00' AS Time), CAST(N'08:00:00' AS Time), 14, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (22, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 15, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (23, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 16, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (24, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 17, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (25, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 18, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (26, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 19, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (27, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 20, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (28, 0, CAST(N'01:00:00' AS Time), CAST(N'05:00:00' AS Time), 21, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (29, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 22, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (30, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 23, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (31, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 24, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (32, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 25, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (33, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 26, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (34, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 27, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (35, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 28, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (36, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 29, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (37, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 30, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (38, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 31, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (39, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 32, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (40, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 33, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (41, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 34, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (42, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 35, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (43, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 36, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (44, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 37, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (45, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 38, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (46, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 39, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (47, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 40, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (48, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 41, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (49, 0, CAST(N'01:00:00' AS Time), CAST(N'04:00:00' AS Time), 42, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (50, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 43, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (51, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 44, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (52, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 45, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (53, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 46, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (54, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 47, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (55, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 48, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (56, 0, CAST(N'02:00:00' AS Time), CAST(N'04:00:00' AS Time), 49, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (57, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 50, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (58, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 51, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (59, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 52, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (60, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 53, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (61, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 54, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (62, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 55, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (63, 0, CAST(N'01:00:00' AS Time), CAST(N'02:00:00' AS Time), 56, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (64, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 57, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (65, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 57, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (66, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 57, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (67, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 58, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (68, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 58, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (69, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 58, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (70, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 59, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (71, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 59, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (72, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 59, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (73, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 60, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (74, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 60, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (75, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 60, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (76, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 61, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (77, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 61, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (78, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 61, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (79, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 62, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (80, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 62, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (81, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 62, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (82, 0, CAST(N'03:00:00' AS Time), CAST(N'06:00:00' AS Time), 63, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (83, 1, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 63, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (84, 2, CAST(N'12:00:00' AS Time), CAST(N'15:00:00' AS Time), 63, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (85, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 64, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (86, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 65, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (87, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 66, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (88, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 67, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (89, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 68, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (90, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 69, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (91, 0, CAST(N'06:00:00' AS Time), CAST(N'12:00:00' AS Time), 70, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (92, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 71, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (93, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 72, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (94, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 73, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (95, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 74, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (96, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 75, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (97, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 76, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (98, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 77, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (99, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 78, N'')
GO
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (100, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 79, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (101, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 80, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (102, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 81, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (103, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 82, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (104, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 83, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (105, 0, CAST(N'06:00:00' AS Time), CAST(N'11:00:00' AS Time), 84, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (106, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 85, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (107, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 85, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (108, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 86, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (109, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 86, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (110, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 87, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (111, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 87, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (112, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 88, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (113, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 88, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (114, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 89, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (115, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 89, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (116, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 90, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (117, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 90, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (118, 0, CAST(N'06:00:00' AS Time), CAST(N'09:00:00' AS Time), 91, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (119, 1, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 91, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (120, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 92, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (121, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 92, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (122, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 92, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (123, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 93, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (124, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 93, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (125, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 93, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (126, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 94, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (127, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 94, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (128, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 94, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (129, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 95, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (130, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 95, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (131, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 95, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (132, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 96, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (133, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 96, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (134, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 96, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (135, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 97, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (136, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 97, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (137, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 97, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (138, 0, CAST(N'08:03:00' AS Time), CAST(N'09:30:00' AS Time), 98, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (139, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 98, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (140, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 98, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (141, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 99, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (142, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 99, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (143, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 99, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (144, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 100, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (145, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 100, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (146, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 100, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (147, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 101, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (148, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 101, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (149, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 101, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (150, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 102, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (151, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 102, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (152, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 102, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (153, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 103, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (154, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 103, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (155, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 103, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (156, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 104, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (157, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 104, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (158, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 104, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (159, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 105, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (160, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 105, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (161, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 105, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (162, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 106, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (163, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 106, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (164, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 106, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (165, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 107, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (166, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 107, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (167, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 107, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (168, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 108, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (169, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 108, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (170, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 108, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (171, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 109, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (172, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 109, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (173, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 109, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (174, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 110, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (175, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 110, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (176, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 110, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (177, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 111, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (178, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 111, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (179, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 111, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (180, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 112, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (181, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 112, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (182, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 112, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (183, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 113, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (184, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 113, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (185, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 113, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (186, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 114, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (187, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 114, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (188, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 114, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (189, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 115, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (190, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 115, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (191, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 115, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (192, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 116, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (193, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 116, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (194, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 116, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (195, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 117, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (196, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 117, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (197, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 117, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (198, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 118, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (199, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 118, N'')
GO
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (200, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 118, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (201, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 119, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (202, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 119, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (203, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 119, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (204, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 120, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (205, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 120, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (206, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 120, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (207, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 121, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (208, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 121, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (209, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 121, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (210, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 122, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (211, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 122, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (212, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 122, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (213, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 123, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (214, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 123, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (215, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 123, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (216, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 124, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (217, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 124, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (218, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 124, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (219, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 125, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (220, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 125, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (221, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 125, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (222, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 126, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (223, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 126, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (224, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 126, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (225, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 127, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (226, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 127, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (227, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 127, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (228, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 128, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (229, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 128, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (230, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 128, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (231, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 129, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (232, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 129, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (233, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 129, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (234, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 130, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (235, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 130, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (236, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 130, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (237, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 131, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (238, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 131, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (239, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 131, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (240, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 132, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (241, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 132, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (242, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 132, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (243, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 133, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (244, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 133, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (245, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 133, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (246, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 134, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (247, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 134, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (248, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 134, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (249, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 135, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (250, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 135, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (251, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 135, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (252, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 136, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (253, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 136, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (254, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 136, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (255, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 137, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (256, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 137, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (257, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 137, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (258, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 138, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (259, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 138, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (260, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 138, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (261, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 139, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (262, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 139, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (263, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 139, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (264, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 140, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (265, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 140, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (266, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 140, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (267, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 141, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (268, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 141, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (269, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 141, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (270, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 142, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (271, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 142, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (272, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 142, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (273, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 143, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (274, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 143, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (275, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 143, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (276, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 144, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (277, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 144, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (278, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 144, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (279, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 145, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (280, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 145, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (281, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 145, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (282, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 146, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (283, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 146, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (284, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 146, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (285, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 147, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (286, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 147, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (287, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 147, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (288, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 148, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (289, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 148, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (290, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 148, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (291, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 149, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (292, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 149, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (293, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 149, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (294, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 150, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (295, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 150, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (296, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 150, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (297, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 151, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (298, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 151, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (299, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 151, N'')
GO
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (300, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 152, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (301, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 152, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (302, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 152, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (303, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 153, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (304, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 153, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (305, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 153, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (306, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 154, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (307, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 154, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (308, 2, CAST(N'10:30:00' AS Time), CAST(N'11:30:00' AS Time), 154, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (309, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 155, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (310, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 155, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (311, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 156, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (312, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 156, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (313, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 157, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (314, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 157, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (315, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 158, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (316, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 158, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (317, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 159, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (318, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 159, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (319, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 160, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (320, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 160, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (321, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 161, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (322, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 161, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (323, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 162, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (324, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 162, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (325, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 163, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (326, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 163, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (327, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 164, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (328, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 164, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (329, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 165, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (330, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 165, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (331, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 166, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (332, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 166, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (333, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 167, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (334, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 167, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (335, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 168, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (336, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 168, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (337, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 169, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (338, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 169, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (339, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 170, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (340, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 170, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (341, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 171, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (342, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 171, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (343, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 172, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (344, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 172, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (345, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 173, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (346, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 173, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (347, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 174, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (348, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 174, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (349, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 175, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (350, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 175, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (351, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 176, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (352, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 176, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (353, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 177, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (354, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 177, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (355, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 178, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (356, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 178, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (357, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 179, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (358, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 179, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (359, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 180, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (360, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 180, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (361, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 181, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (362, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 181, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (363, 0, CAST(N'08:30:00' AS Time), CAST(N'09:30:00' AS Time), 182, N'')
INSERT [dbo].[Shift] ([ShiftId], [ShiftNO], [StartTime], [EndTime], [ShiftDayID], [Other]) VALUES (364, 1, CAST(N'09:30:00' AS Time), CAST(N'10:30:00' AS Time), 182, N'')
SET IDENTITY_INSERT [dbo].[Shift] OFF
SET IDENTITY_INSERT [dbo].[ShiftDay] ON 

INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (1, N'5/3/2018', N'Mon', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (2, N'6/3/2018', N'Tue', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (3, N'7/3/2018', N'Wed', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (4, N'8/3/2018', N'Thu', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (5, N'9/3/2018', N'Fri', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (6, N'10/3/2018', N'Sat', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (7, N'11/3/2018', N'Sun', 1)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (8, N'12/3/2018', N'Mon', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (9, N'13/3/2018', N'Tue', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (10, N'14/3/2018', N'Wed', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (11, N'15/3/2018', N'Thu', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (12, N'16/3/2018', N'Fri', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (13, N'17/3/2018', N'Sat', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (14, N'18/3/2018', N'Sun', 2)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (15, N'23/4/2018', N'Mon', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (16, N'24/4/2018', N'Tue', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (17, N'25/4/2018', N'Wed', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (18, N'26/4/2018', N'Thu', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (19, N'27/4/2018', N'Fri', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (20, N'28/4/2018', N'Sat', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (21, N'29/4/2018', N'Sun', 3)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (22, N'9/4/2018', N'Mon', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (23, N'10/4/2018', N'Tue', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (24, N'11/4/2018', N'Wed', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (25, N'12/4/2018', N'Thu', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (26, N'13/4/2018', N'Fri', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (27, N'14/4/2018', N'Sat', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (28, N'15/4/2018', N'Sun', 4)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (29, N'16/4/2018', N'Mon', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (30, N'17/4/2018', N'Tue', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (31, N'18/4/2018', N'Wed', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (32, N'19/4/2018', N'Thu', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (33, N'20/4/2018', N'Fri', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (34, N'21/4/2018', N'Sat', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (35, N'22/4/2018', N'Sun', 5)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (36, N'23/4/2018', N'Mon', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (37, N'24/4/2018', N'Tue', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (38, N'25/4/2018', N'Wed', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (39, N'26/4/2018', N'Thu', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (40, N'27/4/2018', N'Fri', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (41, N'28/4/2018', N'Sat', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (42, N'29/4/2018', N'Sun', 6)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (43, N'19/3/2018', N'Mon', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (44, N'20/3/2018', N'Tue', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (45, N'21/3/2018', N'Wed', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (46, N'22/3/2018', N'Thu', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (47, N'23/3/2018', N'Fri', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (48, N'24/3/2018', N'Sat', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (49, N'25/3/2018', N'Sun', 7)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (50, N'23/4/2018', N'Mon', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (51, N'24/4/2018', N'Tue', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (52, N'25/4/2018', N'Wed', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (53, N'26/4/2018', N'Thu', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (54, N'27/4/2018', N'Fri', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (55, N'28/4/2018', N'Sat', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (56, N'29/4/2018', N'Sun', 8)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (57, N'23/4/2018', N'Mon', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (58, N'24/4/2018', N'Tue', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (59, N'25/4/2018', N'Wed', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (60, N'26/4/2018', N'Thu', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (61, N'27/4/2018', N'Fri', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (62, N'28/4/2018', N'Sat', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (63, N'29/4/2018', N'Sun', 9)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (64, N'16/4/2018', N'Mon', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (65, N'17/4/2018', N'Tue', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (66, N'18/4/2018', N'Wed', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (67, N'19/4/2018', N'Thu', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (68, N'20/4/2018', N'Fri', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (69, N'21/4/2018', N'Sat', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (70, N'22/4/2018', N'Sun', 10)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (71, N'30/4/2018', N'Mon', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (72, N'30/4/2018', N'Mon', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (73, N'1/5/2018', N'Tue', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (74, N'1/5/2018', N'Tue', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (75, N'2/5/2018', N'Wed', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (76, N'2/5/2018', N'Wed', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (77, N'3/5/2018', N'Thu', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (78, N'3/5/2018', N'Thu', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (79, N'4/5/2018', N'Fri', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (80, N'4/5/2018', N'Fri', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (81, N'5/5/2018', N'Sat', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (82, N'5/5/2018', N'Sat', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (83, N'6/5/2018', N'Sun', 12)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (84, N'6/5/2018', N'Sun', 11)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (85, N'30/4/2018', N'Mon', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (86, N'1/5/2018', N'Tue', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (87, N'2/5/2018', N'Wed', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (88, N'3/5/2018', N'Thu', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (89, N'4/5/2018', N'Fri', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (90, N'5/5/2018', N'Sat', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (91, N'6/5/2018', N'Sun', 13)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (92, N'4/23/2018', N'Mon', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (93, N'4/24/2018', N'Tue', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (94, N'4/25/2018', N'Wed', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (95, N'4/26/2018', N'Thu', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (96, N'4/27/2018', N'Fri', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (97, N'4/28/2018', N'Sat', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (98, N'4/29/2018', N'Sun', 14)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (99, N'4/30/2018', N'Mon', 15)
GO
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (100, N'5/1/2018', N'Tue', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (101, N'5/2/2018', N'Wed', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (102, N'5/3/2018', N'Thu', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (103, N'5/4/2018', N'Fri', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (104, N'5/5/2018', N'Sat', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (105, N'5/6/2018', N'Sun', 15)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (106, N'4/30/2018', N'Mon', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (107, N'5/1/2018', N'Tue', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (108, N'5/2/2018', N'Wed', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (109, N'5/3/2018', N'Thu', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (110, N'5/4/2018', N'Fri', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (111, N'5/5/2018', N'Sat', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (112, N'5/6/2018', N'Sun', 16)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (113, N'5/7/2018', N'Mon', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (114, N'5/8/2018', N'Tue', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (115, N'5/9/2018', N'Wed', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (116, N'5/10/2018', N'Thu', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (117, N'5/11/2018', N'Fri', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (118, N'5/12/2018', N'Sat', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (119, N'5/13/2018', N'Sun', 17)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (120, N'4/23/2018', N'Mon', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (121, N'4/24/2018', N'Tue', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (122, N'4/25/2018', N'Wed', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (123, N'4/26/2018', N'Thu', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (124, N'4/27/2018', N'Fri', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (125, N'4/28/2018', N'Sat', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (126, N'4/29/2018', N'Sun', 18)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (127, N'4/30/2018', N'Mon', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (128, N'5/1/2018', N'Tue', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (129, N'5/2/2018', N'Wed', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (130, N'5/3/2018', N'Thu', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (131, N'5/4/2018', N'Fri', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (132, N'5/5/2018', N'Sat', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (133, N'5/6/2018', N'Sun', 19)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (134, N'4/30/2018', N'Mon', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (135, N'5/1/2018', N'Tue', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (136, N'5/2/2018', N'Wed', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (137, N'5/3/2018', N'Thu', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (138, N'5/4/2018', N'Fri', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (139, N'5/5/2018', N'Sat', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (140, N'5/6/2018', N'Sun', 20)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (141, N'5/7/2018', N'Mon', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (142, N'5/8/2018', N'Tue', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (143, N'5/9/2018', N'Wed', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (144, N'5/10/2018', N'Thu', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (145, N'5/11/2018', N'Fri', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (146, N'5/12/2018', N'Sat', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (147, N'5/13/2018', N'Sun', 21)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (148, N'5/14/2018', N'Mon', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (149, N'5/15/2018', N'Tue', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (150, N'5/16/2018', N'Wed', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (151, N'5/17/2018', N'Thu', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (152, N'5/18/2018', N'Fri', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (153, N'5/19/2018', N'Sat', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (154, N'5/20/2018', N'Sun', 22)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (155, N'5/7/2018', N'Mon', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (156, N'5/8/2018', N'Tue', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (157, N'5/9/2018', N'Wed', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (158, N'5/10/2018', N'Thu', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (159, N'5/11/2018', N'Fri', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (160, N'5/12/2018', N'Sat', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (161, N'5/13/2018', N'Sun', 23)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (162, N'5/7/2018', N'Mon', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (163, N'5/8/2018', N'Tue', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (164, N'5/9/2018', N'Wed', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (165, N'5/10/2018', N'Thu', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (166, N'5/11/2018', N'Fri', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (167, N'5/12/2018', N'Sat', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (168, N'5/13/2018', N'Sun', 24)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (169, N'5/7/2018', N'Mon', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (170, N'5/8/2018', N'Tue', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (171, N'5/9/2018', N'Wed', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (172, N'5/10/2018', N'Thu', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (173, N'5/11/2018', N'Fri', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (174, N'5/12/2018', N'Sat', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (175, N'5/13/2018', N'Sun', 25)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (176, N'5/7/2018', N'Mon', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (177, N'5/8/2018', N'Tue', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (178, N'5/9/2018', N'Wed', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (179, N'5/10/2018', N'Thu', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (180, N'5/11/2018', N'Fri', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (181, N'5/12/2018', N'Sat', 26)
INSERT [dbo].[ShiftDay] ([ShiftDayID], [ShiftDay], [DayInWeek], [ShiftScheduleId]) VALUES (182, N'5/13/2018', N'Sun', 26)
SET IDENTITY_INSERT [dbo].[ShiftDay] OFF
SET IDENTITY_INSERT [dbo].[ShiftSchedule] ON 

INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (1, 4, 2, 4, CAST(N'2018-03-30 12:48:26.000' AS DateTime), CAST(N'2018-03-30 12:48:26.000' AS DateTime), 4, N'2018-W10')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (2, 6, 3, 2, CAST(N'2018-03-31 20:28:51.000' AS DateTime), CAST(N'2018-03-31 20:28:51.000' AS DateTime), 2, N'2018-W11')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (3, 13, 3, 2, CAST(N'2018-04-01 19:00:57.000' AS DateTime), CAST(N'2018-04-01 19:00:57.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (4, 13, 2, 2, CAST(N'2018-04-02 09:47:08.000' AS DateTime), CAST(N'2018-04-02 09:47:08.000' AS DateTime), 2, N'2018-W15')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (5, 13, 3, 2, CAST(N'2018-04-02 09:47:37.000' AS DateTime), CAST(N'2018-04-02 09:47:37.000' AS DateTime), 2, N'2018-W16')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (6, 13, 2, 2, CAST(N'2018-04-02 09:48:05.000' AS DateTime), CAST(N'2018-04-02 09:48:05.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (7, 13, 1, 2, CAST(N'2018-04-02 09:48:35.000' AS DateTime), CAST(N'2018-04-02 09:48:35.000' AS DateTime), 2, N'2018-W12')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (8, 13, 2, 2, CAST(N'2018-04-02 13:39:13.000' AS DateTime), CAST(N'2018-04-02 13:39:13.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (9, 13, 2, 2, CAST(N'2018-04-09 13:57:35.000' AS DateTime), CAST(N'2018-04-09 13:57:35.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (10, 1, 2, 2, CAST(N'2018-04-15 21:22:58.000' AS DateTime), CAST(N'2018-04-15 21:22:58.000' AS DateTime), 2, N'2018-W16')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (11, 13, 1, 2, CAST(N'2018-04-16 22:01:51.000' AS DateTime), CAST(N'2018-04-16 22:01:51.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (12, 13, 2, 2, CAST(N'2018-04-16 22:01:55.000' AS DateTime), CAST(N'2018-04-16 22:01:55.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (13, 13, 2, 2, CAST(N'2018-04-23 07:45:14.000' AS DateTime), CAST(N'2018-04-23 07:45:14.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (14, 1, 2, 2, CAST(N'2018-04-27 01:40:58.000' AS DateTime), CAST(N'2018-04-27 01:40:58.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (15, 1, 2, 2, CAST(N'2018-04-27 06:09:48.000' AS DateTime), CAST(N'2018-04-27 06:09:48.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (16, 2, 2, 2, CAST(N'2018-04-27 06:12:58.000' AS DateTime), CAST(N'2018-04-27 06:12:58.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (17, 2, 2, 2, CAST(N'2018-04-27 06:14:40.000' AS DateTime), CAST(N'2018-04-27 06:14:40.000' AS DateTime), 2, N'2018-W19')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (18, 3, 2, 2, CAST(N'2018-04-27 06:17:41.000' AS DateTime), CAST(N'2018-04-27 06:17:41.000' AS DateTime), 2, N'2018-W17')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (19, 3, 2, 2, CAST(N'2018-04-27 06:19:37.000' AS DateTime), CAST(N'2018-04-27 06:19:37.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (20, 4, 2, 2, CAST(N'2018-04-27 06:21:13.000' AS DateTime), CAST(N'2018-04-27 06:21:13.000' AS DateTime), 2, N'2018-W18')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (21, 4, 2, 2, CAST(N'2018-04-27 06:23:18.000' AS DateTime), CAST(N'2018-04-27 06:23:18.000' AS DateTime), 2, N'2018-W19')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (22, 5, 2, 2, CAST(N'2018-04-27 06:24:40.000' AS DateTime), CAST(N'2018-04-27 06:24:40.000' AS DateTime), 2, N'2018-W20')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (23, 6, 2, 2, CAST(N'2018-05-03 01:25:52.000' AS DateTime), CAST(N'2018-05-03 01:25:52.000' AS DateTime), 2, N'2018-W19')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (24, 7, 1, 2, CAST(N'2018-05-03 01:27:11.000' AS DateTime), CAST(N'2018-05-03 01:27:11.000' AS DateTime), 2, N'2018-W19')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (25, 8, 1, 2, CAST(N'2018-05-03 01:28:03.000' AS DateTime), CAST(N'2018-05-03 01:28:03.000' AS DateTime), 2, N'2018-W19')
INSERT [dbo].[ShiftSchedule] ([ShiftScheduleId], [DepartmentId], [Status], [Createby], [CreateDate], [UpdateDate], [Updateby], [Week]) VALUES (26, 12, 1, 2, CAST(N'2018-05-03 01:28:59.000' AS DateTime), CAST(N'2018-05-03 01:28:59.000' AS DateTime), 2, N'2018-W19')
SET IDENTITY_INSERT [dbo].[ShiftSchedule] OFF
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W10', 4, 1, 1)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W11', 6, 2, 2)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W12', 6, 0, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W12', 13, 7, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W15', 13, 4, 4)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W16', 1, 10, 10)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W16', 13, 0, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W17', 1, 14, 14)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W17', 3, 18, 18)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W17', 13, 9, 9)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 1, 15, 15)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 2, 16, 16)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 3, 19, 19)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 4, 20, 20)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 13, 13, 13)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 2, 17, 17)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 4, 21, 21)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 6, 23, 23)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 7, 24, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 8, 25, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W19', 12, 26, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W20', 5, 22, 22)
SET IDENTITY_INSERT [dbo].[ShiftWorker] ON 

INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (1, 1, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (2, 2, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (3, 3, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (4, 4, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (5, 5, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (6, 6, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (7, 7, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (8, 8, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (9, 8, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (10, 9, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (11, 9, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (12, 10, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (13, 10, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (14, 11, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (15, 11, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (16, 12, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (17, 12, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (18, 13, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (19, 13, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (20, 14, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (21, 14, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (22, 15, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (23, 15, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (24, 16, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (25, 16, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (26, 17, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (27, 17, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (28, 18, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (29, 18, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (30, 19, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (31, 19, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (32, 20, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (33, 20, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (34, 21, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (35, 21, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (36, 22, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (37, 22, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (38, 23, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (39, 23, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (40, 24, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (41, 24, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (42, 25, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (43, 25, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (44, 26, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (45, 26, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (46, 27, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (47, 27, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (48, 28, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (49, 28, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (50, 29, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (51, 30, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (52, 31, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (53, 32, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (54, 33, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (55, 34, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (56, 35, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (57, 36, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (58, 37, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (59, 38, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (60, 39, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (61, 40, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (62, 41, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (63, 42, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (64, 43, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (65, 44, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (66, 45, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (67, 46, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (68, 47, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (69, 48, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (70, 49, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (71, 50, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (72, 51, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (73, 52, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (74, 53, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (75, 54, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (76, 55, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (77, 56, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (78, 57, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (79, 57, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (80, 58, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (81, 58, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (82, 59, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (83, 59, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (84, 60, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (85, 60, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (86, 61, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (87, 61, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (88, 62, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (89, 62, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (90, 63, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (91, 63, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (92, 64, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (93, 64, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (94, 65, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (95, 65, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (96, 66, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (97, 66, 7)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (98, 67, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (99, 67, 7)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (100, 68, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (101, 68, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (102, 69, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (103, 69, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (104, 70, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (105, 70, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (106, 71, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (107, 71, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (108, 72, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (109, 72, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (110, 73, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (111, 73, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (112, 74, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (113, 74, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (114, 75, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (115, 75, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (116, 76, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (117, 76, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (118, 77, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (119, 77, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (120, 78, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (121, 78, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (122, 79, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (123, 79, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (124, 80, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (125, 80, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (126, 81, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (127, 81, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (128, 82, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (129, 82, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (130, 83, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (131, 83, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (132, 84, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (133, 84, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (134, 85, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (135, 86, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (136, 87, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (137, 88, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (138, 89, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (139, 90, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (140, 91, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (141, 92, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (142, 93, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (143, 94, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (144, 95, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (145, 97, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (146, 96, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (147, 98, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (148, 99, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (149, 100, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (150, 101, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (151, 102, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (152, 103, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (153, 105, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (154, 104, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (155, 106, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (156, 106, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (157, 107, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (158, 107, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (159, 108, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (160, 108, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (161, 109, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (162, 109, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (163, 110, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (164, 110, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (165, 111, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (166, 111, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (167, 112, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (168, 112, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (169, 113, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (170, 113, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (171, 114, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (172, 114, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (173, 115, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (174, 115, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (175, 116, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (176, 116, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (177, 117, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (178, 117, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (179, 118, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (180, 118, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (181, 119, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (182, 119, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (183, 120, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (184, 120, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (185, 121, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (186, 121, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (187, 122, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (188, 122, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (189, 123, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (190, 123, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (191, 124, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (192, 124, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (193, 125, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (194, 125, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (195, 126, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (196, 126, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (197, 127, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (198, 127, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (199, 128, 2)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (200, 128, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (201, 129, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (202, 129, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (203, 130, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (204, 130, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (205, 131, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (206, 131, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (207, 132, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (208, 132, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (209, 133, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (210, 133, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (211, 134, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (212, 134, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (213, 135, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (214, 135, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (215, 136, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (216, 136, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (217, 137, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (218, 137, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (219, 138, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (220, 138, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (221, 139, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (222, 139, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (223, 140, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (224, 140, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (225, 141, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (226, 141, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (227, 142, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (228, 142, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (229, 143, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (230, 143, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (231, 144, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (232, 144, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (233, 145, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (234, 145, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (235, 146, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (236, 146, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (237, 147, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (238, 147, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (239, 148, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (240, 148, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (241, 149, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (242, 149, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (243, 150, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (244, 150, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (245, 151, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (246, 151, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (247, 152, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (248, 152, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (249, 153, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (250, 153, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (251, 154, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (252, 154, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (253, 155, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (254, 155, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (255, 156, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (256, 156, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (257, 157, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (258, 157, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (259, 158, 3)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (260, 158, 4)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (261, 159, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (262, 159, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (263, 160, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (264, 160, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (265, 161, 2)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (266, 161, 5)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (267, 162, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (268, 162, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (269, 163, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (270, 163, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (271, 164, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (272, 164, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (273, 165, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (274, 165, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (275, 166, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (276, 166, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (277, 167, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (278, 167, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (279, 168, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (280, 168, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (281, 169, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (282, 169, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (283, 170, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (284, 170, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (285, 171, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (286, 171, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (287, 172, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (288, 172, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (289, 173, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (290, 173, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (291, 174, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (292, 174, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (293, 175, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (294, 175, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (295, 176, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (296, 176, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (297, 177, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (298, 177, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (299, 178, 8)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (300, 178, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (301, 179, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (302, 179, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (303, 180, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (304, 180, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (305, 181, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (306, 181, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (307, 182, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (308, 182, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (309, 183, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (310, 183, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (311, 184, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (312, 184, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (313, 185, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (314, 185, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (315, 186, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (316, 186, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (317, 187, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (318, 187, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (319, 188, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (320, 188, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (321, 189, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (322, 189, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (323, 190, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (324, 190, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (325, 191, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (326, 191, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (327, 192, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (328, 192, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (329, 193, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (330, 193, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (331, 194, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (332, 194, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (333, 195, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (334, 195, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (335, 196, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (336, 196, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (337, 197, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (338, 197, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (339, 198, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (340, 198, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (341, 199, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (342, 199, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (343, 200, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (344, 200, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (345, 201, 8)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (346, 201, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (347, 202, 6)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (348, 202, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (349, 203, 9)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (350, 203, 10)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (351, 204, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (352, 204, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (353, 205, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (354, 205, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (355, 206, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (356, 206, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (357, 207, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (358, 207, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (359, 208, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (360, 208, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (361, 209, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (362, 209, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (363, 210, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (364, 210, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (365, 211, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (366, 211, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (367, 212, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (368, 212, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (369, 213, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (370, 213, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (371, 214, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (372, 214, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (373, 215, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (374, 215, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (375, 216, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (376, 216, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (377, 217, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (378, 217, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (379, 218, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (380, 218, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (381, 219, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (382, 219, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (383, 220, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (384, 220, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (385, 221, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (386, 221, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (387, 222, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (388, 222, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (389, 223, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (390, 223, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (391, 224, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (392, 224, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (393, 225, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (394, 225, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (395, 226, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (396, 226, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (397, 227, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (398, 227, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (399, 228, 12)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (400, 228, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (401, 229, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (402, 229, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (403, 230, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (404, 230, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (405, 231, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (406, 231, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (407, 232, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (408, 232, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (409, 233, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (410, 233, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (411, 234, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (412, 234, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (413, 235, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (414, 235, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (415, 236, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (416, 236, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (417, 237, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (418, 237, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (419, 238, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (420, 238, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (421, 239, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (422, 239, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (423, 240, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (424, 240, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (425, 241, 14)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (426, 241, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (427, 242, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (428, 242, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (429, 243, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (430, 243, 13)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (431, 244, 12)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (432, 244, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (433, 245, 11)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (434, 245, 15)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (435, 246, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (436, 246, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (437, 247, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (438, 247, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (439, 248, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (440, 248, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (441, 249, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (442, 249, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (443, 250, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (444, 250, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (445, 251, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (446, 251, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (447, 252, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (448, 252, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (449, 253, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (450, 253, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (451, 254, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (452, 254, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (453, 255, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (454, 255, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (455, 256, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (456, 256, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (457, 257, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (458, 257, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (459, 258, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (460, 258, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (461, 259, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (462, 259, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (463, 260, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (464, 260, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (465, 261, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (466, 261, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (467, 262, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (468, 262, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (469, 263, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (470, 263, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (471, 264, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (472, 264, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (473, 265, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (474, 265, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (475, 266, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (476, 266, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (477, 267, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (478, 267, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (479, 267, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (480, 268, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (481, 268, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (482, 268, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (483, 269, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (484, 269, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (485, 269, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (486, 270, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (487, 270, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (488, 270, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (489, 271, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (490, 271, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (491, 271, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (492, 272, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (493, 272, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (494, 272, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (495, 273, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (496, 273, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (497, 273, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (498, 274, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (499, 274, 17)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (500, 274, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (501, 275, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (502, 275, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (503, 275, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (504, 276, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (505, 276, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (506, 276, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (507, 277, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (508, 277, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (509, 277, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (510, 278, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (511, 278, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (512, 278, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (513, 279, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (514, 279, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (515, 279, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (516, 280, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (517, 280, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (518, 280, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (519, 281, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (520, 281, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (521, 281, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (522, 282, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (523, 282, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (524, 282, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (525, 283, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (526, 283, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (527, 283, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (528, 284, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (529, 284, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (530, 284, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (531, 285, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (532, 285, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (533, 285, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (534, 286, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (535, 286, 17)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (536, 286, 18)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (537, 287, 16)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (538, 287, 19)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (539, 287, 20)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (540, 288, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (541, 288, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (542, 289, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (543, 289, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (544, 290, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (545, 290, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (546, 291, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (547, 291, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (548, 292, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (549, 292, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (550, 293, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (551, 293, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (552, 294, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (553, 294, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (554, 295, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (555, 295, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (556, 296, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (557, 296, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (558, 297, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (559, 297, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (560, 298, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (561, 298, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (562, 299, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (563, 299, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (564, 300, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (565, 300, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (566, 301, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (567, 301, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (568, 302, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (569, 302, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (570, 303, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (571, 303, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (572, 304, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (573, 304, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (574, 305, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (575, 305, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (576, 306, 23)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (577, 306, 24)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (578, 307, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (579, 307, 22)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (580, 308, 21)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (581, 308, 25)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (582, 309, 26)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (583, 309, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (584, 310, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (585, 310, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (586, 311, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (587, 311, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (588, 312, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (589, 312, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (590, 313, 26)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (591, 313, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (592, 314, 26)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (593, 314, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (594, 315, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (595, 315, 30)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (596, 316, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (597, 316, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (598, 317, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (599, 317, 28)
GO
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (600, 318, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (601, 318, 30)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (602, 319, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (603, 319, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (604, 320, 26)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (605, 320, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (606, 321, 26)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (607, 321, 27)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (608, 322, 28)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (609, 322, 29)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (610, 323, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (611, 323, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (612, 324, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (613, 324, 35)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (614, 325, 32)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (615, 325, 31)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (616, 326, 31)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (617, 326, 32)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (618, 327, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (619, 327, 35)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (620, 328, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (621, 328, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (622, 329, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (623, 329, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (624, 330, 35)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (625, 330, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (626, 331, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (627, 331, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (628, 332, 31)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (629, 332, 32)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (630, 333, 31)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (631, 333, 32)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (632, 334, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (633, 334, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (634, 335, 33)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (635, 335, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (636, 336, 34)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (637, 336, 35)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (638, 337, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (639, 337, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (640, 338, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (641, 338, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (642, 339, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (643, 339, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (644, 340, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (645, 340, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (646, 341, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (647, 341, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (648, 342, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (649, 342, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (650, 343, 40)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (651, 343, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (652, 344, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (653, 344, 40)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (654, 345, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (655, 345, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (656, 346, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (657, 346, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (658, 347, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (659, 347, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (660, 348, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (661, 348, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (662, 349, 36)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (663, 349, 37)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (664, 350, 38)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (665, 350, 39)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (666, 351, 41)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (667, 351, 43)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (668, 352, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (669, 352, 45)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (670, 353, 41)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (671, 353, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (672, 354, 43)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (673, 354, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (674, 355, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (675, 355, 45)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (676, 356, 41)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (677, 356, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (678, 357, 43)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (679, 357, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (680, 358, 43)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (681, 358, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (682, 359, 41)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (683, 359, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (684, 360, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (685, 360, 41)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (686, 361, 43)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (687, 361, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (688, 362, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (689, 362, 45)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (690, 363, 44)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (691, 363, 45)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (692, 364, 42)
INSERT [dbo].[ShiftWorker] ([ShiftWorkerId], [ShiftId], [UserId]) VALUES (693, 364, 41)
SET IDENTITY_INSERT [dbo].[ShiftWorker] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (1, N'Admin', N'123', NULL, N'admin@gmail.com', N'Admin', N'Male', CAST(N'1990-01-01' AS Date), 1, N'01212322412', N'Doctor', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (2, N'Manager', N'123', N'null', N'manager@gmail.com', N'Manager', N'Male', CAST(N'2018-01-01' AS Date), 1, N'01212322412', N'Doctor', N'123/4 abc street xyz city', N'non', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (3, N'LongHH', N'123', N'null', N'hoanglong0505@gmail.com', N'Ho Hoang Long', N'Male', CAST(N'1996-05-05' AS Date), 1, N'01212322412', N'Doctor', N'qwe', N'qwe', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (4, N'Scheduler', N'123', N'null', N'scheduler@gmail.com', N'Scheduler', N'Female', CAST(N'1990-01-01' AS Date), 1, N'01212322412', N'Doctor', N'qwe', N'qw', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (5, N'AnNV', N'123', N'null', N'An@gmail.com', N'Nguyen Van An', N'Male', CAST(N'1996-05-05' AS Date), 1, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (6, N'BinhNV', N'123', N'null', N'Binh@gmail.com', N'Nguyen Van Binh', N'Male', CAST(N'1996-05-05' AS Date), 2, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (7, N'ThanhNV', N'123', N'null', N'Thanh@gmail.com', N'Nguyen Van Thanh', N'Male', CAST(N'1996-05-05' AS Date), 2, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 2, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (8, N'CongNV', N'123', N'null', N'Cong@gmail.com', N'Nguyen Van Cong', N'Male', CAST(N'1996-05-05' AS Date), 2, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (9, N'EmanuelKeller', N'123', N'null', N'EmanuelKeller@gmail.com', N'EmanuelKeller', N'Male', CAST(N'1990-12-12' AS Date), 2, N'01212322412', N'Doctor', N'Ho Chi Minh Viet Nam', N'HANOI MEDICAL UNIVERSITY', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (10, N'Antonio', N'123', N'null', N'AntonioSchneider@gmail.com', N'Antonio	Schneider', N'Male', CAST(N'1992-05-04' AS Date), 2, N'01212322412', N'Nurse', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (11, N'JeremyRoss', N'123', N'null', N'JeremyRoss@gmail.com', N'Jeremy Ross', N'Male', CAST(N'1990-12-12' AS Date), 3, N'01212322412', N'Doctor', N'Ho Chi Minh Viet Nam', N'HANOI MEDICAL UNIVERSITY', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (12, N'MaryannSoto', N'123', N'null', N'MaryannSoto@gmail.com', N'Maryann	Soto', N'Female', CAST(N'1992-05-04' AS Date), 3, N'01212322412', N'Other', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (13, N'JoanneCastro', N'123', N'null', N'JoanneCastro@gmail.com', N'JoanneCastro', N'Female', CAST(N'1992-05-04' AS Date), 3, N'01212322412', N'Nurse', N'NA', N'NA', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (14, N'WandaWright', N'123', N'null', N'WandaWright@gmail.com', N'WandaWright', N'Female', CAST(N'1992-05-04' AS Date), 3, N'01212322412', N'Nurse', N'NA', N'NA', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (15, N'HubertShelton', N'123', N'null', N'HubertShelton@gmail.com', N'HubertShelton', N'Female', CAST(N'1992-05-04' AS Date), 3, N'01212322412', N'Nurse', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (16, N'JordanSteele', N'123', N'null', N'JordanSteele@gmail.com', N'JordanSteele', N'Male', CAST(N'1992-05-04' AS Date), 4, N'01212322412', N'Other', N'NA', N'NA', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (17, N'JackPadilla', N'123', N'null', N'JackPadilla@gmail.com', N'JackPadilla', N'Female', CAST(N'1992-05-04' AS Date), 4, N'01212322412', N'Nurse', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (18, N'MonaReyes', N'123', N'null', N'MonaReyes@gmail.com', N'MonaReyes', N'Female', CAST(N'1992-05-04' AS Date), 4, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (19, N'StaceyMurray', N'123', N'null', N'StaceyMurray@gmail.com', N'StaceyMurray', N'Female', CAST(N'1992-05-04' AS Date), 4, N'01212322412', N'Other', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (20, N'GordonBall', N'123', N'null', N'GordonBall@gmail.com', N'GordonBall', N'Female', CAST(N'1992-05-04' AS Date), 4, N'01212322412', N'Other', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (21, N'VanGuzman', N'123', N'null', N'VanGuzman@gmail.com', N'VanGuzman', N'Male', CAST(N'1992-05-04' AS Date), 5, N'01212322412', N'Nurse', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (22, N'FredrickGregory', N'123', N'null', N'FredrickGregory@gmail.com', N'FredrickGregory', N'Male', CAST(N'1992-05-04' AS Date), 5, N'01212322412', N'Other', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (23, N'JuliaRogers', N'123', N'null', N'JuliaRogers@gmail.com', N'JuliaRogers', N'Female', CAST(N'1992-05-04' AS Date), 5, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (24, N'KevinKelley', N'123', N'null', N'KevinKelley@gmail.com', N'KevinKelley', N'Female', CAST(N'1992-05-04' AS Date), 5, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (25, N'GregWade', N'123', N'null', N'GregWade@gmail.com', N'GregWade', N'Male', CAST(N'1992-05-04' AS Date), 5, N'01212322412', N'Nurse', N'NA', N'NA', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (26, N'RosemaryHill', N'123', N'null', N'RosemaryHill@gmail.com', N'RosemaryHill', N'Female', CAST(N'1992-05-04' AS Date), 6, N'01212322412', N'Other', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (27, N'BillyWheeler', N'123', N'null', N'BillyWheeler@gmail.com', N'BillyWheeler', N'Female', CAST(N'1992-05-04' AS Date), 6, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (28, N'CraigGrant', N'123', N'null', N'CraigGrant@gmail.com', N'CraigGrant', N'Female', CAST(N'1992-05-04' AS Date), 6, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (29, N'ForrestKing', N'123', N'null', N'ForrestKing@gmail.com', N'ForrestKing', N'Female', CAST(N'1992-05-04' AS Date), 6, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (30, N'CarltonBryant', N'123', N'null', N'CarltonBryant@gmail.com', N'CarltonBryant', N'Female', CAST(N'1992-05-04' AS Date), 6, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (31, N'NoraRoy', N'123', N'null', N'NoraRoy@gmail.com', N'NoraRoy', N'Female', CAST(N'1992-05-04' AS Date), 7, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (32, N'DavePhelps', N'123', N'null', N'DavePhelps@gmail.com', N'DavePhelps', N'Female', CAST(N'1992-05-04' AS Date), 7, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (33, N'CharleneLewis', N'123', N'null', N'CharleneLewis@gmail.com', N'CharleneLewis', N'Female', CAST(N'1992-05-04' AS Date), 7, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (34, N'JudithStewart', N'123', N'null', N'JudithStewart@gmail.com', N'JudithStewart', N'Female', CAST(N'1992-05-04' AS Date), 7, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (35, N'ClaudeHowell', N'123', N'null', N'ClaudeHowell@gmail.com', N'ClaudeHowell', N'Female', CAST(N'1992-05-04' AS Date), 7, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (36, N'LelaMcdaniel', N'123', N'null', N'LelaMcdaniel@gmail.com', N'LelaMcdaniel', N'Female', CAST(N'1992-05-04' AS Date), 8, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (37, N'ChesterVega', N'123', N'null', N'ChesterVega@gmail.com', N'ChesterVega', N'Female', CAST(N'1992-05-04' AS Date), 8, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (38, N'CraigPayne', N'123', N'null', N'CraigPayne@gmail.com', N'CraigPayne', N'Female', CAST(N'1992-05-04' AS Date), 8, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (39, N'EleanorRoss', N'123', N'null', N'EleanorRoss@gmail.com', N'EleanorRoss', N'Female', CAST(N'1992-05-04' AS Date), 8, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (40, N'RickMendez', N'123', N'null', N'RickMendez@gmail.com', N'RickMendez', N'Female', CAST(N'1992-05-04' AS Date), 8, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (41, N'DonnaMurphy', N'123', N'null', N'DonnaMurphy@gmail.com', N'DonnaMurphy', N'Female', CAST(N'1992-05-04' AS Date), 12, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (42, N'BrittanyPalmer', N'123', N'null', N'BrittanyPalmer@gmail.com', N'BrittanyPalmer', N'Female', CAST(N'1992-05-04' AS Date), 12, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (43, N'LuzBailey', N'123', N'null', N'LuzBailey@gmail.com', N'LuzBailey', N'Female', CAST(N'1992-05-04' AS Date), 12, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (44, N'EdmundMarsh
', N'123', N'null', N'EdmundMarsh@gmail.com', N'EdmundMarsh', N'Female', CAST(N'1992-05-04' AS Date), 12, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (45, N'WarrenEvans', N'123', N'null', N'WarrenEvans@gmail.com', N'WarrenEvans', N'Female', CAST(N'1992-05-04' AS Date), 12, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (46, N'CharlesMedina', N'123', N'null', N'CharlesMedina@gmail.com', N'CharlesMedina', N'Female', CAST(N'1992-05-04' AS Date), 13, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (47, N'TravisSimon', N'123', N'null', N'TravisSimon@gmail.com', N'TravisSimon', N'Female', CAST(N'1992-05-04' AS Date), 13, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (48, N'WinifredGray', N'123', N'null', N'WinifredGray@gmail.com', N'WinifredGray', N'Female', CAST(N'1992-05-04' AS Date), 13, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (49, N'ChristyWong', N'123', N'null', N'ChristyWong@gmail.com', N'ChristyWong', N'Female', CAST(N'1992-05-04' AS Date), 13, N'01212322412', N'Doctor', N'NA', N'NA', 1, 4)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_Room]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_User1] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_User1]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_User2] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_User2]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_User1] FOREIGN KEY([Createby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_User1]
GO
ALTER TABLE [dbo].[Mission]  WITH CHECK ADD  CONSTRAINT [FK_Mission_User2] FOREIGN KEY([Updateby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Mission] CHECK CONSTRAINT [FK_Mission_User2]
GO
ALTER TABLE [dbo].[MissionWorker]  WITH CHECK ADD  CONSTRAINT [FK_MissionWorker_Mission] FOREIGN KEY([MissionId])
REFERENCES [dbo].[Mission] ([MissionId])
GO
ALTER TABLE [dbo].[MissionWorker] CHECK CONSTRAINT [FK_MissionWorker_Mission]
GO
ALTER TABLE [dbo].[MissionWorker]  WITH CHECK ADD  CONSTRAINT [FK_MissionWorker_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[MissionWorker] CHECK CONSTRAINT [FK_MissionWorker_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_ShiftDay] FOREIGN KEY([ShiftDayID])
REFERENCES [dbo].[ShiftDay] ([ShiftDayID])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_ShiftDay]
GO
ALTER TABLE [dbo].[ShiftDay]  WITH CHECK ADD  CONSTRAINT [FK_ShiftDay_ShiftSchedule] FOREIGN KEY([ShiftScheduleId])
REFERENCES [dbo].[ShiftSchedule] ([ShiftScheduleId])
GO
ALTER TABLE [dbo].[ShiftDay] CHECK CONSTRAINT [FK_ShiftDay_ShiftSchedule]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_Department]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_User] FOREIGN KEY([Createby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_User]
GO
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_User1] FOREIGN KEY([Updateby])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_User1]
GO
ALTER TABLE [dbo].[ShiftSchedulerManager]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedulerManager_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[ShiftSchedulerManager] CHECK CONSTRAINT [FK_ShiftSchedulerManager_Department]
GO
ALTER TABLE [dbo].[ShiftWorker]  WITH CHECK ADD  CONSTRAINT [FK_ShiftWorker_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[ShiftWorker] CHECK CONSTRAINT [FK_ShiftWorker_Shift]
GO
ALTER TABLE [dbo].[ShiftWorker]  WITH CHECK ADD  CONSTRAINT [FK_ShiftWorker_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ShiftWorker] CHECK CONSTRAINT [FK_ShiftWorker_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Hospital_Portal] SET  READ_WRITE 
GO
