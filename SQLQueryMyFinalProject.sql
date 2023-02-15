USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 03-02-2023 23:22:31 ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = OFF
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 03-02-2023 23:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_Name] [varchar](50) NULL,
	[Book_Author] [varchar](50) NULL,
	[Date_Added] [datetime] NULL,
	[Available_Books] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 03-02-2023 23:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_Name] [varchar](50) NULL,
	[Book_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[Borrow_Date] [datetime] NULL,
	[Return_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer1]    Script Date: 03-02-2023 23:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_Customer1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (7, N'Geetanjal', N'Rabindra Nath Tagore', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 20)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (8, N'Time Machine', N' H.G. Wells', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 49)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (9, N'A passage to India', N'E.M.Forster', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 221)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (10, N'The Moon and Sixpence', N'Somerset Maughan', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 43)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (11, N'Mein Kampf ', N'Adolf Hitler', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 99)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (12, N'Divine Comedy', N'Dante', CAST(N'2022-06-08T00:00:00.000' AS DateTime), 10)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (13, N'Listen to Your Heart: The London Adventure', N'Ruskin Bond', CAST(N'2023-01-12T00:00:00.000' AS DateTime), 34)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (14, N'A Place Called Home', N'Preeti Shenoy', CAST(N'2023-02-01T00:00:00.000' AS DateTime), 50)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (15, N'Hear Yourself', N'Indian Author Prem Rawat', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 7)
GO
INSERT [dbo].[Book] ([Book_ID], [Book_Name], [Book_Author], [Date_Added], [Available_Books]) VALUES (16, N'Battle Ready for 21st Century', N'Lt Gen AK Singh and Brig. Narendra Kumar', CAST(N'2022-05-12T00:00:00.000' AS DateTime), 16)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrow] ON 
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (29, N'Divine Comedy', 12, 13, CAST(N'2023-02-03T22:00:22.447' AS DateTime), CAST(N'2023-02-10T22:00:22.447' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (30, N'Time Machine', 8, 3, CAST(N'2023-02-03T22:08:15.607' AS DateTime), CAST(N'2023-02-10T22:08:15.607' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (31, N'Mein Kampf ', 11, 15, CAST(N'2023-02-03T22:31:12.830' AS DateTime), CAST(N'2023-02-10T22:31:12.830' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (32, N'Time Machine', 8, 16, CAST(N'2023-02-03T22:32:19.357' AS DateTime), CAST(N'2023-02-10T22:32:19.357' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (33, N'The Moon and Sixpence', 10, 17, CAST(N'2023-02-03T22:32:43.500' AS DateTime), CAST(N'2023-02-10T22:32:43.500' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (34, N'A passage to India', 9, 18, CAST(N'2023-02-03T22:37:39.680' AS DateTime), CAST(N'2023-02-10T22:37:39.680' AS DateTime))
GO
INSERT [dbo].[Borrow] ([ID], [Book_Name], [Book_ID], [Customer_ID], [Borrow_Date], [Return_Date]) VALUES (35, N'Time Machine', 8, 18, CAST(N'2023-02-03T23:20:34.710' AS DateTime), CAST(N'2023-02-10T23:20:34.710' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Borrow] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer1] ON 
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (3, N'Dhriti', N'dhriti2@gmail.com', N'11111456', 1)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (4, N'MYname', N'name@gmail.com', N'1234', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (10, N'dhriti556', N'dhriti24447@gmail.com', N'1111', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (13, N'Dhriti Sankar Sarkar', N'dhritisankarsarkar@gmail.com', N'1111', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (15, N'Ratul', N'Ratul@gmail.com', N'123456', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (16, N'Arnam', N'arnab@gmail.com', N'1111', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (17, N'Naman Mathur', N'naman@gmail.com', N'4567', 0)
GO
INSERT [dbo].[Customer1] ([ID], [Name], [Email], [Password], [Admin]) VALUES (18, N'Goutam', N'goutam@gmail.com', N'1234567', 0)
GO
SET IDENTITY_INSERT [dbo].[Customer1] OFF
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK__Borrow__Customer__2C3393D0] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer1] ([ID])
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK__Borrow__Customer__2C3393D0]
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
