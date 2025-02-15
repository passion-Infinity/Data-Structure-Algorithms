USE [master]
GO
/****** Object:  Database [Assignment1_NguyenLamCongDanh]    Script Date: 3/16/2021 9:55:15 AM ******/
CREATE DATABASE [Assignment1_NguyenLamCongDanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_NguyenLamCongDanh', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_NguyenLamCongDanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_NguyenLamCongDanh_log', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_NguyenLamCongDanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_NguyenLamCongDanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET QUERY_STORE = OFF
GO
USE [Assignment1_NguyenLamCongDanh]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/16/2021 9:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[createdDate] [date] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/16/2021 9:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[orderID] [varchar](50) NULL,
	[productCode] [varchar](15) NULL,
	[productName] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/16/2021 9:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productCode] [varchar](15) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[description] [nvarchar](200) NULL,
	[image] [varchar](500) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[status] [bit] NULL,
	[createdDate] [date] NULL,
	[createdBy] [nvarchar](50) NULL,
	[modifiedDate] [date] NULL,
	[modifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/16/2021 9:55:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [varchar](30) NULL,
	[role] [varchar](15) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1611070520585', N'test', CAST(N'2021-01-19' AS Date), 2950)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1611071835838', N'test', CAST(N'2021-01-19' AS Date), 3262.5)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1614818685373', N'hienlu2010vn@gmail.com', CAST(N'2021-03-04' AS Date), 1900)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1615859892155', N'test', CAST(N'2021-03-16' AS Date), 2978)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1615859926172', N'test', CAST(N'2021-03-16' AS Date), 0.64999997615814209)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1615860486097', N'test', CAST(N'2021-03-16' AS Date), 366)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1615860503471', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-16' AS Date), 244)
INSERT [dbo].[tblOrder] ([orderID], [userID], [createdDate], [total]) VALUES (N'1615860743635', N'test', CAST(N'2021-03-16' AS Date), 585.6500244140625)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (16, N'1611070520585', N'A003', N'Banh kem', 2, 500)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (17, N'1611070520585', N'A001', N'Dua leo', 3, 150)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (18, N'1611070520585', N'A002', N'Cam', 5, 300)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (19, N'1611071835838', N'C001', N'Bo sot hem', 1, 1256)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (20, N'1611071835838', N'B006', N'Tra sua', 1, 900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (21, N'1611071835838', N'C006', N'pizza', 1, 956.5)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (22, N'1611071835838', N'A001', N'Dua leo', 1, 150)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (23, N'1614818685373', N'A003', N'Banh kem', 3, 500)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (24, N'1614818685373', N'A004', N'Keo', 1, 100)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (25, N'1614818685373', N'A002', N'Cam', 1, 300)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10023, N'1615859892155', N'A555', N'Mi co', 2, 1245)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10024, N'1615859892155', N'A001', N'Dua leo test   123', 4, 122)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10025, N'1615859926172', N'A002', N'Ca kho to 123', 1, 0.64999997615814209)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10026, N'1615860486097', N'A001', N'Dua leo test   123', 3, 122)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10027, N'1615860503471', N'A001', N'Dua leo test   123', 2, 122)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10028, N'1615860743635', N'A002', N'Ca kho to 123', 1, 0.64999997615814209)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productCode], [productName], [quantity], [price]) VALUES (10029, N'1615860743635', N'D125', N'Bia ', 9, 65)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A001', N'Dua leo test   123', N'gagagaga', N'upload\background-buc-tuong-den_034511144.png', 15, 122, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A002', N'Ca kho to 123', N'ngon lam', N'upload\hinh-nen-full-hd-1080-sieu-xe-cuc-dep_022859510.jpg', 5, 0.64999997615814209, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A003', N'Banh kem', N'dep mat, ngon', N'upload\hinh-nen-full-hd-1080-chu-ca-3d-cuc-dep_022855875.jpg', 4, 123, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A004', N'Keo test 999', N'ngon 999', N'upload\phongcanh.png', 100, 333, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A555', N'Mi co', N'fdsfa', N'upload\', 3, 1245, 1, CAST(N'2021-01-26' AS Date), N'admin', CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A666', N'ko ko ', N'hihi test', N'upload\', 1, 123, 1, CAST(N'2021-01-26' AS Date), N'admin', CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'A789', N'ko ko oo', N'kkkkk', N'upload\hinh-nen-full-hd-1080-tinh-yeu-dep_022900071.jpg', 10, 1, 1, CAST(N'2021-01-26' AS Date), N'admin', CAST(N'2021-03-16' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'B001', N'Coffe', N'dang, ngon', N'upload\abt-4.jpg', 60, 800, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'B006', N'Tra sua', N'ngon', N'upload\p3-min.jpg', 29, 900, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'C001', N'Bo sot hem', N'ngon tuyet', N'upload\p18-min.jpg', 19, 1256, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'C006', N'pizza', N're, ngon', N'upload\p11-min.jpg', 29, 956.5, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D100', N'Che', N'ngot ngao', N'upload\p28-min.jpg', 22, 250, 1, CAST(N'2020-01-19' AS Date), NULL, CAST(N'2021-01-19' AS Date), N'admin')
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D125', N'Bia ', N'ngon', NULL, 0, 65, 1, CAST(N'2020-01-19' AS Date), NULL, NULL, NULL)
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D666', N'ko ko ', N'fsdf', N'upload\', 1, 1, 1, CAST(N'2021-01-26' AS Date), N'admin', NULL, NULL)
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D667', N'ko ko', N'kkfdasf', N'upload\', 1, 1, 1, CAST(N'2021-01-26' AS Date), N'admin', NULL, NULL)
INSERT [dbo].[tblProduct] ([productCode], [productName], [description], [image], [quantity], [price], [status], [createdDate], [createdBy], [modifiedDate], [modifiedBy]) VALUES (N'D668', N'ko ko', N'kkfdasf', N'upload\', 1, 1, 1, CAST(N'2021-01-26' AS Date), N'admin', NULL, NULL)
GO
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'admin', N'Manager', N'123456', N'admin')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'danhnlcse140655@fpt.edu.vn', N'danhnlcse140655@fpt.edu.vn', N'104107202551633131784', N'member')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'hienlu2010vn@gmail.com', N'hienlu2010vn@gmail.com', N'106815600760978946181', N'member')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'nguyenlamcongdanh02052000@gmail.com', N'nguyenlamcongdanh02052000@gmail.com', N'112902216968954474114', N'member')
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [role]) VALUES (N'test', N'Tester', N'123456', N'member')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productCode])
REFERENCES [dbo].[tblProduct] ([productCode])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [Assignment1_NguyenLamCongDanh] SET  READ_WRITE 
GO
