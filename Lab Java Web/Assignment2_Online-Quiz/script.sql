USE [master]
GO
/****** Object:  Database [Assignment2_NguyenLamCongDanh]    Script Date: 2/3/2021 11:35:46 AM ******/
CREATE DATABASE [Assignment2_NguyenLamCongDanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2_NguyenLamCongDanh', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_NguyenLamCongDanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_NguyenLamCongDanh_log', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_NguyenLamCongDanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2_NguyenLamCongDanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET QUERY_STORE = OFF
GO
USE [Assignment2_NguyenLamCongDanh]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[Email] [varchar](100) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [varchar](500) NULL,
	[Role] [varchar](20) NULL,
	[Status] [varchar](30) NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cont] [text] NULL,
	[QuestionId] [int] NULL,
	[Correctly] [bit] NULL,
 CONSTRAINT [PK_tblAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cont] [text] NULL,
	[Status] [varchar](30) NULL,
	[Subject] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestionTesting]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionTesting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[Cont] [text] NULL,
	[Status] [varchar](30) NULL,
	[Subject] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[StartTime] [datetime] NULL,
 CONSTRAINT [PK_tblQuestionTesting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizHistory]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[AnswerId] [int] NULL,
	[SubmitId] [int] NULL,
 CONSTRAINT [PK_tblQuizHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TestTime] [int] NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubmit]    Script Date: 2/3/2021 11:35:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubmit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[SubjectId] [varchar](50) NULL,
	[Point] [float] NULL,
	[NumberOfTrue] [int] NULL,
	[QuantityOfQuestion] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_tblSubmit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'', N'', NULL, NULL, NULL)
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'danhnlcse140655@fpt.edu.vn', N'Nguyen Lam Cong Danh', N'vfewOzH/BXajBVAWOGhNkUZCEINXYmOZ0/xT9kRYB4s=', N'student', N'New')
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'nguyenlamcongdanh@gmail.com', N'Nguyen Lam Cong Danh', N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', N'student', N'New')
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'nguyenlamcongdanh02052000@gmail.com', N'Monkey.D.Luffy', N'XIBWXbbynaCwGqElIsN7MvEhy+R6hh738AbLIpIt/6E=', N'teacher', N'New')
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'student2000@gmail.com', N'Student Tester', N'cDsKPWrXW2SaKK3efYPGJR2kV1SSY7x/9F7HCbCoRIs=', N'student', N'New')
INSERT [dbo].[tblAccount] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'teachertesting@gmail.com', N'Teacher Tester', N'zeOD7ujuekQArfehX3FvF5ouuXZGs34InrjW0E5mNBY=', N'teacher', N'New')
GO
SET IDENTITY_INSERT [dbo].[tblAnswer] ON 

INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (1, N'JButton', 1, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (2, N'JTextField', 1, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (3, N'JPanel', 1, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (4, N'JFrame', 1, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (5, N'JPanel', 2, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (6, N'JButton', 2, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (7, N'JFrame', 2, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (8, N'JComponent', 2, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (9, N'Association', 3, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (10, N'Aggregation', 3, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (11, N'Composition', 3, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (12, N'Inheritance', 3, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (13, N'Association', 4, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (14, N'Aggregation', 4, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (15, N'Composition', 4, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (16, N'Inheritance', 4, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (17, N'Association', 5, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (18, N'Aggregation', 5, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (19, N'Composition', 5, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (20, N'Inheritance', 5, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (21, N'Association', 6, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (22, N'Aggregation', 6, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (23, N'Composition', 6, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (24, N'Inheritance', 6, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (25, N'JPanel p = new JPanel()', 7, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (26, N'JPanel p = new JPanel(BorderLayout());', 7, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (27, N'JPanel p = new JPanel(new BorderLayout());', 7, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (28, N'JPanel p = new JPanel().setLayout(new BorderLayout());', 7, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (29, N'p.add(c)', 8, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (30, N'p.getContentPane(c)', 8, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (31, N'p.insert(c)', 8, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (32, N'p.append(c)  ACD', 8, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (33, N'p.add(c)', 9, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (34, N'p.getContentPane(c)', 9, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (35, N'p.insert(c)', 9, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (36, N'p.append(c)  ACD', 9, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (37, N'p.add(c)', 10, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (38, N'p.getContentPane(c)', 10, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (39, N'p.insert(c)', 10, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (40, N'p.append(c)  ACD', 10, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (41, N'p.add(c)', 11, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (42, N'p.getContentPane(c)', 11, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (43, N'p.insert(c)', 11, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (44, N'p.append(c)  ACD', 11, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (45, N'the user has closed all his/her browser windows.', 12, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (46, N'the request is the first request from the user.', 12, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (47, N'the user''s browser does not support URL rewriting.', 12, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (48, N'the session attribute of page directive is set to false.', 12, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (49, N'The name used to manipulate the Java object with actions <jsp:setProperty> and <jsp:getProperty>. A variable of this name is also declared for use in JSP scripting elements. The name specified here is call..', 13, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (50, N'The name of a bean that can be used with method instantiate of class java.beans.Beans to load a JavaBean into memory.', 13, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (51, N'The fully qualified class name of the Java object', 13, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (52, N'The scope in which the Java object is accessible-page. request session or application. The default scope is page.  d', 13, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (53, N'a FlowLayout', 14, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (54, N'a GridLayout', 14, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (55, N'a BorderLayout', 14, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (56, N'any layout', 14, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (57, N'a FlowLayout', 15, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (58, N'a GridLayout', 15, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (59, N'the center area of a BorderLayout', 15, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (60, N'the North or South area of a BorderLayout', 15, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (61, N'1', 16, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (62, N'2', 16, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (63, N'3', 16, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (64, N'4', 16, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (65, N'1', 17, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (66, N'2', 17, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (67, N'3', 17, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (68, N'4', 17, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (69, N'jp.setLayout(new FlowLayout());', 18, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (70, N'jp.setLayout(new FlowLayout(FlowLayout.CENTER));', 18, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (71, N'jp.setLayout(new FlowLayout(FlowLayout.center));', 18, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (72, N'jp.setLayout(FlowLayout());', 18, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (73, N'FlowLayout', 19, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (74, N'GridLayout', 19, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (75, N'BorderLayout', 19, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (76, N'None', 19, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (77, N'FlowLayout', 20, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (78, N'GridLayout', 20, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (79, N'BorderLayout', 20, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (80, N'None', 20, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (81, N'JPanel p = new JPanel();', 21, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (82, N'JPanel p = new JPanel(BorderLayout());', 21, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (83, N'JPanel p = new JPanel(new BorderLayout());', 21, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (84, N'JPanel p = new JPanel().setLayout(new BorderLayout());', 21, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (85, N'jbt.text()', 22, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (86, N'jbt.getText()', 22, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (87, N'jbt.findText()', 22, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (88, N'jbt.retrieveText().', 22, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (89, N'new ImageIcon("c:\image\us.gif");', 23, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (90, N'new Icon("c:\image\us.gif");', 23, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (91, N'new ImageIcon("c:\\image\\us.gif");', 23, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (92, N'new Icon("c:\\image\\us.gif");', 23, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (93, N'jbt.setVerticalTextPosition(JButton.LEFT)', 24, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (94, N'jbt.setHorizontalTextPosition(JButton.LEFT)', 24, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (95, N'jbt.setHorizontalTextPosition(JButton.RIGHT)', 24, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (96, N'jbt.setHorizontalAlignment(JButton.RIGHT)', 24, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (97, N'jchk.getSelected()', 25, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (98, N'jchk.selected()', 25, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (99, N'jchk.isSelected().', 25, 1)
GO
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (100, N'jchk.select()', 25, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (101, N'jlbl.setMnemonic("A");', 26, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (102, N'jlbl.setMnemonic(''A'');', 26, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (103, N'jlbl.setIconTextGap(50);', 26, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (104, N'jlbl.setTextGap(50);', 26, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (105, N'jlbl.setText("Result")', 27, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (106, N'jlbl.newText("Result")', 27, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (107, N'jlbl.text("Result")', 27, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (108, N'jlbl.findText()', 27, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (109, N'A label', 28, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (110, N'A check box', 28, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (111, N'A text field', 28, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (112, N'A radio button', 28, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (113, N'ActionEvent', 29, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (114, N'ItemEvent', 29, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (115, N'ComponentEvent', 29, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (116, N'ContainerEvent', 29, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (117, N'jta.setText(s)', 30, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (118, N'jta.appendText(s)', 30, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (119, N'jta.append(s)', 30, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (120, N'jta.insertText(s)', 30, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (121, N'jta.setWrapStyleWord(false)', 31, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (122, N'jta.setWrapStyleWord(true)', 31, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (123, N'jta.wrapStyleWord()', 31, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (124, N'jta.wrapWord()', 31, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (125, N'jScrollPane.add(jta)', 32, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (126, N'jScrollPane.insert(jta)', 32, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (127, N'jScrollPane.addItem(jta)', 32, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (128, N'None of the above.', 32, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (129, N'0', 33, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (130, N'1', 33, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (131, N'2', 33, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (132, N'Unlimited', 33, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (133, N'jcbo.getSelectedIndex()', 34, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (134, N'jcbo.getSelectedItem()', 34, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (135, N'jcbo.getSelectedIndices()', 34, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (136, N'jcbo.getSelectedItems()', 34, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (137, N'jcbo.add(s)', 35, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (138, N'jcbo.addChoice(s)', 35, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (139, N'jcbo.addItem(s)', 35, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (140, N'jcbo.addObject(s).', 35, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (141, N'A text field', 36, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (142, N'A combo box', 36, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (143, N'A list', 36, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (144, N'A label', 36, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (145, N'scriptlets', 37, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (146, N'expressions', 37, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (147, N'declarations', 37, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (148, N'All of them', 37, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (149, N'getField("email") of HttpServletRequest', 38, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (150, N'getFormValue("email") of HttpServletRequest', 38, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (151, N'getParameter("email") of ServletRequest', 38, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (152, N'getParameters("email") ofHttpServlet', 38, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (153, N'terror-location', 39, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (154, N'error', 39, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (155, N'error-page', 39, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (156, N'error_page', 39, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (157, N'JMS enhances access to email services', 40, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (158, N'JMS uses JNDI to find destination', 40, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (159, N'JMS uses JMX to create a connection Factory', 40, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (160, N'None of the above', 40, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (161, N'session -configuration', 41, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (162, N'webapp', 41, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (163, N'session_config', 41, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (164, N'session-config', 41, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (165, N'Java EE 5', 42, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (166, N'Java EE 4', 42, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (167, N'Java EE 3', 42, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (168, N'Java EE 6', 42, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (169, N'jsp:useBean id="pref" name="com/enthu/GUI.ser" ', 43, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (170, N'jsp:useBean id="pref" name="com.enthu.GUI" ', 43, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (171, N'jsp:useBean id="pref" type="com/enthu/GUI.ser"', 43, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (172, N'jsp:useBean id="pref" beanName="com.enthu.GUI" type="com.enthu.GUI"', 43, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (173, N' request.setAttribute(name, value);', 44, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (174, N'request.getSession().setAttribute(name, value).;', 44, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (175, N'response.setAttribute(name, value);', 44, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (176, N'request.setParameter(name, value);', 44, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (177, N'FWorks/WEB-INF', 45, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (178, N'FWorks/classes', 45, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (179, N'FWorks/WEB-INF/classes', 45, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (180, N'FWorks/WEB-INF/lib/classes', 45, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (181, N'<exception> <exception-type> mypackage.MyException </exception-type> <location> /error.jsp</location> </exception>', 46, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (182, N'<error-page> <exception-type> mypackage.MyException </exception-type> <location> /error.jsp</location> </error-page>', 46, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (183, N'<error-page> <exception> mypackage.MyException </exception-type> <location> /error.jsp </location> </error-page>', 46, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (184, N'<error-page> <exception-type> mypackage.MyException </exception-type> </error-page>', 46, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (185, N'name', 47, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (186, N'action', 47, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (187, N'localhost', 47, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (188, N'id', 47, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (189, N'Specifies the relative or absolute URI of the tag library descriptor.', 48, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (190, N'Specifies the required prefix that distinguishes custom tags from built-in tags. The prefix names jsp, jspx, java, javax, servlet, sun and sunw are reserved.', 48, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (191, N'Allows programmers to include their own new tags in the form of tag libraries. These libraries can be used to encapsulate functionality and simplify the coding of a JSP.', 48, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (192, N'The scripting language used in the JSP. Currently, the only valid value for this attribute is java.', 48, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (193, N'Session data is shared across multiple webapps in the same Webserver/servlet container.', 49, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (194, N'Any serializable object can be put into a session.', 49, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (195, N'To use session, the client browser must support cookies.', 49, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (196, N'A session can only be invalidated after "session-timeout" minutes of inactivity.', 49, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (197, N'3', 50, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (198, N'0', 50, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (199, N'1', 50, 0)
GO
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (200, N'2', 50, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (201, N'The page display "Welcome John"', 51, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (202, N'The program gives a syntax error because of the statement <% String myName=request.getParameter("name");%>', 51, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (203, N'The program gives a syntax error because of the statement <% String test= "Welcome " + myName; %>', 51, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (204, N'The program gives a syntax error because of the statement <%=test%>', 51, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (205, N'RequestDispatcher rd = request.getRequestDispatcher("some url"); rd.forward(request, response);', 52, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (206, N'response.sendRedirect("some url");', 52, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (207, N'request.sendRedirect("some url");', 52, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (208, N'RequestDispatcher rd = this.getServletContext().getRequestDispatcher("some url"); rd.forward(request, response);', 52, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (209, N'<%= request.getParameter("myParm") %>', 53, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (210, N'<% String s = getAttributef''myParm"); %>', 53, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (211, N'<%= getParameter("myParm") %>', 53, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (212, N'<% String s = getInitParameter("myParm"); %>', 53, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (213, N'GET', 54, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (214, N'HEAD', 54, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (215, N'FORM', 54, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (216, N'POST', 54, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (217, N'The parameters will be appended to the URL as a query string.', 55, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (218, N'You can only reply with the HEADER information in the response.', 55, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (219, N'None of the others', 55, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (220, N'You cannot send multiple values for one parameter to the server', 55, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (221, N'doPut', 56, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (222, N'doPost', 56, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (223, N'doHead', 56, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (224, N'doGet', 56, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (225, N'getMaxinactivelnterval()', 57, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (226, N'getCreation Time()', 57, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (227, N'getLastAccessTime()', 57, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (228, N'getLastAccessedTime()', 57, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (229, N'HttpSession', 58, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (230, N'Application Context', 58, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (231, N'ServletContext', 58, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (232, N'ServletConfig', 58, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (233, N'public class Employees implements Serializable{ ... }', 59, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (234, N'@Entity public class Employees implements Serializable{ ... }', 59, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (235, N'@entity public class Employees implements Serializable{ ... }', 59, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (236, N'@Entity public class Employees implements SessionSynchronization{ ... }', 59, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (237, N'localhost', 60, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (238, N'DNS', 60, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (239, N'IP', 60, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (240, N'computer name', 60, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (241, N'request', 61, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (242, N'response', 61, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (243, N'session', 61, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (244, N'application', 61, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (245, N'get of Session', 62, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (246, N'getValues of HttpSession', 62, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (247, N'getAttribute of Session', 62, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (248, N'getAttribute of HttpSession', 62, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (249, N'If the session time out is set to 0 using setMaxlnactiveInterval() method.', 63, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (250, N'No request comes from the client for more than "session timeout" period', 63, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (251, N'A servlet explicitly calls invalidate() on a session object', 63, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (252, N'The container is shutdown and brought up agian', 63, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (253, N'jsp:setProperty', 64, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (254, N'jsp:useBean.setProperty', 64, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (255, N'jsp:useBean', 64, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (256, N'jsp:useBean.Property', 64, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (257, N'It can not be done without cookie support', 65, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (258, N'Using Http headers.', 65, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (259, N'URL Writing', 65, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (260, N'Hidden form fields', 65, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (261, N'request', 66, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (262, N'application', 66, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (263, N'session', 66, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (264, N'page', 66, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (265, N'Servlet', 67, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (266, N'JSP', 67, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (267, N'EJB', 67, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (268, N'JavaMail', 67, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (269, N'HttpServletResponse.addCookie(Cookie cookie)', 68, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (270, N'ServletResponse.addCookie(Cookie cookie)', 68, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (271, N'ServletResponse.addCookie(String contents)', 68, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (272, N'HttpServletResponse.addCookie(String contents)', 68, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (273, N'taglib-uri', 69, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (274, N'uri-name', 69, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (275, N'uri-location', 69, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (276, N'tag-uri', 69, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (277, N'actions', 70, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (278, N'name of a jsp file', 70, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (279, N'tag libraries', 70, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (280, N'scriptlets', 70, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (281, N'<%= out.println("hello"); %>', 71, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (282, N'<% "Hello World"; %>', 71, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (283, N'<%= "Hello World"; %>', 71, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (284, N'<%= newDate() %>', 71, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (285, N'\WEB-INF\lib', 72, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (286, N'\jars', 72, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (287, N'\WEB-INF', 72, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (288, N'\WEB-INF\classes', 72, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (289, N'getStream', 73, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (290, N'getOutputStream', 73, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (291, N'getBinaryStream', 73, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (292, N'getWriter', 73, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (293, N'SSL Sessions', 74, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (294, N'HTTP is already a stateful protocol.', 74, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (295, N'Cookies', 74, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (296, N'URL rewriting', 74, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (297, N'The class attribute must be defined for jsp:useBean', 75, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (298, N'The id attribute must be defined for jsp:useBean', 75, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (299, N'The scope attribute must be defined for jsp:useBean', 75, 0)
GO
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (300, N'None of the above', 75, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (301, N'<%! page import="java.util.TreeMap"%>', 76, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (302, N'<%@ import="java.util.TreeMap"%>', 76, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (303, N'<%! import="java.util.TreeMap"%>', 76, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (304, N'<%@ page import="java.util.TreeMap"%>', 76, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (305, N'Database', 77, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (306, N'Database Instance', 77, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (307, N'Schema', 77, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (308, N'Schema Instance', 77, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (309, N'Database is created and maintained by a DMBS', 78, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (310, N'All of the others', 78, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (311, N'Database is a collection of data that is managed by a DBMS', 78, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (312, N'Database is a collection of information that exists over a long period of time', 78, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (313, N'Hierarchical data model', 79, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (314, N'Graph-based data model', 79, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (315, N'Tree-based data model', 79, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (316, N'None of the others', 79, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (317, N'schema', 80, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (318, N'database', 80, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (319, N'database instance', 80, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (320, N'schema instance', 80, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (321, N'data model', 81, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (322, N'database management system', 81, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (323, N'data operation', 81, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (324, N'data manipulation', 81, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (325, N'DDL', 82, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (326, N'DML', 82, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (327, N'DCL', 82, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (328, N'None of the others', 82, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (329, N'REMOVE TABLE R;', 83, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (330, N'DELETE TABLE R;', 83, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (331, N'DROP TABLE R;', 83, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (332, N'TRUNCATE TABLE R;', 83, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (333, N'Attribute', 84, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (334, N'Tuple', 84, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (335, N'Field', 84, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (336, N'Relation', 84, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (337, N'A Relationship in E/R model', 85, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (338, N'An attribute in E/R model', 85, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (339, N'None of the others', 85, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (340, N'An entity set in E/R model', 85, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (341, N'Attributes', 86, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (342, N'Entities', 86, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (343, N'attributes on a relationship', 86, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (344, N'entity sets', 86, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (345, N'SUM', 87, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (346, N'GROUP', 87, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (347, N'COUNT', 87, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (348, N'AVG', 87, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (349, N'1', 88, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (350, N'2', 88, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (351, N'3', 88, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (352, N'4', 88, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (353, N'IS BLANK operator', 89, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (354, N'IS ZERO operator', 89, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (355, N'IS NULL operator', 89, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (356, N'ISNULL operator', 89, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (357, N'The value NULL means UNKNOWN', 90, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (358, N'The value NULL means '''' (empty string)', 90, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (359, N'The value NULL means '' '' (space character)', 90, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (360, N'The value NULL means ZERO', 90, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (361, N'''Nancy Smith''', 91, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (362, N'''Nancy''', 91, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (363, N'''NancySmith''', 91, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (364, N'NULL', 91, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (365, N'ORDER BY', 92, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (366, N'SORT BY', 92, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (367, N'ORDER', 92, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (368, N'SORT', 92, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (369, N'You can remove a trigger by dropping it or by dropping the trigger table.', 93, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (370, N'The syntax to remove a trigger is: DROP TRIGGER  trigger_name', 93, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (371, N'Use ALTER TRIGGER to change the definition of a trigger', 93, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (372, N'All of the others.', 93, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (373, N'Unique key constraint', 94, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (374, N'Primary key constraint', 94, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (375, N'Foreign key constraint', 94, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (376, N'Candidate key constraint', 94, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (377, N'A table can have more than one PRIMARY KEY constraint but only one UNIQUE KEY', 95, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (378, N'A table can have more than one UNIQUE KEY constraint but only one PRIMARY KEY', 95, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (379, N'UNIQUE KEY and PRIMARY KEY are the same', 95, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (380, N'None of the above', 95, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (381, N'Trigger', 96, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (382, N'stored-procedure', 96, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (383, N'View', 96, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (384, N'Index', 96, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (385, N'Using Stored procedures reduces network traffic', 97, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (386, N'Using Stored procedures improves security', 97, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (387, N'Using Stored procedures improves performance', 97, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (388, N'All of the others', 97, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (389, N'Primitive', 98, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (390, N'Parent', 98, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (391, N'Child', 98, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (392, N'Nested', 98, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (393, N'DBMS', 99, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (394, N'Database', 99, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (395, N'Excel', 99, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (396, N'None of the others', 99, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (397, N'Relational', 100, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (398, N'Network', 100, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (399, N'Flat-file', 100, 0)
GO
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (400, N'Object-oriented', 100, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (401, N'SELECT', 101, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (402, N'ALTER TABLE', 101, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (403, N'UPDATE', 101, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (404, N'INSERT', 101, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (405, N'Data Definition Language', 102, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (406, N'Data Manipulation Language', 102, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (407, N'Data Controlling Language', 102, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (408, N'None of the others', 102, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (409, N'DELETE', 103, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (410, N'ALTER TABLE', 103, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (411, N'INSERT', 103, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (412, N'UPDATE', 103, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (413, N'Aggregation', 104, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (414, N'Composition', 104, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (415, N'Association', 104, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (416, N'Relation', 104, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (417, N'DELETE', 105, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (418, N'GRANT', 105, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (419, N'INSERT', 105, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (420, N'UPDATE', 105, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (421, N'does not depend on other entities', 106, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (422, N'does not have enough key attribute(s)', 106, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (423, N'is an entity that has not any key-attribute', 106, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (424, N'None of the others', 106, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (425, N'Delegates', 107, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (426, N'Buttons', 107, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (427, N'Methods', 107, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (428, N'Threads', 107, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (429, N'Is used to describe information about the web service.', 108, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (430, N'Is executed by web server.', 108, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (431, N'Is based on HTML.', 108, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (432, N'Is executed by client', 108, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (433, N'ComboBox', 109, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (434, N'ListBox', 109, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (435, N'DateTimePicker', 109, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (436, N'TextBox', 109, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (437, N'Session', 110, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (438, N'Application', 110, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (439, N'ViewState', 110, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (440, N'Cookie', 110, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (441, N'Event', 111, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (442, N'Delegate', 111, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (443, N'AsyncCallback', 111, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (444, N'IAsyncResult', 111, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (445, N'Form.Let. Request object', 112, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (446, N'Form.Get Request object', 112, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (447, N'Form.Get. Response object', 112, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (448, N'Form.Let Response object', 112, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (449, N'Text', 113, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (450, N'Label', 113, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (451, N'LinkLabel', 113, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (452, N'TextBox', 113, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (453, N'Description and MessageName', 114, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (454, N'Description. MessageName and EnableSession.', 114, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (455, N'Description. MessageName and Namespace.', 114, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (456, N'Description. Name and Namespace.', 114, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (457, N'StatusBar', 115, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (458, N'Label', 115, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (459, N'ComboBox', 115, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (460, N'ToolBar', 115, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (461, N'DefaultButton', 116, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (462, N'OKButton', 116, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (463, N'AcceptButton', 116, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (464, N'EnterButton', 116, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (465, N'UDDI is a protocol to move information between consumers and web services.', 117, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (466, N'UDDI is a language is used to build a XML web sen/ice.', 117, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (467, N'UDDI is a language is used to describe a XML web service.', 117, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (468, N'UDDI is the white pages for XML web sen/ices.', 117, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (469, N'Session', 118, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (470, N'Application', 118, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (471, N'ViewState', 118, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (472, N'Cookie', 118, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (473, N'Many constructors and many destructors.', 119, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (474, N'Only one constructor and only one destructor.', 119, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (475, N'Many constructors and only one destructor.', 119, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (476, N'Only one constructor and many destructors.', 119, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (477, N'Dock', 120, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (478, N'Hang', 120, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (479, N'Fixed', 120, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (480, N'Anchor', 120, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (481, N'Primary keys. Foreign keys', 121, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (482, N'Columns. Rows', 121, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (483, N'Rows. Constraints', 121, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (484, N'Columns. Constraints', 121, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (485, N'Methods', 122, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (486, N'Properties', 122, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (487, N'Constructor', 122, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (488, N'Events', 122, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (489, N'DataReader', 123, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (490, N'Data Adapter', 123, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (491, N'Connection', 123, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (492, N'Command', 123, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (493, N'CharacterUpper', 124, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (494, N'CharacterCasing', 124, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (495, N'CharacterLower', 124, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (496, N'PasswordChar', 124, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (497, N'Global. Session', 125, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (498, N'Server. Response', 125, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (499, N'Application. Request', 125, 0)
GO
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (500, N'Session. Application', 125, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (501, N'Delegates', 126, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (502, N'Types', 126, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (503, N'Members', 126, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (504, N'Attributes', 126, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (505, N'Use the Opacity property', 127, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (506, N'Use the BackColor property', 127, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (507, N'Use the ForeColor property', 127, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (508, N'Use the Transparent property ', 127, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (509, N'You cannot change value of an Application variable.', 128, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (510, N'Application variables cannot be shared among all users.', 128, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (511, N'Application variables cannot be shared across all pages.', 128, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (512, N'Application variable is maintained by an instance of the HttpApplicationState type  ...', 128, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (513, N'Exists for the Life of the current page', 129, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (514, N'2 seconds', 129, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (515, N'2 minutes', 129, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (516, N'20 minutes', 129, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (517, N'Session_End()', 130, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (518, N'Application_EndO', 130, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (519, N'Session_Start()', 130, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (520, N'Application_StartO', 130, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (521, N'ToolStripButton', 131, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (522, N'ToolStripTextBox', 131, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (523, N'ToolStripLabel', 131, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (524, N'ToolStripProgressBar', 131, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (525, N'A collection ofDataColumn objects.', 132, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (526, N'A collection of DataRelation objects.', 132, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (527, N'A view object', 132, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (528, N'A collection of DataRow objects.', 132, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (529, N'CustomValidator', 133, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (530, N'RangeValidator', 133, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (531, N'RequiredFieldValidator', 133, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (532, N'CompareValidator', 133, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (533, N'public and private.', 134, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (534, N'out ref and params.', 134, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (535, N'params only.', 134, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (536, N'out and ref only.', 134, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (537, N'The project''s Property window.', 135, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (538, N'The Solution Explorer utility.', 135, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (539, N'The Object Browser utility.', 135, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (540, N'The Code Definition window.', 135, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (541, N'Dock', 136, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (542, N'Top', 136, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (543, N'Anchor', 136, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (544, N'Left', 136, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (545, N'StatusStrip', 137, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (546, N'ToolStrip', 137, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (547, N'MenuStrip', 137, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (548, N'ToolTip', 137, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (549, N'Use sealed keyword.', 138, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (550, N'Use new keyword.', 138, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (551, N'Use virtual keyword.', 138, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (552, N'An overridden base method is the same as a normal method.', 138, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (553, N'Unboxing is conversion from a value type to an object.', 139, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (554, N'Unboxing is conversion from an object to a value type.', 139, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (555, N'Unboxing is conversion from a string to an integer.', 139, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (556, N'Unboxing is conversion from an integer to a string.', 139, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (557, N'Define a destructor.', 140, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (558, N'Define overloaded operators.', 140, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (559, N'Define a constructor without arguments.', 140, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (560, N'Define named properties.', 140, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (561, N'Connection', 141, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (562, N'Command', 141, 1)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (563, N'Import', 141, 0)
INSERT [dbo].[tblAnswer] ([Id], [Cont], [QuestionId], [Correctly]) VALUES (564, N'GetData', 141, 0)
SET IDENTITY_INSERT [dbo].[tblAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestion] ON 

INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Which of the following classes is a heavyweight component?', N'InActived', N'Prj311', CAST(N'2021-01-25T06:04:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Which component cannot be added to a container?', N'Actived', N'Prj311', CAST(N'2021-01-25T06:06:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'What is best to describe the relationship between a container and a SWing GUI object in the container?', N'Actived', N'Prj311', CAST(N'2021-01-25T06:07:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, N'What is best to describe the relationship between a container and a layout manager?', N'Actived', N'Prj311', CAST(N'2021-01-25T06:08:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, N'What is best to describe the relationship between JComponent and JButton?', N'Actived', N'Prj311', CAST(N'2021-01-25T06:09:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, N'What is best to describe the relationship between Component and Color?', N'Actived', N'Prj311', CAST(N'2021-01-25T06:10:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, N'To create a JPanel of the BorderLayout, use____________', N'Actived', N'Prj311', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, N'To add a component c to a JPanel p, use _________.', N'InActived', N'Prj311', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, N'To add a component c to a JPanel p, use _________.', N'Actived', N'Prj311', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, N'To add a component c to a JPanel p, use _________.', N'InActived', N'Prj311', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, N'To add a component c to a JPanel p, use _________.', N'InActived', N'Prj311', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, N'A JSP page will not have access to session implicit variable if.', N'Actived', N'Prj321', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Which statements are BEST describe type attribute of <jsp:useBean type=_.. /> action?', N'Actived', N'Prj321', CAST(N'2021-01-27T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, N' What layout manager should you use so that every component occupies the same size in the container?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, N'What should you use to position a Button within an application Frame so that the size of the Button is NOT affected by the Frame size?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (17, N'Suppose a JFrame uses the GridLayout(0, 2). If you add six buttons to the frame, how many columns are displayed?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (18, N'To set a FlowLayout in panel jp, you can use the method __________.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (19, N'The default layout out of a contentPane in a JFrame is __________.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (20, N'The default layout out of a JPanel is __________.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (21, N'To create a JPanel of the BorderLayout, use ______________.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (22, N'The method __________ gets the text (or caption) of the button jbt.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (23, N'The method __________ creates a IconImage for file c:\image\us.gif.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (24, N'The method __________ specifies that the text and icon are horizontally aligned to the right in the button jbt.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (25, N'_________ checks whether the JCheckBox jchk is selected.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (26, N'Which of the following are valid methods on the label jlbl?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (27, N'The method __________ assigns the name Result to the Text of variable jlbl.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (28, N'___________ can be used to enter or display a string.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (29, N'Clicking a JButton object generates __________ events.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (30, N'The method __________ appends a string s into the text area jta.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (31, N'To wrap a line in a text area jta on words, invoke ____________.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (32, N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (33, N'How many items can be selected from a JComboBox object at a time?', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (34, N'_______________ returns the selected item on a JComboBox jcbo.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (35, N'The method __________ adds an item s into a JComboBox jcbo.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (36, N'____________ is a component that enables the user to choose a single value or multiple values.', N'Actived', N'Prj311', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (37, N'JSP ________ let you insert arbitrary code into the servlet''s _JspService method (which is called by service). Scriptlets.', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (38, N'Consider the HTML code below. Which of the following method calls can retrieve the "email" value sent from the browser? ', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (39, N'Which of the following elements are used for error handling and are child elements of "web-app" of a deployment descriptor?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (40, N'Which is the CORRECT statement about JMS?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (41, N'Identify the parent element of "session-timeout" element in web.xml', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (42, N'EJB 3.0 specifications are first implemented in ______', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (43, N'You want to use a bean that is stored in com/enthu/GUI.ser file. Which of following statements correctly defines the tag that accesses the bean?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (44, N'Which of the following statement correctly store an object associated with a name at a place where all the servlets/jsps of the same webapp participating in a session can access it? Assume that request, response, name, value etc. are references to objects of appropriate types.', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (45, N'Your web application named "FWorks" uses SpecialMath...class. This is an unbundled class and is not contained in any jar file. Where will you keep this class file?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (46, N'Which of these is a correct fragment within the web-app element of deployment descriptor?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (47, N'The form attribute _____specifies the server-side form handler, i.e., the program that handles the request', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (48, N'Which statements are BEST describe prefix attribute of <%@ taglib prefix=...%>directive of JSP file?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (49, N'Which of the following statements is true?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (50, N'What is output to the web page on the second access to the same instance of the following JSP? <html> <body <% int x = 0; %> <%= x++%> </body-> </html>', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (51, N'A JSP page called test.jsp is passed a parameter name in the URL using http://localhost/Final/test.jsp?name=John. The test.jsp contains the following code.  <% String myName=request.getParameter("name");%> <% String test= "Welcome " + myName; %> <%=test%>  What is the output?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (52, N'Your servlet may receive a request, which the servlet cannot handle. In such cases, you want to redirect the request to another resource which may or may not be a part of the same web application. Which of the following options can be used to achieve this objective?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (53, N'Which technique is likely to return an initialization parameter for a JSP page?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (54, N'Which HTTP method is used in FORM based Authentication?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (55, N'What is the implication of using the HTTP GET method for a form submission?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (56, N'Consider the following HTML page code. Which method will be called on UploaderServlet when a user ....', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (57, N'Your web application logs a user in when she supplies username/password. At that time a session is created for the user. Your want to let the user to be logged in only for 20 minutes. The application should red...........', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (58, N'You have declared a useBean tag as:  jsp:useBean id="man" class="animal. Human" scope="application"  in which type of object will this bean be kept?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (59, N'If you want to send an entity object as the pass by value through a remote interface, which of the following statements are valid?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (60, N'______________is the well-known host name that refers to your own computer.', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (61, N'Which is NOT a scope of implicit objects of JSP file?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (62, N'Identify the method used to get an object available ina session', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (63, N'Which is Not a standard technique for a session be definitely invalidate?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (64, N'Which jsp tag can be used to set bean property?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (65, N'Identify the technique that can be used to implement ''session'' if the client browser does not support cookies', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (66, N'Name the default value of the scope attribute of  jsp:useBean', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (67, N'A Java developer needs to be able to send email, containing XML attachments,using SMTP. Which JEE (J2EE) technology provides this capability?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (68, N'Which of the following methods can be used to add cookies to a servlet response?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (69, N'Identify the correct element is required for a valid "taglib" tag in web.xml', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (70, N'Which is NOT a core component of JSP?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (71, N'Which of the following are correct JSP expressions?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (72, N'What would be the best directory in which to store a supporting JAR file for a web application? Note that in the list below, all directories begin from the context root', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (73, N'To send binary output in a response, the following method of HttpServletResponse may be used to get the appropriate Writer/Stream object.', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (74, N'Which of the following is NOT a standard technique for providing a sense of "state" to HTTP?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (75, N'Which of the following statement is true for jsp:useBean ?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (76, N'Your jsp page uses java.util.TreeMap. Adding which of the following statement will ensure that this class is available to the page?', N'Actived', N'Prj321', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Teacher Tester', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (77, N'A ____ is a logically coherent collection of data with some inherent meaning, representing some aspect of real world and being designed, built and populated with data for a specific purpose', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (78, N'Choose the most correct statement.', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (79, N'Which of following is never used as a data model?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (80, N'A ____ is a relation name, together with the attributes of that relation.', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (81, N'A ___ is a notation for describing the structure of the data in a database, along with the constraints on that data', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (82, N'A _____ is a language for defining data structures', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (83, N'Which statement is used to remove a relation named R?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (84, N'What is another term for a row in a relational table?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (85, N'A class in UML is similar to...........', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (86, N'An association class in UML is similar to ______ in the ER model', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (87, N'Which of the following is NOT a standard aggregation operator?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (88, N'How many JOIN conditions are necessary to combine five tables based on common attributes?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (89, N'What operator tests column for the absence of data?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (90, N'What does NULL mean?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (91, N'What is the value of the query: SELECT ''Nancy'' + NULL + ''Smith'' when evaluated on Microsoft SQL Server?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (92, N'Which SQL keyword is used to sort the result-set?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (93, N'Choose the correct statement.', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (94, N'A(an) _____ asserts that a value appearing in one relation must also appear in the primary-key component(s) of another relation', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (95, N'What is difference between PRIMARY KEY and UNIQUE KEY ?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (96, N'A/An _____ is a data structure that makes it efficient to find those tuples that have a fixed value for an attribute', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (97, N'Which of the following statements is the most correct?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (98, N'A ____ table is a table that is embedded within another table', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (99, N'A ____ is a powerful tool for creating and managing large amounts of data efficiently and allowing it to persist over long periods of time, safely', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
GO
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (100, N'In _____ Data Model, the data and relations between them are organized in tables', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (101, N'To update a relation''s schema, which one of the following statements can be used?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (102, N'Schema-altering commands are known as _________ commands.', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (103, N'Which one of the following is NOT a DML command?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (104, N'The binary relationship between classes in UML is called ...', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (105, N'Which one of the following is NOT a DML command?', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (106, N'A weak entity', N'Actived', N'DBI202', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (107, N'Complete this sentence: At the heart of events are.', N'InActived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Teacher Tester')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (108, N'What is WSDL?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (109, N'Which control allows selecting more than one item?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (110, N'Which variables can use only by one user but in all pages?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (111, N'An object that supports the. A Event______. interface stores state information for an asynchronous operation, and provides a synchronization object to allow threads to be signaled when the operation completes.', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (112, N'The ___ method of the ____ object is used to retrieve the data in the form fields submitted by the user.', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (113, N'In Windows Form.______is a Command type control.', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (114, N'What are properties of [WebMethod] attribute?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (115, N'Which control combines the features of the TextBox and the ListBox controls?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (116, N'Which property of Form allows to set the button on the Form that is clicked when user press the Enter key?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (117, N'What is UDDI?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (118, N'Which variables can be used by all users and in all pages?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (119, N'A class can have_______', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (120, N'Windows Forms application, which property is used to get or set the edges of the control is anchored to the edges of its container? *', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy')
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (121, N'The DataTable structure is defined by its _ and', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (122, N'An interface CANNOT contain signatures of the following members:', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (123, N'Which object provides access to the provider''s data reader object?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (124, N'Which property of TextBox control to set whether the TextBox control modifies the case of characters as they are typed?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (125, N'In ASP.NET application._______and _________variables can be accessed by all the pages in the application.', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (126, N'Methods, fields, constructors. _ are called:', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (127, N'How to change the transparent level of a Windows Form?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (128, N'Which sentence about Application variables is correct?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (129, N'What is the lifespan for items stored in ViewState?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (130, N'Which event handler is fired when a new user logs on to your application?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (131, N'Which element that may be contained within a MenujStrip?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (132, N'Which object represents the actual data of a DataTable?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (133, N'Which validation control is used to validate that the value of an input control is equal to a fixed constant?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (134, N'What can be parameter modifiers of a given method?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (135, N'Where do we can change default namespace of a project?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (136, N'Which property of Control type is used to set a widget should be attached to which side (or sides) of a Form?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (137, N'The control is used to display text when the mouse points to a particular control', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (138, N'How can we define an overridden base method?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (139, N'What is unboxing?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (140, N'How do we implement encapsulation by C#?', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
INSERT [dbo].[tblQuestion] ([Id], [Cont], [Status], [Subject], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (141, N'The ... object allows us to retrieve & manipulate data In the database.', N'Actived', N'Prn292', CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Monkey.D.Luffy', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestionTesting] ON 

INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (443, 61, N'Which is NOT a scope of implicit objects of JSP file?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (444, 71, N'Which of the following are correct JSP expressions?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (445, 54, N'Which HTTP method is used in FORM based Authentication?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (446, 41, N'Identify the parent element of "session-timeout" element in web.xml', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (447, 57, N'Your web application logs a user in when she supplies username/password. At that time a session is created for the user. Your want to let the user to be logged in only for 20 minutes. The application should red...........', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (448, 60, N'______________is the well-known host name that refers to your own computer.', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (449, 72, N'What would be the best directory in which to store a supporting JAR file for a web application? Note that in the list below, all directories begin from the context root', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (450, 68, N'Which of the following methods can be used to add cookies to a servlet response?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (451, 64, N'Which jsp tag can be used to set bean property?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (452, 43, N'You want to use a bean that is stored in com/enthu/GUI.ser file. Which of following statements correctly defines the tag that accesses the bean?', N'Actived', N'Prj321', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-02T23:05:42.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (453, 129, N'What is the lifespan for items stored in ViewState?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (454, 118, N'Which variables can be used by all users and in all pages?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (455, 134, N'What can be parameter modifiers of a given method?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (456, 133, N'Which validation control is used to validate that the value of an input control is equal to a fixed constant?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (457, 117, N'What is UDDI?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (458, 135, N'Where do we can change default namespace of a project?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (459, 130, N'Which event handler is fired when a new user logs on to your application?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (460, 140, N'How do we implement encapsulation by C#?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (461, 111, N'An object that supports the. A Event______. interface stores state information for an asynchronous operation, and provides a synchronization object to allow threads to be signaled when the operation completes.', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (462, 126, N'Methods, fields, constructors. _ are called:', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:43:34.300' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (463, 15, N'What should you use to position a Button within an application Frame so that the size of the Button is NOT affected by the Frame size?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (464, 28, N'___________ can be used to enter or display a string.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (465, 33, N'How many items can be selected from a JComboBox object at a time?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (466, 30, N'The method __________ appends a string s into the text area jta.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (467, 27, N'The method __________ assigns the name Result to the Text of variable jlbl.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (468, 23, N'The method __________ creates a IconImage for file c:\image\us.gif.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (469, 32, N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (470, 21, N'To create a JPanel of the BorderLayout, use ______________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (471, 16, N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (472, 36, N'____________ is a component that enables the user to choose a single value or multiple values.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:46:24.720' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (473, 122, N'An interface CANNOT contain signatures of the following members:', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (474, 117, N'What is UDDI?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (475, 138, N'How can we define an overridden base method?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (476, 113, N'In Windows Form.______is a Command type control.', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (477, 109, N'Which control allows selecting more than one item?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (478, 116, N'Which property of Form allows to set the button on the Form that is clicked when user press the Enter key?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (479, 110, N'Which variables can use only by one user but in all pages?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (480, 141, N'The ... object allows us to retrieve & manipulate data In the database.', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (481, 139, N'What is unboxing?', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (482, 111, N'An object that supports the. A Event______. interface stores state information for an asynchronous operation, and provides a synchronization object to allow threads to be signaled when the operation completes.', N'Actived', N'Prn292', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:47:49.233' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (483, 78, N'Choose the most correct statement.', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (484, 91, N'What is the value of the query: SELECT ''Nancy'' + NULL + ''Smith'' when evaluated on Microsoft SQL Server?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (485, 97, N'Which of the following statements is the most correct?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (486, 81, N'A ___ is a notation for describing the structure of the data in a database, along with the constraints on that data', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (487, 104, N'The binary relationship between classes in UML is called ...', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (488, 98, N'A ____ table is a table that is embedded within another table', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (489, 105, N'Which one of the following is NOT a DML command?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (490, 88, N'How many JOIN conditions are necessary to combine five tables based on common attributes?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (491, 83, N'Which statement is used to remove a relation named R?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (492, 87, N'Which of the following is NOT a standard aggregation operator?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T09:49:24.923' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (493, 5, N'What is best to describe the relationship between JComponent and JButton?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (494, 20, N'The default layout out of a JPanel is __________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (495, 26, N'Which of the following are valid methods on the label jlbl?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (496, 35, N'The method __________ adds an item s into a JComboBox jcbo.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (497, 6, N'What is best to describe the relationship between Component and Color?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (498, 29, N'Clicking a JButton object generates __________ events.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (499, 19, N'The default layout out of a contentPane in a JFrame is __________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (500, 24, N'The method __________ specifies that the text and icon are horizontally aligned to the right in the button jbt.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (501, 7, N'To create a JPanel of the BorderLayout, use____________', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (502, 33, N'How many items can be selected from a JComboBox object at a time?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:49:13.927' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (503, 7, N'To create a JPanel of the BorderLayout, use____________', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (504, 32, N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (505, 2, N'Which component cannot be added to a container?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (506, 15, N'What should you use to position a Button within an application Frame so that the size of the Button is NOT affected by the Frame size?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (507, 28, N'___________ can be used to enter or display a string.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (508, 36, N'____________ is a component that enables the user to choose a single value or multiple values.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (509, 5, N'What is best to describe the relationship between JComponent and JButton?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (510, 27, N'The method __________ assigns the name Result to the Text of variable jlbl.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (511, 16, N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (512, 31, N'To wrap a line in a text area jta on words, invoke ____________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:50:40.117' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (513, 14, N' What layout manager should you use so that every component occupies the same size in the container?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (514, 23, N'The method __________ creates a IconImage for file c:\image\us.gif.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (515, 21, N'To create a JPanel of the BorderLayout, use ______________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (516, 36, N'____________ is a component that enables the user to choose a single value or multiple values.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (517, 26, N'Which of the following are valid methods on the label jlbl?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (518, 35, N'The method __________ adds an item s into a JComboBox jcbo.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (519, 18, N'To set a FlowLayout in panel jp, you can use the method __________.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (520, 27, N'The method __________ assigns the name Result to the Text of variable jlbl.', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (521, 6, N'What is best to describe the relationship between Component and Color?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (522, 4, N'What is best to describe the relationship between a container and a layout manager?', N'Actived', N'Prj311', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T10:51:12.457' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (523, 87, N'Which of the following is NOT a standard aggregation operator?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (524, 82, N'A _____ is a language for defining data structures', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (525, 99, N'A ____ is a powerful tool for creating and managing large amounts of data efficiently and allowing it to persist over long periods of time, safely', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (526, 84, N'What is another term for a row in a relational table?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (527, 77, N'A ____ is a logically coherent collection of data with some inherent meaning, representing some aspect of real world and being designed, built and populated with data for a specific purpose', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (528, 86, N'An association class in UML is similar to ______ in the ER model', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (529, 106, N'A weak entity', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (530, 104, N'The binary relationship between classes in UML is called ...', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (531, 88, N'How many JOIN conditions are necessary to combine five tables based on common attributes?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
INSERT [dbo].[tblQuestionTesting] ([Id], [QuestionId], [Cont], [Status], [Subject], [Email], [StartTime]) VALUES (532, 91, N'What is the value of the query: SELECT ''Nancy'' + NULL + ''Smith'' when evaluated on Microsoft SQL Server?', N'Actived', N'DBI202', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-02-03T11:10:15.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblQuestionTesting] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuizHistory] ON 

INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (255, 64, 253, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (256, 68, 270, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (257, 54, 216, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (258, 71, 284, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (259, 72, 285, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (260, 41, 163, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (261, 57, 225, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (262, 43, 172, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (263, 60, 237, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (264, 61, 242, 18)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (265, 129, 513, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (266, 130, 520, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (267, 133, 530, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (268, 117, 467, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (269, 118, 470, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (270, 134, 534, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (271, 135, 538, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (272, 126, 504, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (273, 111, 442, 19)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (274, 32, 127, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (275, 16, 64, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (276, 33, 130, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (277, 36, 142, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (278, 21, 81, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (279, 23, 91, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (280, 27, 105, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (281, 28, 111, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (282, 30, 119, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (283, 15, 58, 20)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (284, 113, 452, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (285, 116, 463, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (286, 117, 467, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (287, 122, 487, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (288, 138, 551, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (289, 139, 553, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (290, 109, 433, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (291, 141, 562, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (292, 110, 437, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (293, 111, 444, 21)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (294, 97, 388, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (295, 81, 322, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (296, 98, 392, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (297, 83, 331, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (298, 87, 346, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (299, 104, 416, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (300, 88, 352, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (301, 105, 418, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (302, 91, 364, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (303, 78, 310, 22)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (304, 82, 325, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (305, 99, 393, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (306, 84, 335, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (307, 86, 343, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (308, 87, 346, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (309, 104, 415, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (310, 88, 352, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (311, 106, 421, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (312, 91, 364, 23)
INSERT [dbo].[tblQuizHistory] ([Id], [QuestionId], [AnswerId], [SubmitId]) VALUES (313, 77, 305, 23)
SET IDENTITY_INSERT [dbo].[tblQuizHistory] OFF
GO
INSERT [dbo].[tblStatus] ([Name]) VALUES (N'Actived')
INSERT [dbo].[tblStatus] ([Name]) VALUES (N'InActived')
GO
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'DBI202', N'Database System', 50)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Prj311', N' Java Desktop', 80)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Prj321', N'Java Web', 60)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Prn292', N'C Sharp(C#)', 50)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Pro192', N'OOP using Java', 50)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Swr302', N'Software Requirement', 60)
INSERT [dbo].[tblSubject] ([Id], [Name], [TestTime]) VALUES (N'Swt301', N'Software Testing', 60)
GO
SET IDENTITY_INSERT [dbo].[tblSubmit] ON 

INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (18, N'danhnlcse140655@fpt.edu.vn', N'Prj321', 6, 6, 10, CAST(N'2021-02-02T23:05:42.457' AS DateTime), CAST(N'2021-02-03T00:05:42.457' AS DateTime))
INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (19, N'danhnlcse140655@fpt.edu.vn', N'Prn292', 7.78000020980835, 7, 9, CAST(N'2021-02-03T09:43:34.300' AS DateTime), CAST(N'2021-02-03T10:33:34.300' AS DateTime))
INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (20, N'danhnlcse140655@fpt.edu.vn', N'Prj311', 5, 5, 10, CAST(N'2021-02-03T09:46:24.720' AS DateTime), CAST(N'2021-02-03T11:06:24.720' AS DateTime))
INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (21, N'danhnlcse140655@fpt.edu.vn', N'Prn292', 7, 7, 10, CAST(N'2021-02-03T09:47:49.233' AS DateTime), CAST(N'2021-02-03T10:37:49.233' AS DateTime))
INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (22, N'danhnlcse140655@fpt.edu.vn', N'DBI202', 8, 8, 10, CAST(N'2021-02-03T09:49:24.923' AS DateTime), CAST(N'2021-02-03T10:39:24.923' AS DateTime))
INSERT [dbo].[tblSubmit] ([Id], [Email], [SubjectId], [Point], [NumberOfTrue], [QuantityOfQuestion], [StartTime], [EndTime]) VALUES (23, N'danhnlcse140655@fpt.edu.vn', N'DBI202', 8, 8, 10, CAST(N'2021-02-03T11:10:15.223' AS DateTime), CAST(N'2021-02-03T12:00:15.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblSubmit] OFF
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblAnswer_tblQuestion] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[tblQuestion] ([Id])
GO
ALTER TABLE [dbo].[tblAnswer] CHECK CONSTRAINT [FK_tblAnswer_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([Name])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblStatus]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([Subject])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
ALTER TABLE [dbo].[tblQuestionTesting]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestionTesting_tblAccount] FOREIGN KEY([Email])
REFERENCES [dbo].[tblAccount] ([Email])
GO
ALTER TABLE [dbo].[tblQuestionTesting] CHECK CONSTRAINT [FK_tblQuestionTesting_tblAccount]
GO
ALTER TABLE [dbo].[tblQuestionTesting]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestionTesting_tblQuestion] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[tblQuestion] ([Id])
GO
ALTER TABLE [dbo].[tblQuestionTesting] CHECK CONSTRAINT [FK_tblQuestionTesting_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuestionTesting]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestionTesting_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([Name])
GO
ALTER TABLE [dbo].[tblQuestionTesting] CHECK CONSTRAINT [FK_tblQuestionTesting_tblStatus]
GO
ALTER TABLE [dbo].[tblQuestionTesting]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestionTesting_tblSubject] FOREIGN KEY([Subject])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[tblQuestionTesting] CHECK CONSTRAINT [FK_tblQuestionTesting_tblSubject]
GO
ALTER TABLE [dbo].[tblQuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizHistory_tblAnswer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[tblAnswer] ([Id])
GO
ALTER TABLE [dbo].[tblQuizHistory] CHECK CONSTRAINT [FK_tblQuizHistory_tblAnswer]
GO
ALTER TABLE [dbo].[tblQuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizHistory_tblQuestion] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[tblQuestion] ([Id])
GO
ALTER TABLE [dbo].[tblQuizHistory] CHECK CONSTRAINT [FK_tblQuizHistory_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizHistory_tblSubmit] FOREIGN KEY([SubmitId])
REFERENCES [dbo].[tblSubmit] ([Id])
GO
ALTER TABLE [dbo].[tblQuizHistory] CHECK CONSTRAINT [FK_tblQuizHistory_tblSubmit]
GO
ALTER TABLE [dbo].[tblSubmit]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmit_tblAccount] FOREIGN KEY([Email])
REFERENCES [dbo].[tblAccount] ([Email])
GO
ALTER TABLE [dbo].[tblSubmit] CHECK CONSTRAINT [FK_tblSubmit_tblAccount]
GO
ALTER TABLE [dbo].[tblSubmit]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmit_tblSubject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[tblSubject] ([Id])
GO
ALTER TABLE [dbo].[tblSubmit] CHECK CONSTRAINT [FK_tblSubmit_tblSubject]
GO
USE [master]
GO
ALTER DATABASE [Assignment2_NguyenLamCongDanh] SET  READ_WRITE 
GO
