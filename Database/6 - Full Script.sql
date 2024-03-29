USE master
GO
DROP DATABASE IF EXISTS [MyShopK7]
GO

CREATE DATABASE MyShopK7
GO

USE [MyShopK7]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/17/2019 9:21:18 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[ParentCategoryId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [nvarchar](20) NULL,
	[Discount] [tinyint] NULL,
	[Voucher] [float] NULL,
	[ExpireDate] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[PhoneConfirmed] [bit] NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RandomKey] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderedDate] [datetime2](7) NOT NULL,
	[DeliveryDate] [datetime2](7) NULL,
	[CustomerId] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[CouponCode] [nvarchar](20) NULL,
	[Discount] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[FeeShip] [float] NOT NULL,
	[Receiver] [nvarchar](max) NULL,
	[ShipTo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [tinyint] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Discount] [tinyint] NOT NULL,
	[Amount] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[SupplierId] [int] NULL,
	[MainImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 9/17/2019 9:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](150) NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190829123852_DbInit', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190903133042_Add_tblProductImage', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190912123450_Add_OrderInfo', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190912133609_AddCoupon', N'2.2.4-servicing-10062')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190917115716_AddOrderColumn', N'2.2.4-servicing-10062')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (1, N'Điện thoại', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (2, N'Điện thoại Phổ thông', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (3, N'Điện thoại Cao cấp', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (4, N'Máy tính bảng', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (5, N'Loại thường', 4)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (6, N'Loại cao cấp', 4)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (7, N'Điện máy - Điện lạnh', NULL)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (8, N'Tivi', 7)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [ParentCategoryId]) VALUES (9, N'Tủ lạnh', 7)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([Id], [CouponCode], [Discount], [Voucher], [ExpireDate], [Status]) VALUES (1, N'NHATNGHE30', 30, 500000, CAST(N'2019-10-15T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Coupon] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FullName], [Email], [EmailConfirmed], [Address], [Phone], [PhoneConfirmed], [Username], [Password], [RandomKey], [IsActive]) VALUES (1, N'Trần Văn Huệ', N'tvhue@nhatnghe.com', 0, N'105 Bà Huyện Thanh Quan, Quận 3', N'0903789456', 0, N'admin', N'cd48859bc2ba77d42f34b6bb0645c193', N'1zsg9#h1', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name], [Address], [Phone], [Email]) VALUES (1, N'Nokia', N'Bắc Ninh', N'19001090', N'info@nokia.com')
