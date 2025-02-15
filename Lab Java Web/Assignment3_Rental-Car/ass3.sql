USE [master]
GO
/****** Object:  Database [Assignment3_NguyenLamCongDanh]    Script Date: 3/7/2021 10:14:02 PM ******/
CREATE DATABASE [Assignment3_NguyenLamCongDanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dd_Car_rental', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dd_Car_rental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dd_Car_rental_log', FILENAME = N'D:\App\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dd_Car_rental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment3_NguyenLamCongDanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET QUERY_STORE = OFF
GO
USE [Assignment3_NguyenLamCongDanh]
GO
/****** Object:  UserDefinedFunction [dbo].[FU_RentedCar]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[FU_RentedCar](
 @carID int,
 @pickupDate date,
 @dropoutDate date
)
Returns int 
As 
Begin
	DECLARE @result int;

	with tbl as (
		select b.Id, b.carID, b.pickupDate, b.dropoutDate, b.quantity
		from tblOrders a, tblOrderDetails b
		where ((a.Id = b.OrderID) and (a.status = 'active'))
		and ((b.pickupDate between @pickupDate and @dropoutDate) or (b.dropoutDate between @pickupDate and @dropoutDate)) 
		and (b.carID = @carID)
	), tbl1 as (
		select a.Id, b.quantity from tbl a
		inner join tbl b
		on (a.dropoutDate <= b.dropoutDate) and (b.pickupDate <= a.dropoutDate) 
	), tbl2 as (
		select Id, sum(quantity) as s
		from tbl1
		group by Id
	)
	select @result = max(s) from tbl2 
	if @result is null set @result = 0
	Return @result
End
GO
/****** Object:  Table [dbo].[tblCar_Type]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCar_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Car_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCars]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[TypeId] [int] NULL,
	[Image] [text] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Seat] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_tblCars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[Email] [varchar](100) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](200) NULL,
	[Status] [varchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Code] [varchar](10) NULL,
	[Role] [varchar](20) NULL,
 CONSTRAINT [PK_tblCustomers] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscount]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscount](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[StartDay] [datetime] NULL,
	[EndDay] [datetime] NULL,
	[Value] [varchar](20) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscountDetail]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscountDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [varchar](10) NULL,
	[CarId] [int] NULL,
 CONSTRAINT [PK_tblDiscountDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBacks]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedBacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[CarId] [int] NULL,
	[Cont] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblFeedBacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](30) NULL,
	[CarId] [int] NULL,
	[Price] [float] NULL,
	[PickupDate] [datetime] NULL,
	[DropoutDate] [datetime] NULL,
	[quantity] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 3/7/2021 10:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[Id] [varchar](30) NOT NULL,
	[Email] [varchar](100) NULL,
	[Date] [datetime] NULL,
	[Total] [float] NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCar_Type] ON 

INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (1, N'Toyota', N'Ô tô Nhật Bản')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (2, N'Mazda', N'Ô tô Nhật Bản')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (3, N'Kia', N'Ô tô Hàn Quốc')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (4, N'Huynhdai', N'Ô tô Hàn Quốc')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (5, N'BMW', N'Ô tô Đức')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (6, N'Audi', N'Ô tô Đức')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (7, N'Mercedes ', N'Ô tô Đức')
INSERT [dbo].[tblCar_Type] ([Id], [Name], [Description]) VALUES (8, N'Vinfast', N'Ô tô Việt Nam')
SET IDENTITY_INSERT [dbo].[tblCar_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCars] ON 

INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (1, N'Toyota-Vios', 1, N'/template/images/Toyota-Vios.jpg', 0, 1000, 4, N'Vàng cát', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (2, N'Toyota-Camry', 1, N'/template/images/toyota-camry.jpg', 3, 5000, 4, N'Đen', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (3, N'Toyota-Corolla Atis', 1, N'/template/images/toyota-corolla-atis.jpg', 3, 3000, 4, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (4, N'Toyota-Cross', 1, N'/template/images/Toyota-Cross.jpg', 5, 4000, 5, N'Đỏ', N'actvied')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (5, N'Toyota-Rush', 1, N'/template/images/Toyota-Rush.jpg', 5, 1500, 5, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (6, N'Toyota-Yaris', 1, N'/template/images/toyota-yaris.jpg', 2, 1500, 4, N'Đỏ', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (7, N'Toyota-Fortuner', 1, N'/template/images/toyota-fortuner.jpg', 6, 3500, 7, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (8, N'Toyota-Innova', 1, N'/template/images/Toyota-Innova.jpg', 4, 2500, 7, N'Đen', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (9, N'Mercedes-C300', 7, N'/template/images/Mercedes-C300.jpg', 5, 5000, 4, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (10, N'Mercedes-C200', 7, N'/template/images/Mercedes-C200.jpg', 3, 4500, 4, N'Đen', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (11, N'Mercedes-GLC250', 7, N'/template/images/Mercedes-GLC250.jpg', 4, 5500, 7, N'Đen', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (13, N'Audi-A8', 6, N'/template/images/Audi-A8.jpg', 8, 6000, 4, N'Xanh dương', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (14, N'Audi-Q7', 6, N'/template/images/Audi-Q7.jpg', 7, 5700, 5, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (15, N'Audi-R8', 6, N'/template/images/Audi-R8.jpg', 2, 9000, 4, N'Đen', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (16, N'Vinfast  SA2.0', 8, N'/template/images/Vin-SA2.0.jpg', 8, 6200, 7, N'Đỏ', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (17, N'Vinfast  A2.0', 8, N'/template/images/Vin-A2.0.jpg', 4, 6500, 4, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (18, N'Kia Seltos', 3, N'/template/images/Kia-Seltos.jpg', 10, 2000, 5, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (19, N'Kia Cerato', 3, N'/template/images/Kia-Cerato.jpg', 12, 1800, 4, N'Trắng ', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (20, N'Kia Sorento', 3, N'/template/images/Kia-Sorento.jpg', 3, 2000, 4, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (21, N'Mazda 5', 2, N'/template/images/Mazda-5.jpg', 8, 2200, 4, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (22, N'Mazda 3', 2, N'/template/images/Mazda-3.jpg', 4, 2500, 5, N'Trắng', N'actived')
INSERT [dbo].[tblCars] ([Id], [Name], [TypeId], [Image], [Quantity], [Price], [Seat], [Color], [Status]) VALUES (23, N'Mazda 6', 2, N'/template/images/Mazda-6.jpg', 3, 3000, 7, N'Đỏ', N'actived')
SET IDENTITY_INSERT [dbo].[tblCars] OFF
GO
INSERT [dbo].[tblCustomers] ([Email], [Fullname], [Password], [Phone], [Address], [Status], [CreatedDate], [Code], [Role]) VALUES (N'danhnlcse140655@fpt.edu.vn', N'Nguyen Lam Cong Danh', N'123456', N'03136963789', N'Binh Duong', N'Active', CAST(N'2021-02-26T00:00:00.000' AS DateTime), N'973712', N'customer')
INSERT [dbo].[tblCustomers] ([Email], [Fullname], [Password], [Phone], [Address], [Status], [CreatedDate], [Code], [Role]) VALUES (N'nguyenlamcongdanh02052000@gmail.com', N'NlcDanh', N'123', N'03136963789', N'Binh Duong', N'Active', CAST(N'2021-03-06T00:00:00.000' AS DateTime), N'273288', N'admin')
GO
INSERT [dbo].[tblDiscount] ([Id], [Name], [StartDay], [EndDay], [Value], [Status]) VALUES (N'123456', N'discount 8-3', CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'30', 1)
INSERT [dbo].[tblDiscount] ([Id], [Name], [StartDay], [EndDay], [Value], [Status]) VALUES (N'145696', N'discount day', CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'50', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDiscountDetail] ON 

INSERT [dbo].[tblDiscountDetail] ([Id], [DiscountId], [CarId]) VALUES (1, N'123456', 2)
INSERT [dbo].[tblDiscountDetail] ([Id], [DiscountId], [CarId]) VALUES (2, N'123456', 4)
INSERT [dbo].[tblDiscountDetail] ([Id], [DiscountId], [CarId]) VALUES (3, N'123456', 15)
INSERT [dbo].[tblDiscountDetail] ([Id], [DiscountId], [CarId]) VALUES (4, N'145696', 9)
INSERT [dbo].[tblDiscountDetail] ([Id], [DiscountId], [CarId]) VALUES (5, N'145696', 11)
SET IDENTITY_INSERT [dbo].[tblDiscountDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeedBacks] ON 

INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (1, N'danhnlcse140655@fpt.edu.vn', 9, N'Amazing good job', CAST(N'2021-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (2, N'danhnlcse140655@fpt.edu.vn', 9, N'Amazing good job', CAST(N'2021-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (3, N'danhnlcse140655@fpt.edu.vn', 9, N'Xe rat tot ', CAST(N'2021-03-07T21:12:55.457' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (4, N'danhnlcse140655@fpt.edu.vn', 9, N'Ch?y r?t nhanh', CAST(N'2021-03-07T21:13:33.173' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (5, N'danhnlcse140655@fpt.edu.vn', 9, N'Chạy rất nhanh', CAST(N'2021-03-07T21:14:48.383' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (6, N'danhnlcse140655@fpt.edu.vn', 9, N'Tuyệt vời', CAST(N'2021-03-07T21:15:47.317' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (7, N'danhnlcse140655@fpt.edu.vn', 9, N'khỏi phải nói', CAST(N'2021-03-07T21:28:58.757' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (8, N'danhnlcse140655@fpt.edu.vn', 23, N'Xe rat tot ', CAST(N'2021-03-07T21:29:09.510' AS DateTime))
INSERT [dbo].[tblFeedBacks] ([Id], [Email], [CarId], [Cont], [CreatedDate]) VALUES (9, N'danhnlcse140655@fpt.edu.vn', 11, N'Chạy rất nhanh', CAST(N'2021-03-07T21:40:23.773' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblFeedBacks] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (12, N'1615016132640', 9, 5000, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-06T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (13, N'1615016132640', 10, 4500, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-06T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (14, N'1615016132640', 11, 5500, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-06T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (15, N'1615016638550', 16, 6200, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (16, N'1615016638550', 17, 6500, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (17, N'1615017977204', 9, 5000, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (18, N'1615043999342', 2, 5000, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (19, N'1615043999342', 2, 5000, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (20, N'1615047210662', 3, 3000, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (21, N'1615047210662', 3, 3000, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (22, N'1615050561391', 6, 1500, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (23, N'1615051217014', 9, 5000, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (24, N'1615051345348', 17, 6500, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (25, N'1615051473453', 15, 9000, CAST(N'2021-03-08T00:00:00.000' AS DateTime), CAST(N'2021-03-09T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (26, N'1615052274379', 17, 6500, CAST(N'2021-03-08T00:00:00.000' AS DateTime), CAST(N'2021-03-09T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (27, N'1615052637026', 23, 3000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-10T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (28, N'1615052653744', 23, 3000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-11T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (29, N'1615078858970', 2, 5000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-10T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (30, N'1615078858970', 3, 3000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-10T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (31, N'1615079013501', 17, 6500, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-11T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (32, N'1615080021135', 20, 2000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-11T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (33, N'1615080044878', 20, 2000, CAST(N'2021-03-09T00:00:00.000' AS DateTime), CAST(N'2021-03-12T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (34, N'1615089822773', 2, 5000, CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), 2, 0)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (35, N'1615089822773', 2, 5000, CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-19T00:00:00.000' AS DateTime), 1, 30)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (36, N'1615097466785', 2, 5000, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (37, N'1615097719736', 22, 2500, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (38, N'1615099837679', 18, 2000, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (39, N'1615115185836', 16, 6200, CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tblOrderDetails] ([Id], [OrderId], [CarId], [Price], [PickupDate], [DropoutDate], [quantity], [discount]) VALUES (40, N'1615115185836', 17, 6500, CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-18T00:00:00.000' AS DateTime), 2, 0)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615016132640', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-06T00:00:00.000' AS DateTime), 30500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615016638550', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-06T00:00:00.000' AS DateTime), 18900, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615017977204', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-06T00:00:00.000' AS DateTime), 15000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615043999342', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-06T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615047210662', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-06T00:00:00.000' AS DateTime), 15000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615050257557', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615050356954', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615050494931', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615050535366', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615050561391', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051217014', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 20000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051230666', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051232712', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051235222', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051251945', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051252703', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051254808', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051345348', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 32500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051406746', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 13000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615051473453', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 36000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615052274379', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 32500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615052313043', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 13000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615052637026', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 12000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615052642095', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615052653744', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 3000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615078858970', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 28000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615078876417', N'nguyenlamcongdanh02052000@gmail.com', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 19000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615078994727', N'nguyenlamcongdanh02052000@gmail.com', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 5000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615079013501', N'nguyenlamcongdanh02052000@gmail.com', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 11500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615079048547', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615080021135', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 10000, N'inactive')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615080029272', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615080044878', N'nguyenlamcongdanh02052000@gmail.com', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 6000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615080050483', N'nguyenlamcongdanh02052000@gmail.com', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615089822773', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 13500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615097466785', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 5000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615097719736', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 2500, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615099837679', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 2000, N'active')
INSERT [dbo].[tblOrders] ([Id], [Email], [Date], [Total], [Status]) VALUES (N'1615115185836', N'danhnlcse140655@fpt.edu.vn', CAST(N'2021-03-07T00:00:00.000' AS DateTime), 19200, N'inactive')
GO
ALTER TABLE [dbo].[tblCars]  WITH CHECK ADD  CONSTRAINT [FK_tblCars_tblCar_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tblCar_Type] ([Id])
GO
ALTER TABLE [dbo].[tblCars] CHECK CONSTRAINT [FK_tblCars_tblCar_Type]
GO
ALTER TABLE [dbo].[tblDiscountDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblDiscountDetail_tblCars] FOREIGN KEY([CarId])
REFERENCES [dbo].[tblCars] ([Id])
GO
ALTER TABLE [dbo].[tblDiscountDetail] CHECK CONSTRAINT [FK_tblDiscountDetail_tblCars]
GO
ALTER TABLE [dbo].[tblDiscountDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblDiscountDetail_tblDiscount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[tblDiscount] ([Id])
GO
ALTER TABLE [dbo].[tblDiscountDetail] CHECK CONSTRAINT [FK_tblDiscountDetail_tblDiscount]
GO
ALTER TABLE [dbo].[tblFeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedBacks_tblCars] FOREIGN KEY([CarId])
REFERENCES [dbo].[tblCars] ([Id])
GO
ALTER TABLE [dbo].[tblFeedBacks] CHECK CONSTRAINT [FK_tblFeedBacks_tblCars]
GO
ALTER TABLE [dbo].[tblFeedBacks]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedBacks_tblCustomers] FOREIGN KEY([Email])
REFERENCES [dbo].[tblCustomers] ([Email])
GO
ALTER TABLE [dbo].[tblFeedBacks] CHECK CONSTRAINT [FK_tblFeedBacks_tblCustomers]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblCars] FOREIGN KEY([CarId])
REFERENCES [dbo].[tblCars] ([Id])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblCars]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrders] ([Id])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblCustomers] FOREIGN KEY([Email])
REFERENCES [dbo].[tblCustomers] ([Email])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblCustomers]
GO
/****** Object:  StoredProcedure [dbo].[getQuantityOfAbleRent]    Script Date: 3/7/2021 10:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getQuantityOfAbleRent](
	@pick date,
	@drop date,
	@Id int
)
As
Begin
	Select Quantity, dbo.FU_RentedCar(@Id,@pick,@drop) as RentedCar From tblCars
	Where Id = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 3/7/2021 10:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Search](
	@pickupDate date,
	@dropoutDate date,
	@name varchar(200),
	@quantity int
)
As
Begin
	Select Count(Id)
	from tblCars
	Where (Name Like '%'+@name+'%') and (dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) + @quantity <= Quantity)
End
GO
/****** Object:  StoredProcedure [dbo].[Search_CarType]    Script Date: 3/7/2021 10:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Search_CarType](
	@pickupDate date,
	@dropoutDate date,
	@name varchar(200),
	@typeId int,
	@quantity int
)
As
Begin
	Select Count(Id)
	from tblCars
	Where (dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) + @quantity <= Quantity) And (Name Like '%'+@name+'%') and TypeId = @typeId
End
GO
/****** Object:  StoredProcedure [dbo].[Search_Paging]    Script Date: 3/7/2021 10:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Search_Paging](
	@pickupDate date,
	@dropoutDate date,
	@name varchar(200),
	@quantity int,
	@index int,
	@size int
)
As
Begin
	Select Id, Name, TypeId, Image, Quantity, Price, Seat, Color, dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) 
	as RentedCar
	from tblCars
	Where (Name Like '%'+@name+'%') and (dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) + @quantity <= Quantity)
	Order By Id
	OFFSET (@index - 1) * @size ROWS
	FETCH FIRST @size ROWS ONLY
End
GO
/****** Object:  StoredProcedure [dbo].[Search_Paging_CarType]    Script Date: 3/7/2021 10:14:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Search_Paging_CarType](
	@pickupDate date,
	@dropoutDate date,
	@name varchar(200),
	@typeId int,
	@quantity int,
	@index int,
	@size int
)
As
Begin
	Select Id, Name, TypeId, Image, Quantity, Price, Seat, Color, dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) 
	as RentedCar
	from tblCars
	Where (Name Like '%'+@name+'%') and (dbo.FU_RentedCar(Id, @pickupDate, @dropoutDate) + @quantity <= Quantity) And TypeId = @typeId
	Order By Id
	OFFSET (@index - 1) * @size ROWS
	FETCH FIRST @size ROWS ONLY
End
GO
USE [master]
GO
ALTER DATABASE [Assignment3_NguyenLamCongDanh] SET  READ_WRITE 
GO
