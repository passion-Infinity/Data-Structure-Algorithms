USE [master]
GO
/****** Object:  Database [Cart_JSTL]    Script Date: 10/9/2020 2:51:24 PM ******/
CREATE DATABASE [Cart_JSTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cart_JSTL', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cart_JSTL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cart_JSTL_log', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cart_JSTL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cart_JSTL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cart_JSTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cart_JSTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cart_JSTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cart_JSTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cart_JSTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cart_JSTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cart_JSTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cart_JSTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cart_JSTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cart_JSTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cart_JSTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cart_JSTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cart_JSTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cart_JSTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cart_JSTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cart_JSTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cart_JSTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cart_JSTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cart_JSTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cart_JSTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cart_JSTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cart_JSTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cart_JSTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cart_JSTL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cart_JSTL] SET  MULTI_USER 
GO
ALTER DATABASE [Cart_JSTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cart_JSTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cart_JSTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cart_JSTL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cart_JSTL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cart_JSTL] SET QUERY_STORE = OFF
GO
USE [Cart_JSTL]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 10/9/2020 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](30) NOT NULL,
	[productName] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/9/2020 2:51:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[username] [varchar](30) NOT NULL,
	[fullname] [varchar](30) NULL,
	[password] [varchar](20) NULL,
	[role] [varchar](10) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'IP145', N'Iphone XII', 7000, 15)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'IP99', N'Iphone X', 5000, 12)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'OP145', N'Oppo F7', 1300, 3)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'OP9985', N'Oppo F9', 5000, 9)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'SS102', N'Samsung A7', 2000, 8)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'V106', N'Vivo i10', 800, 5)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'V142', N'VivoY11', 3000, 5)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'VIN145', N'Vinfast X', 2000, 5)
INSERT [dbo].[tblProducts] ([productID], [productName], [price], [quantity]) VALUES (N'XI778', N'Xiaomi', 1400, 10)
GO
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'abc', N'abc', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'abcd', N'abcd', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'abcde', N'abcde', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'admin', N'Nguyen Danh', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'conan', N'Edogawa Conan', N'1', N'user')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'congdanh', N'Nguyen Lam Cong Danh', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'danhnlc', N'NLC Danh', N'1', N'admin')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'mes', N'Lionel Messi', N'1', N'user')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'shin', N'Kudo Shinichi', N'1', N'user')
INSERT [dbo].[tblUsers] ([username], [fullname], [password], [role]) VALUES (N'stubasa', N'Ozora Stubasa', N'1', N'user')
GO
USE [master]
GO
ALTER DATABASE [Cart_JSTL] SET  READ_WRITE 
GO
