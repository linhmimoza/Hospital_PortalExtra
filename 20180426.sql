USE [master]
GO
/****** Object:  Database [Hospital_Portal]    Script Date: 26-04-2018 11:50:16 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 26-04-2018 11:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[Mission]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[MissionWorker]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[ShiftDay]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[ShiftSchedule]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[ShiftSchedulerManager]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[ShiftWorker]    Script Date: 26-04-2018 11:50:17 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 26-04-2018 11:50:17 PM ******/
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

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (1, N'BOARD OF DIRECTOR', N'ban giam doc', 1, N'D0')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (2, N'GENERAL PLANNING DEPARTMENT', N'phong ke hoach', 1, N'D1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (3, N'NURSING DEPARTMENT ', N'Phong dieu duong', 1, N'D2')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (4, N'PSYCHOLOGY DEPARTMEN', N'Khoa tam ly', 1, N'D3')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (5, N'OUTPATIENT DEPARTMENT', N'OUTPATIENT DEPARTMENT', 2, N'D4')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (6, N'DEPARTMENT OF CHILD HEALTHCARE', N'DEPARTMENT OF CHILD HEALTHCARE', 2, N'D5')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (7, N'EMERGENCY DEPARTMENT', N'EMERGENCY DEPARTMENT', 1, N'D6')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (8, N'PEDIATRIC                 DEPARTMENT 1', N'', 2, N'P1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (12, N'GENERAL SURGERY DEPARTMENT', N'11', 1, N'G1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (13, N'ENT – EYE – ODONTOLOGY DEPARTMENT', N'e', 1, N'E1')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [Description], [Status], [Code]) VALUES (14, N'Sercurity', N'Sercurity', 1, N'S1')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Meeting] ON 

INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (8, 6, N'Daily meeting', CAST(N'01:30:00' AS Time), CAST(N'02:30:00' AS Time), CAST(N'2018-05-05' AS Date), N'Daily meeting', N'Daily meeting', 2, CAST(N'2018-03-30 02:02:42.000' AS DateTime), 2, CAST(N'2018-04-01 23:43:18.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (2, 2, N'Capston meeting', CAST(N'01:00:00' AS Time), CAST(N'01:00:00' AS Time), CAST(N'2018-04-02' AS Date), N'Demo project', N'fighting!', 2, CAST(N'2018-04-01 23:47:21.000' AS DateTime), 2, CAST(N'2018-04-03 17:22:43.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (3, 1, N'new meeting', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time), CAST(N'2018-04-13' AS Date), N'hop demo', N'', 2, CAST(N'2018-04-02 13:28:38.000' AS DateTime), 2, CAST(N'2018-04-02 13:28:58.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (4, 1, N'Weekly Meeting', CAST(N'01:00:00' AS Time), CAST(N'01:00:00' AS Time), CAST(N'2018-04-21' AS Date), N'Weekly Meeting', N'', 2, CAST(N'2018-04-03 17:22:34.000' AS DateTime), 2, CAST(N'2018-04-15 20:37:57.000' AS DateTime), 2)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (5, 1, N'Weekly Meeting', CAST(N'17:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(N'2018-04-29' AS Date), N'Weekly Meeting', N'', 2, CAST(N'2018-04-03 17:23:42.000' AS DateTime), 2, CAST(N'2018-04-03 17:24:46.000' AS DateTime), 3)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (6, 1, N'Weekly Meeting', CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'2018-04-29' AS Date), N'Weekly Meeting', N'', 2, CAST(N'2018-04-03 17:26:00.000' AS DateTime), 2, CAST(N'2018-04-08 22:35:14.000' AS DateTime), 1)
INSERT [dbo].[Meeting] ([MeetingId], [RoomId], [MeetingName], [StartTime], [Duration], [Date], [Content], [Note], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate], [Status]) VALUES (7, 2, N'Meeting', CAST(N'06:00:00' AS Time), CAST(N'08:30:00' AS Time), CAST(N'2018-04-26' AS Date), N'Meeting', N'MoNone', 2, CAST(N'2018-04-23 07:50:15.000' AS DateTime), 2, CAST(N'2018-04-26 22:54:49.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Meeting] OFF
SET IDENTITY_INSERT [dbo].[Mission] ON 

INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (1, CAST(N'2018-03-14' AS Date), CAST(N'2018-03-18' AS Date), N'Ha noi', N'công tac', N'iii', 3, 2, CAST(N'2018-03-30 02:04:05.000' AS DateTime), 2, CAST(N'2018-04-07 23:57:18.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (2, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-20' AS Date), N'Ha Noi', N'Du Lich', N'abc', 2, 2, CAST(N'2018-04-02 13:31:15.000' AS DateTime), 2, CAST(N'2018-04-23 07:47:50.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (3, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-26' AS Date), N'campuchia', N'ASIAN Medical meeting', N'..', 2, 2, CAST(N'2018-04-03 16:34:32.000' AS DateTime), 2, CAST(N'2018-04-03 21:40:05.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (4, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-27' AS Date), N'Ha Noi', N'Trao doi', N'null', 2, 4, CAST(N'2018-04-09 13:51:01.000' AS DateTime), 4, CAST(N'2018-04-26 22:55:15.000' AS DateTime))
INSERT [dbo].[Mission] ([MissionId], [StartDate], [EndDate], [Place], [Content], [Note], [Status], [Createby], [CreateDate], [Updateby], [UpdateDate]) VALUES (5, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-12' AS Date), N'Ha noi', N'cong tac', N'dem giay to', 2, 2, CAST(N'2018-04-23 07:46:52.000' AS DateTime), 2, CAST(N'2018-04-23 07:47:09.000' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[MissionWorker] OFF
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (3, N'name', N'content', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-26 15:53:45.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (5, N'new', N'<p style=''text-align: center;''><strong><em>c</em></strong>o<span style=''text-decoration: underline;''>n</span></p>', CAST(N'2018-03-30 00:00:00.000' AS DateTime), 2, CAST(N'2018-04-26 16:33:47.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (6, N'name', N'content', CAST(N'2018-03-30 01:42:01.000' AS DateTime), 2, CAST(N'2018-03-30 01:42:01.000' AS DateTime), 2, 1)
INSERT [dbo].[Notification] ([NotificationId], [NotificationName], [Content], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy], [Status]) VALUES (7, N'aaaa', N'<p style="text-align: center;"><span style="text-decoration: underline;"><a href="https://www.facebook.com/">face</a>qweqw<em>qweqweqdqwd</em></span></p>
<p style="text-align: left;">wwwwwwwwwwww</p>
<p style="text-align: right;"><strong>eeeeeeeeeee</strong></p>', CAST(N'2018-04-21 16:43:28.000' AS DateTime), 2, CAST(N'2018-04-26 15:57:38.000' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Notification] OFF
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Scheduler')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (1, N'room 201', 12, 1)
INSERT [dbo].[Room] ([RoomId], [RoomName], [RoomSize], [Status]) VALUES (2, N'room303', 10, 1)
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
SET IDENTITY_INSERT [dbo].[ShiftSchedule] OFF
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W10', 4, 1, 1)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W11', 6, 2, 2)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W12', 6, 0, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W12', 13, 7, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W15', 13, 4, 4)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W16', 1, 10, 10)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W16', 13, 0, 0)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W17', 13, 9, 9)
INSERT [dbo].[ShiftSchedulerManager] ([Week], [DepartmentId], [Waiting], [Checked]) VALUES (N'2018-W18', 13, 13, 13)
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
SET IDENTITY_INSERT [dbo].[ShiftWorker] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (1, N'admin', N'123', NULL, N'admin@gmail.com', N'Admin', N'1', CAST(N'1990-01-01' AS Date), 1, N'01212322412', N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (2, N'manager', N'123', N'null', N'manager@gmail.com', N'Manager', N'Male', CAST(N'2018-01-01' AS Date), 1, N'01212322412', N'Doctor', N'123/4 abc street xyz city', N'non', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (3, N'longhh', N'123', N'null', N'hoanglong0505@gmail.com', N'Ho Hoang Long', N'Male', CAST(N'1996-05-05' AS Date), 4, N'01212322412', N'Doctor', N'qwe', N'qwe', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (4, N'scheduler', N'123', N'null', N'scheduler@gmail.com', N'Scheduler', N'Female', CAST(N'1990-01-01' AS Date), 2, N'01212322412', N'Doctor', N'qwe', N'qw', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (5, N'AnNV', N'123', N'null', N'An@gmail.com', N'Nguyen Van An', N'Male', CAST(N'1996-05-05' AS Date), 13, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (6, N'BinhNV', N'123', N'null', N'Binh@gmail.com', N'Nguyen Van Binh', N'Male', CAST(N'1996-05-05' AS Date), 13, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (7, N'ThanhNV', N'123', N'null', N'Thanh@gmail.com', N'Nguyen Van Thanh', N'Male', CAST(N'1996-05-05' AS Date), 13, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 2, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (8, N'CongNV', N'123', N'null', N'Cong@gmail.com', N'Nguyen Van Cong', N'Male', CAST(N'1996-05-05' AS Date), 13, N'01212322412', N'Doctor', N'Nguyen Hue Street District 1', N'University of Medicine and Pharmacy HCM', 1, 4)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (9, N'EmanuelKeller', N'123', N'null', N'EmanuelKeller@gmail.com', N'EmanuelKeller', N'Male', CAST(N'1990-12-12' AS Date), 1, N'01212322412', N'Doctor', N'Ho Chi Minh Viet Nam', N'HANOI MEDICAL UNIVERSITY', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (10, N'Antonio', N'123', N'null', N'AntonioSchneider@gmail.com', N'Antonio	Schneider', N'Male', CAST(N'1992-05-04' AS Date), 1, N'01212322412', N'Other', N'NA', N'NA', 1, 3)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (11, N'JeremyRoss', N'123', N'null', N'JeremyRoss@gmail.com', N'Jeremy Ross', N'Male', CAST(N'1990-12-12' AS Date), 1, N'01212322412', N'Doctor', N'Ho Chi Minh Viet Nam', N'HANOI MEDICAL UNIVERSITY', 1, 2)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Avatar], [Email], [FullName], [Sex], [DayOfBirth], [DepartmentId], [Phone], [Position], [Address], [Certificate], [Status], [RoleId]) VALUES (12, N'MaryannSoto', N'123', N'null', N'MaryannSoto@gmail.com', N'Maryann	Soto', N'Female', CAST(N'1992-05-04' AS Date), 1, N'01212322412', N'Other', N'NA', N'NA', 1, 3)
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