INSERT [dbo].[Manufacturer] ([Id], [Name], [Address], [Phone], [Email]) VALUES (2, N'Samsung', N'Hưng Yên', N'18001789', N'info@samsungvina.com')
INSERT [dbo].[Manufacturer] ([Id], [Name], [Address], [Phone], [Email]) VALUES (3, N'Apple', N'HCM', N'18001546', N'info-vn@apple.com')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (1, N'Tivi 24"', N'Tivi 24"', 15200, 0, 1952, 8, 2, N'637034770799904951_tivi-sony-kdl-32r300e-2000-m.jpg')
INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (2, N'Book 1', N'<p>Book 123<br></p>', 15800, 0, 21, 2, 1, N'637033094786322922_1.jpg')
INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (3, N'Samsung Galaxy Note 10', N'<h2 style="font-family: Roboto, sans-serif; font-weight: inherit; line-height: 1.1; color: rgb(52, 58, 70); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 13px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline;"><b style="font-weight: bold;">Cấu hình Samsung Galaxy Note 10</b></h2><p><br style="font-family: Roboto, sans-serif; color: rgb(52, 58, 70); font-size: 13px;"></p><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Màn hình</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">Dynamic AMOLED, 6.3", F<a href="https://www.hnammobile.com/tin-tuc/tim-hieu-do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k.19138.html" title="Tìm hiều độ phân giải màn hình qHD, HD, FullHD, 2K, 4K" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">HD</a>+</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Hệ điều hành</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">Android Pie 9.0</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Camera sau</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">Ống kính góc rông 12MP OIS ( F.15/F2.4) Ống kính zoom 12MP OIS ( F2.1) Ống kính góc siêu rộng 16MP ( F2.2)</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Camera trước</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">10MP ( F2.2)</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">CPU</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">octa-core&nbsp;<a href="https://www.hnammobile.com/tin-tuc/tong-hop-cac-dong-chip-exynos-pho-bien-nhat-cua-samsung-hien-nay.19355.html" title="Tổng hợp các dòng chip Exynos phổ biến nhất của Samsung hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">Exynos</a>&nbsp;9825</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">RAM</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">8GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Bộ nhớ trong</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">256GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Thẻ nhớ ngoài</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">MicroSD, hỗ trợ tối đa 512 GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">SIM</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;"><a href="https://www.hnammobile.com/tin-tuc/tim-hieu-cac-chuan-sim-hien-nay.19395.html" title="Tìm hiểu các chuẩn sim hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">2 SIM Nano</a>&nbsp;(<a href="https://www.hnammobile.com/tin-tuc/tim-hieu-cac-chuan-sim-hien-nay.19395.html" title="Tìm hiểu các chuẩn sim hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">SIM</a>&nbsp;2 chung khe thẻ nhớ),Hỗ trợ&nbsp;<a href="https://www.hnammobile.com/tin-tuc/phan-biet-mang-4g-va-4g-lte.19392.html" title="Phân biệt mạng 4G và <a target=''_blank'' title=''4G LTE'' href=''https://www.hnammobile.com/tin-tuc/cong-nghe-4g-lte-la-gi.16171.html'' >4G LTE</a>" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">4G</a></p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Dung lượng pin</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">3.500mAh, Có sạc nhanh</p></div>', 23598000, 1, 19, 3, 2, N'637033116479394031_samsung-galaxy-note-10.jpg')
INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (4, N'Samsung Galaxy Note 9 N960 128Gb Ram 6Gb', N'<h2 style="font-family: Roboto, sans-serif; font-weight: inherit; line-height: 1.1; color: rgb(52, 58, 70); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 13px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline;"><b style="font-weight: bold;">Cấu hình Samsung Galaxy Note 9 N960 128Gb Ram 6Gb</b></h2><p><br style="font-family: Roboto, sans-serif; color: rgb(52, 58, 70); font-size: 13px;"></p><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Màn hình</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;"><a href="https://www.hnammobile.com/tin-tuc/ma-n-hi-nh-super-amoled-la-gi.19176.html" title="Màn hình Super Amoled là gì?" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">Super AMOLED</a>, 6.4",&nbsp;<a href="https://www.hnammobile.com/tin-tuc/tim-hieu-do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k.19138.html" title="Tìm hiều độ phân giải màn hình qHD, HD, FullHD, 2K, 4K" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">2K</a>+</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Hệ điều hành</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;"><a href="https://www.hnammobile.com/tin-tuc/tong-hop-nhung-thay-doi-dang-gia-tren-android-8-0-oreo.19270.html" title="Tổng hợp những thay đổi đáng giá trên Android 8.0 Oreo" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">Android 8.1</a>&nbsp;(Oreo)</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Camera sau</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">Chính 12 MP &amp; Phụ 12 MP</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Camera trước</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">8 MP</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">CPU</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;"><a href="https://www.hnammobile.com/tin-tuc/tong-hop-cac-dong-chip-exynos-pho-bien-nhat-cua-samsung-hien-nay.19355.html" title="Tổng hợp các dòng chip Exynos phổ biến nhất của Samsung hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">Exynos</a>&nbsp;9810 8 nhân 64-bit</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">RAM</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">6 GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Bộ nhớ trong</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">128 GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Thẻ nhớ ngoài</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">MicroSD, hỗ trợ tối đa 512 GB</p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">SIM</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;"><a href="https://www.hnammobile.com/tin-tuc/tim-hieu-cac-chuan-sim-hien-nay.19395.html" title="Tìm hiểu các chuẩn sim hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">2 SIM Nano</a>&nbsp;(<a href="https://www.hnammobile.com/tin-tuc/tim-hieu-cac-chuan-sim-hien-nay.19395.html" title="Tìm hiểu các chuẩn sim hiện nay" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">SIM</a>&nbsp;2 chung khe thẻ nhớ),Hỗ trợ&nbsp;<a href="https://www.hnammobile.com/tin-tuc/phan-biet-mang-4g-va-4g-lte.19392.html" title="Phân biệt mạng 4G và <a target=''_blank'' title=''4G LTE'' href=''https://www.hnammobile.com/tin-tuc/cong-nghe-4g-lte-la-gi.16171.html'' >4G LTE</a>" target="_blank" style="font-family: inherit; font-weight: inherit; color: rgb(255, 84, 0); margin: 0px; padding: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: 13px; vertical-align: baseline; cursor: pointer;">4G</a></p></div><div class="row size-screen" style="font-family: Roboto, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: baseline; color: rgb(52, 58, 70);"><label class="col-sm-3 col-lg-3" style="font-family: inherit; font-weight: bold; max-width: 100%; margin: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; min-height: 1px; float: left; width: 121.25px; clear: none;">Dung lượng pin</label><p class="col-sm-9 col-lg-9" style="font-family: inherit; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-top: 0px; padding-bottom: 0px; border: 0px; outline: 0px; font-style: inherit; font-size: small; vertical-align: baseline; min-height: 1px; float: left; width: 363.75px; line-height: 1.538;">4000 mAh, Có sạc nhanh</p></div>', 17990000, 0, 45, 3, 2, N'637033124318626814_samsung-galaxy-note-9-128gb-ram-6gb.jpg')
INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (5, N'Apple IPhone 11 (2019)', NULL, 22800000, 0, 100, NULL, 3, N'637033125117526244_apple-iphone-11.jpg')
INSERT [dbo].[Product] ([ProductId], [Title], [Description], [Price], [Discount], [Amount], [CategoryId], [SupplierId], [MainImage]) VALUES (6, N'Panasonic 288L', N'<p><div class="product-info-stock-sku" style="box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"></div></p><div class="page-title" style="box-sizing: border-box; color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><h1 style="box-sizing: border-box; margin: 15px 0px 9px; font-weight: 400; line-height: 1.2; font-size: 36px; font-family: Rufina, serif; color: rgb(51, 51, 51); padding: 0px; text-transform: capitalize;">Panasonic 288L</h1></div>', 11290990, 19, 12, 9, 2, N'637034837541170083_tu-lanh-panasonic-nr-bv288gkv2-255l.jpeg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (1, N'637033095889308757_3.jpg', 2)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (2, N'637033095889740976_4.jpg', 2)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (3, N'637033095890025936_5.jpg', 2)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (4, N'637033095890109221_7.jpg', 2)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (5, N'637033116479593566_samsung-galaxy-note-10-1.jpg', 3)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (6, N'637034837541226957_pana03.jpg', 6)
INSERT [dbo].[ProductImage] ([Id], [FileName], [ProductId]) VALUES (7, N'637034837541497434_pana04.jpg', 6)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category_ParentCategoryId] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category_ParentCategoryId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_CustomerId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_ProductId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer_SupplierId]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product_ProductId]
GO
