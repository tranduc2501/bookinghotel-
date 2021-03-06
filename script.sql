USE [master]
GO
/****** Object:  Database [QLKhachSan]    Script Date: 21/12/2018 1:45:57 AM ******/
CREATE DATABASE [QLKhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKhachSan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLKhachSan.mdf' , SIZE = 4352KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLKhachSan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLKhachSan_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLKhachSan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKhachSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKhachSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKhachSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKhachSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKhachSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKhachSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKhachSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKhachSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKhachSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKhachSan] SET  MULTI_USER 
GO
ALTER DATABASE [QLKhachSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKhachSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLKhachSan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLKhachSan', N'ON'
GO
ALTER DATABASE [QLKhachSan] SET QUERY_STORE = OFF
GO
USE [QLKhachSan]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 21/12/2018 1:45:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[RoomID] [int] NULL,
	[creatAt] [date] NULL,
	[timeStart] [datetime] NULL,
	[timeEnd] [datetime] NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 21/12/2018 1:45:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[DistrictName] [nvarchar](255) NULL,
 CONSTRAINT [PK_vnk_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 21/12/2018 1:45:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[provinceID] [int] NOT NULL,
	[districtID] [int] NOT NULL,
	[address] [nvarchar](50) NULL,
	[phone] [char](50) NULL,
	[status] [int] NULL,
	[images] [nvarchar](500) NULL,
	[creatAt] [date] NULL,
	[description] [nvarchar](500) NULL,
	[name] [nvarchar](100) NULL,
	[shortDes] [nvarchar](200) NULL,
	[thumb] [nvarchar](100) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 21/12/2018 1:45:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [nvarchar](255) NULL,
 CONSTRAINT [PK_vnk_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 21/12/2018 1:45:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[hotelID] [int] NULL,
	[status] [int] NULL,
	[images] [nvarchar](500) NULL,
	[price] [int] NULL,
	[description] [nvarchar](500) NULL,
	[createAt] [date] NULL,
	[thumb] [nvarchar](500) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21/12/2018 1:45:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [char](50) NOT NULL,
	[password] [char](50) NOT NULL,
	[provinceID] [int] NULL,
	[districtID] [int] NULL,
	[address] [nvarchar](50) NULL,
	[role] [int] NOT NULL,
	[cmt] [char](15) NULL,
	[phone] [char](15) NULL,
	[status] [int] NULL,
	[createAt] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [userID], [RoomID], [creatAt], [timeStart], [timeEnd], [description]) VALUES (3, 2, 9, CAST(N'2018-12-20' AS Date), CAST(N'2018-12-13T01:01:00.000' AS DateTime), CAST(N'2018-12-14T05:05:00.000' AS DateTime), N'Đặt phòng xem thế nào')
INSERT [dbo].[Booking] ([id], [userID], [RoomID], [creatAt], [timeStart], [timeEnd], [description]) VALUES (5, 2, 18, CAST(N'2018-12-20' AS Date), CAST(N'2018-12-27T00:00:00.000' AS DateTime), CAST(N'2018-12-29T00:00:00.000' AS DateTime), N'Không có')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (1, 1, N'Quận Ba Đình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (2, 1, N'Quận Hoàn Kiếm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (3, 1, N'Quận Tây Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (4, 1, N'Quận Long Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (5, 1, N'Quận Cầu Giấy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (6, 1, N'Quận Đống Đa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (7, 1, N'Quận Hai Bà Trưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (8, 1, N'Quận Hoàng Mai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (9, 1, N'Quận Thanh Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (10, 1, N'Huyện Sóc Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (11, 1, N'Huyện Đông Anh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (12, 1, N'Huyện Gia Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (13, 1, N'Quận Nam Từ Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (14, 1, N'Huyện Thanh Trì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (15, 1, N'Quận Bắc Từ Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (16, 1, N'Huyện Mê Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (17, 1, N'Quận Hà Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (18, 1, N'Thị xã Sơn Tây')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (19, 1, N'Huyện Ba Vì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (20, 1, N'Huyện Phúc Thọ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (21, 1, N'Huyện Đan Phượng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (22, 1, N'Huyện Hoài Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (23, 1, N'Huyện Quốc Oai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (24, 1, N'Huyện Thạch Thất')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (25, 1, N'Huyện Chương Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (26, 1, N'Huyện Thanh Oai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (27, 1, N'Huyện Thường Tín')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (28, 1, N'Huyện Phú Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (29, 1, N'Huyện Ứng Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (30, 1, N'Huyện Mỹ Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (31, 2, N'Thành phố Hà Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (32, 2, N'Huyện Đồng Văn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (33, 2, N'Huyện Mèo Vạc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (34, 2, N'Huyện Yên Minh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (35, 2, N'Huyện Quản Bạ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (36, 2, N'Huyện Vị Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (37, 2, N'Huyện Bắc Mê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (38, 2, N'Huyện Hoàng Su Phì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (39, 12, N'Huyện Đức Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (40, 12, N'Huyện Hàm Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (41, 12, N'Huyện Phú Quí')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (42, 3, N'Thành phố Kon Tum')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (43, 3, N'Huyện Đắk Glei')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (44, 3, N'Huyện Ngọc Hồi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (45, 3, N'Huyện Đắk Tô')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (46, 3, N'Huyện Kon Plông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (47, 3, N'Huyện Kon Rẫy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (48, 3, N'Huyện Đắk Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (49, 3, N'Huyện Sa Thầy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (50, 3, N'Huyện Tu Mơ Rông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (51, 3, N'Huyện Ia H'' Drai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (52, 4, N'Thành phố Pleiku')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (53, 4, N'Thị xã An Khê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (54, 4, N'Thị xã Ayun Pa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (55, 4, N'Huyện KBang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (56, 4, N'Huyện Đăk Đoa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (57, 4, N'Huyện Chư Păh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (58, 4, N'Huyện Ia Grai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (59, 4, N'Huyện Mang Yang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (60, 4, N'Huyện Kông Chro')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (61, 4, N'Huyện Đức Cơ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (62, 4, N'Huyện Chư Prông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (63, 4, N'Huyện Chư Sê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (64, 4, N'Huyện Đăk Pơ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (65, 4, N'Huyện Ia Pa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (66, 4, N'Huyện Krông Pa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (67, 4, N'Huyện Phú Thiện')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (68, 4, N'Huyện Chư Pưh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (69, 5, N'Thành phố Buôn Ma Thuột')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (70, 5, N'Thị Xã Buôn Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (71, 5, N'Huyện Ea H''leo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (72, 5, N'Huyện Ea Súp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (73, 5, N'Huyện Buôn Đôn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (74, 5, N'Huyện Cư M''gar')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (75, 5, N'Huyện Krông Búk')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (76, 5, N'Huyện Krông Năng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (77, 5, N'Huyện Ea Kar')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (78, 5, N'Huyện M''Đrắk')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (79, 5, N'Huyện Krông Bông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (80, 5, N'Huyện Krông Pắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (81, 5, N'Huyện Krông A Na')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (82, 5, N'Huyện Lắk')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (83, 5, N'Huyện Cư Kuin')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (84, 6, N'Thị xã Gia Nghĩa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (85, 6, N'Huyện Đăk Glong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (86, 6, N'Huyện Cư Jút')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (87, 6, N'Huyện Đắk Mil')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (88, 6, N'Huyện Krông Nô')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (89, 6, N'Huyện Đắk Song')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (90, 6, N'Huyện Đắk R''Lấp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (91, 6, N'Huyện Tuy Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (92, 7, N'Thành phố Đà Lạt')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (93, 7, N'Thành phố Bảo Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (94, 7, N'Huyện Đam Rông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (95, 7, N'Huyện Lạc Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (96, 7, N'Huyện Lâm Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (97, 7, N'Huyện Đơn Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (98, 7, N'Huyện Đức Trọng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (99, 23, N'Huyện Trà Bồng')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (100, 23, N'Huyện Tây Trà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (101, 23, N'Huyện Sơn Tịnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (102, 23, N'Huyện Tư Nghĩa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (103, 23, N'Huyện Sơn Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (104, 23, N'Huyện Sơn Tây')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (105, 23, N'Huyện Minh Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (106, 23, N'Huyện Nghĩa Hành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (107, 23, N'Huyện Mộ Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (108, 23, N'Huyện Đức Phổ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (109, 23, N'Huyện Ba Tơ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (110, 23, N'Huyện Lý Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (111, 8, N'Thành phố Qui Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (112, 8, N'Huyện An Lão')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (113, 8, N'Huyện Hoài Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (114, 8, N'Huyện Hoài Ân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (115, 8, N'Huyện Phù Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (116, 8, N'Huyện Vĩnh Thạnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (117, 8, N'Huyện Tây Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (118, 8, N'Huyện Phù Cát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (119, 8, N'Thị xã An Nhơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (120, 8, N'Huyện Tuy Phước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (121, 8, N'Huyện Vân Canh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (122, 9, N'Thành phố Tuy Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (123, 9, N'Thị xã Sông Cầu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (124, 9, N'Huyện Đồng Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (125, 9, N'Huyện Tuy An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (126, 9, N'Huyện Sơn Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (127, 9, N'Huyện Sông Hinh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (128, 9, N'Huyện Tây Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (129, 9, N'Huyện Phú Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (130, 9, N'Huyện Đông Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (131, 10, N'Thành phố Nha Trang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (132, 10, N'Thành phố Cam Ranh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (133, 10, N'Huyện Cam Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (134, 10, N'Huyện Vạn Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (135, 10, N'Thị xã Ninh Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (136, 10, N'Huyện Khánh Vĩnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (137, 10, N'Huyện Diên Khánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (138, 10, N'Huyện Khánh Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (139, 10, N'Huyện Trường Sa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (140, 11, N'Thành phố Phan Rang-Tháp Chàm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (141, 11, N'Huyện Bác Ái')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (142, 11, N'Huyện Ninh Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (143, 11, N'Huyện Ninh Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (144, 11, N'Huyện Ninh Phước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (145, 11, N'Huyện Thuận Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (146, 11, N'Huyện Thuận Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (147, 12, N'Thành phố Phan Thiết')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (148, 12, N'Thị xã La Gi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (149, 12, N'Huyện Tuy Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (150, 12, N'Huyện Bắc Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (151, 12, N'Huyện Hàm Thuận Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (152, 12, N'Huyện Hàm Thuận Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (153, 12, N'Huyện Tánh Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (154, 7, N'Huyện Di Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (155, 7, N'Huyện Bảo Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (156, 7, N'Huyện Đạ Huoai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (157, 7, N'Huyện Đạ Tẻh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (158, 7, N'Huyện Cát Tiên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (159, 13, N'Thị xã Phước Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (160, 13, N'Thị xã Đồng Xoài')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (161, 13, N'Thị xã Bình Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (162, 13, N'Huyện Bù Gia Mập')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (163, 13, N'Huyện Lộc Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (164, 13, N'Huyện Bù Đốp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (165, 13, N'Huyện Hớn Quản')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (166, 13, N'Huyện Đồng Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (167, 13, N'Huyện Bù Đăng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (168, 13, N'Huyện Chơn Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (169, 13, N'Huyện Phú Riềng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (170, 14, N'Thành phố Tây Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (171, 14, N'Huyện Tân Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (172, 14, N'Huyện Tân Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (173, 14, N'Huyện Dương Minh Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (174, 14, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (175, 14, N'Huyện Hòa Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (176, 14, N'Huyện Gò Dầu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (177, 14, N'Huyện Bến Cầu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (178, 14, N'Huyện Trảng Bàng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (179, 15, N'Thành phố Thủ Dầu Một')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (180, 15, N'Huyện Bàu Bàng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (181, 15, N'Huyện Dầu Tiếng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (182, 15, N'Thị xã Bến Cát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (183, 15, N'Huyện Phú Giáo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (184, 15, N'Thị xã Tân Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (185, 15, N'Thị xã Dĩ An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (186, 15, N'Thị xã Thuận An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (187, 15, N'Huyện Bắc Tân Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (188, 16, N'Thành phố Biên Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (189, 16, N'Thị xã Long Khánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (190, 16, N'Huyện Tân Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (191, 16, N'Huyện Vĩnh Cửu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (192, 16, N'Huyện Định Quán')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (193, 16, N'Huyện Trảng Bom')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (194, 16, N'Huyện Thống Nhất')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (195, 16, N'Huyện Cẩm Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (196, 16, N'Huyện Long Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (197, 16, N'Huyện Xuân Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (198, 16, N'Huyện Nhơn Trạch')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (199, 17, N'Thành phố Vũng Tàu')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (200, 17, N'Thành phố Bà Rịa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (201, 17, N'Huyện Châu Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (202, 17, N'Huyện Xuyên Mộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (203, 17, N'Huyện Long Điền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (204, 17, N'Huyện Đất Đỏ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (205, 17, N'Huyện Tân Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (206, 17, N'Huyện Côn Đảo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (207, 18, N'Quận 1')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (208, 18, N'Quận 12')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (209, 18, N'Quận Thủ Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (210, 18, N'Quận 9')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (211, 18, N'Quận Gò Vấp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (212, 18, N'Quận Bình Thạnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (213, 25, N'Huyện Quảng Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (214, 25, N'Huyện Lệ Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (215, 25, N'Thị xã Ba Đồn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (216, 19, N'Thành phố Đông Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (217, 19, N'Thị xã Quảng Trị')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (218, 19, N'Huyện Vĩnh Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (219, 19, N'Huyện Hướng Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (220, 19, N'Huyện Gio Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (221, 19, N'Huyện Đa Krông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (222, 19, N'Huyện Cam Lộ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (223, 19, N'Huyện Triệu Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (224, 19, N'Huyện Hải Lăng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (225, 19, N'Huyện Cồn Cỏ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (226, 20, N'Thành phố Huế')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (227, 20, N'Huyện Phong Điền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (228, 20, N'Huyện Quảng Điền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (229, 20, N'Huyện Phú Vang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (230, 20, N'Thị xã Hương Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (231, 20, N'Thị xã Hương Trà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (232, 20, N'Huyện A Lưới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (233, 20, N'Huyện Phú Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (234, 20, N'Huyện Nam Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (235, 21, N'Quận Liên Chiểu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (236, 21, N'Quận Thanh Khê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (237, 21, N'Quận Hải Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (238, 21, N'Quận Sơn Trà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (239, 21, N'Quận Ngũ Hành Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (240, 21, N'Quận Cẩm Lệ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (241, 21, N'Huyện Hòa Vang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (242, 21, N'Huyện Hoàng Sa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (243, 22, N'Thành phố Tam Kỳ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (244, 22, N'Thành phố Hội An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (245, 22, N'Huyện Tây Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (246, 22, N'Huyện Đông Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (247, 22, N'Huyện Đại Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (248, 22, N'Thị xã Điện Bàn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (249, 22, N'Huyện Duy Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (250, 22, N'Huyện Quế Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (251, 22, N'Huyện Nam Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (252, 22, N'Huyện Phước Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (253, 22, N'Huyện Hiệp Đức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (254, 22, N'Huyện Thăng Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (255, 22, N'Huyện Tiên Phước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (256, 22, N'Huyện Bắc Trà My')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (257, 22, N'Huyện Nam Trà My')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (258, 22, N'Huyện Núi Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (259, 22, N'Huyện Phú Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (260, 22, N'Huyện Nông Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (261, 23, N'Thành phố Quảng Ngãi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (262, 23, N'Huyện Bình Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (263, 26, N'Huyện Nghĩa Đàn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (264, 26, N'Huyện Quỳ Hợp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (265, 26, N'Huyện Quỳnh Lưu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (266, 26, N'Huyện Con Cuông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (267, 26, N'Huyện Tân Kỳ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (268, 26, N'Huyện Anh Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (269, 26, N'Huyện Diễn Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (270, 26, N'Huyện Yên Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (271, 26, N'Huyện Đô Lương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (272, 26, N'Huyện Thanh Chương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (273, 26, N'Huyện Nghi Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (274, 26, N'Huyện Nam Đàn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (275, 26, N'Huyện Hưng Nguyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (276, 26, N'Thị xã Hoàng Mai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (277, 24, N'Thành phố Hà Tĩnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (278, 24, N'Thị xã Hồng Lĩnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (279, 24, N'Huyện Hương Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (280, 24, N'Huyện Đức Thọ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (281, 24, N'Huyện Vũ Quang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (282, 24, N'Huyện Nghi Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (283, 24, N'Huyện Can Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (284, 24, N'Huyện Hương Khê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (285, 24, N'Huyện Thạch Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (286, 24, N'Huyện Cẩm Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (287, 24, N'Huyện Kỳ Anh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (288, 24, N'Huyện Lộc Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (289, 24, N'Thị xã Kỳ Anh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (290, 25, N'Thành Phố Đồng Hới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (291, 25, N'Huyện Minh Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (292, 25, N'Huyện Tuyên Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (293, 25, N'Huyện Quảng Trạch')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (294, 25, N'Huyện Bố Trạch')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (295, 30, N'Thị xã Bỉm Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (296, 30, N'Thành phố Sầm Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (297, 30, N'Huyện Mường Lát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (298, 30, N'Huyện Quan Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (299, 30, N'Huyện Bá Thước')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (300, 30, N'Huyện Quan Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (301, 30, N'Huyện Lang Chánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (302, 30, N'Huyện Ngọc Lặc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (303, 30, N'Huyện Cẩm Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (304, 30, N'Huyện Thạch Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (305, 30, N'Huyện Hà Trung')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (306, 30, N'Huyện Vĩnh Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (307, 30, N'Huyện Yên Định')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (308, 30, N'Huyện Thọ Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (309, 30, N'Huyện Thường Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (310, 30, N'Huyện Triệu Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (311, 30, N'Huyện Thiệu Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (312, 30, N'Huyện Hoằng Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (313, 30, N'Huyện Hậu Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (314, 30, N'Huyện Nga Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (315, 30, N'Huyện Như Xuân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (316, 30, N'Huyện Như Thanh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (317, 30, N'Huyện Nông Cống')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (318, 30, N'Huyện Đông Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (319, 30, N'Huyện Quảng Xương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (320, 30, N'Huyện Tĩnh Gia')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (321, 26, N'Thành phố Vinh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (322, 26, N'Thị xã Cửa Lò')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (323, 26, N'Thị xã Thái Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (324, 26, N'Huyện Quế Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (325, 26, N'Huyện Quỳ Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (326, 26, N'Huyện Kỳ Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (327, 26, N'Huyện Tương Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (328, 55, N'Huyện Đông Hưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (329, 55, N'Huyện Thái Thụy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (330, 55, N'Huyện Tiền Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (331, 55, N'Huyện Kiến Xương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (332, 55, N'Huyện Vũ Thư')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (333, 27, N'Thành phố Phủ Lý')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (334, 27, N'Huyện Duy Tiên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (335, 27, N'Huyện Kim Bảng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (336, 27, N'Huyện Thanh Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (337, 27, N'Huyện Bình Lục')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (338, 27, N'Huyện Lý Nhân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (339, 28, N'Thành phố Nam Định')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (340, 28, N'Huyện Mỹ Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (341, 28, N'Huyện Vụ Bản')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (342, 28, N'Huyện Ý Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (343, 28, N'Huyện Nghĩa Hưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (344, 28, N'Huyện Nam Trực')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (345, 28, N'Huyện Trực Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (346, 28, N'Huyện Xuân Trường')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (347, 28, N'Huyện Giao Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (348, 28, N'Huyện Hải Hậu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (349, 29, N'Thành phố Ninh Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (350, 29, N'Thành phố Tam Điệp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (351, 29, N'Huyện Nho Quan')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (352, 29, N'Huyện Gia Viễn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (353, 29, N'Huyện Hoa Lư')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (354, 29, N'Huyện Yên Khánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (355, 29, N'Huyện Kim Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (356, 29, N'Huyện Yên Mô')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (357, 30, N'Thành phố Thanh Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (358, 60, N'Huyện Kiên Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (359, 60, N'Huyện U Minh Thượng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (360, 60, N'Huyện Giang Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (361, 31, N'Quận Ninh Kiều')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (362, 31, N'Quận Ô Môn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (363, 31, N'Quận Bình Thuỷ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (364, 31, N'Quận Cái Răng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (365, 31, N'Quận Thốt Nốt')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (366, 31, N'Huyện Vĩnh Thạnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (367, 31, N'Huyện Cờ Đỏ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (368, 31, N'Huyện Phong Điền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (369, 31, N'Huyện Thới Lai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (370, 32, N'Thành phố Vị Thanh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (371, 32, N'Thị xã Ngã Bảy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (372, 32, N'Huyện Châu Thành A')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (373, 32, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (374, 32, N'Huyện Phụng Hiệp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (375, 32, N'Huyện Vị Thuỷ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (376, 32, N'Huyện Long Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (377, 32, N'Thị xã Long Mỹ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (378, 33, N'Thành phố Sóc Trăng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (379, 33, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (380, 33, N'Huyện Kế Sách')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (381, 33, N'Huyện Mỹ Tú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (382, 33, N'Huyện Cù Lao Dung')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (383, 33, N'Huyện Long Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (384, 33, N'Huyện Mỹ Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (385, 33, N'Thị xã Ngã Năm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (386, 33, N'Huyện Thạnh Trị')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (387, 33, N'Thị xã Vĩnh Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (388, 33, N'Huyện Trần Đề')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (389, 34, N'Thành phố Bạc Liêu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (390, 34, N'Huyện Hồng Dân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (391, 34, N'Huyện Phước Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (392, 34, N'Huyện Vĩnh Lợi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (393, 34, N'Thị xã Giá Rai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (394, 34, N'Huyện Đông Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (395, 34, N'Huyện Hoà Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (396, 35, N'Thành phố Cà Mau')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (397, 35, N'Huyện U Minh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (398, 35, N'Huyện Thới Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (399, 35, N'Huyện Trần Văn Thời')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (400, 35, N'Huyện Cái Nước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (401, 35, N'Huyện Đầm Dơi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (402, 35, N'Huyện Năm Căn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (403, 35, N'Huyện Phú Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (404, 35, N'Huyện Ngọc Hiển')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (405, 43, N'Huyện Mai Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (406, 43, N'Huyện Lạc Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (407, 43, N'Huyện Yên Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (408, 43, N'Huyện Lạc Thủy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (409, 36, N'Thành phố Thái Nguyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (410, 36, N'Thành phố Sông Công')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (411, 36, N'Huyện Định Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (412, 36, N'Huyện Phú Lương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (413, 36, N'Huyện Đồng Hỷ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (414, 36, N'Huyện Võ Nhai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (415, 36, N'Huyện Đại Từ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (416, 36, N'Thị xã Phổ Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (417, 36, N'Huyện Phú Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (418, 37, N'Thành phố Lạng Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (419, 37, N'Huyện Tràng Định')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (420, 37, N'Huyện Bình Gia')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (421, 37, N'Huyện Văn Lãng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (422, 37, N'Huyện Cao Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (423, 37, N'Huyện Văn Quan')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (424, 37, N'Huyện Bắc Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (425, 37, N'Huyện Hữu Lũng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (426, 37, N'Huyện Chi Lăng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (427, 37, N'Huyện Lộc Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (428, 37, N'Huyện Đình Lập')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (429, 38, N'Thành phố Hạ Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (430, 38, N'Thành phố Móng Cái')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (431, 38, N'Thành phố Cẩm Phả')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (432, 38, N'Thành phố Uông Bí')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (433, 38, N'Huyện Bình Liêu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (434, 38, N'Huyện Tiên Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (435, 38, N'Huyện Đầm Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (436, 38, N'Huyện Hải Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (437, 38, N'Huyện Ba Chẽ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (438, 38, N'Huyện Vân Đồn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (439, 38, N'Huyện Hoành Bồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (440, 38, N'Thị xã Đông Triều')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (441, 38, N'Thị xã Quảng Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (442, 38, N'Huyện Cô Tô')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (443, 39, N'Thành phố Bắc Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (444, 39, N'Huyện Yên Thế')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (445, 39, N'Huyện Tân Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (446, 51, N'Huyện Tủa Chùa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (447, 51, N'Huyện Tuần Giáo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (448, 51, N'Huyện Điện Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (449, 51, N'Huyện Điện Biên Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (450, 51, N'Huyện Mường Ảng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (451, 51, N'Huyện Nậm Pồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (452, 40, N'Thành phố Lai Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (453, 40, N'Huyện Tam Đường')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (454, 40, N'Huyện Mường Tè')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (455, 40, N'Huyện Sìn Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (456, 40, N'Huyện Phong Thổ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (457, 40, N'Huyện Than Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (458, 40, N'Huyện Tân Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (459, 40, N'Huyện Nậm Nhùn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (460, 41, N'Thành phố Sơn La')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (461, 41, N'Huyện Quỳnh Nhai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (462, 41, N'Huyện Thuận Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (463, 41, N'Huyện Mường La')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (464, 41, N'Huyện Bắc Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (465, 41, N'Huyện Phù Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (466, 41, N'Huyện Mộc Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (467, 41, N'Huyện Yên Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (468, 41, N'Huyện Mai Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (469, 41, N'Huyện Sông Mã')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (470, 41, N'Huyện Sốp Cộp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (471, 41, N'Huyện Vân Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (472, 42, N'Thành phố Yên Bái')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (473, 42, N'Thị xã Nghĩa Lộ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (474, 42, N'Huyện Lục Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (475, 42, N'Huyện Văn Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (476, 42, N'Huyện Mù Căng Chải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (477, 42, N'Huyện Trấn Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (478, 42, N'Huyện Trạm Tấu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (479, 42, N'Huyện Văn Chấn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (480, 42, N'Huyện Yên Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (481, 43, N'Thành phố Hòa Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (482, 43, N'Huyện Đà Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (483, 43, N'Huyện Kỳ Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (484, 43, N'Huyện Lương Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (485, 43, N'Huyện Kim Bôi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (486, 43, N'Huyện Cao Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (487, 43, N'Huyện Tân Lạc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (488, 39, N'Huyện Lạng Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (489, 39, N'Huyện Lục Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (490, 39, N'Huyện Lục Ngạn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (491, 39, N'Huyện Sơn Động')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (492, 39, N'Huyện Yên Dũng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (493, 39, N'Huyện Việt Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (494, 39, N'Huyện Hiệp Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (495, 44, N'Thành phố Việt Trì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (496, 44, N'Thị xã Phú Thọ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (497, 44, N'Huyện Đoan Hùng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (498, 44, N'Huyện Hạ Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (499, 44, N'Huyện Thanh Ba')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (500, 44, N'Huyện Phù Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (501, 44, N'Huyện Yên Lập')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (502, 44, N'Huyện Cẩm Khê')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (503, 44, N'Huyện Tam Nông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (504, 44, N'Huyện Lâm Thao')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (505, 44, N'Huyện Thanh Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (506, 44, N'Huyện Thanh Thuỷ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (507, 44, N'Huyện Tân Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (508, 45, N'Thành phố Vĩnh Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (509, 45, N'Thị xã Phúc Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (510, 45, N'Huyện Lập Thạch')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (511, 45, N'Huyện Tam Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (512, 45, N'Huyện Tam Đảo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (513, 45, N'Huyện Bình Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (514, 45, N'Huyện Yên Lạc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (515, 45, N'Huyện Vĩnh Tường')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (516, 45, N'Huyện Sông Lô')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (517, 46, N'Thành phố Bắc Ninh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (518, 46, N'Huyện Yên Phong')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (519, 46, N'Huyện Quế Võ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (520, 46, N'Huyện Tiên Du')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (521, 46, N'Thị xã Từ Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (522, 46, N'Huyện Thuận Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (523, 46, N'Huyện Gia Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (524, 46, N'Huyện Lương Tài')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (525, 2, N'Huyện Xín Mần')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (526, 2, N'Huyện Bắc Quang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (527, 2, N'Huyện Quang Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (528, 47, N'Thành phố Cao Bằng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (529, 47, N'Huyện Bảo Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (530, 47, N'Huyện Bảo Lạc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (531, 47, N'Huyện Thông Nông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (532, 47, N'Huyện Hà Quảng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (533, 47, N'Huyện Trà Lĩnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (534, 47, N'Huyện Trùng Khánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (535, 47, N'Huyện Hạ Lang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (536, 47, N'Huyện Quảng Uyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (537, 47, N'Huyện Phục Hoà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (538, 47, N'Huyện Hoà An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (539, 47, N'Huyện Nguyên Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (540, 47, N'Huyện Thạch An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (541, 48, N'Thành Phố Bắc Kạn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (542, 48, N'Huyện Pác Nặm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (543, 48, N'Huyện Ba Bể')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (544, 48, N'Huyện Ngân Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (545, 48, N'Huyện Bạch Thông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (546, 48, N'Huyện Chợ Đồn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (547, 48, N'Huyện Chợ Mới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (548, 48, N'Huyện Na Rì')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (549, 49, N'Thành phố Tuyên Quang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (550, 49, N'Huyện Lâm Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (551, 49, N'Huyện Na Hang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (552, 49, N'Huyện Chiêm Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (553, 49, N'Huyện Hàm Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (554, 49, N'Huyện Yên Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (555, 49, N'Huyện Sơn Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (556, 50, N'Thành phố Lào Cai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (557, 50, N'Huyện Bát Xát')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (558, 50, N'Huyện Mường Khương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (559, 50, N'Huyện Si Ma Cai')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (560, 50, N'Huyện Bắc Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (561, 50, N'Huyện Bảo Thắng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (562, 50, N'Huyện Bảo Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (563, 50, N'Huyện Sa Pa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (564, 50, N'Huyện Văn Bàn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (565, 51, N'Thành phố Điện Biên Phủ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (566, 51, N'Thị Xã Mường Lay')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (567, 51, N'Huyện Mường Nhé')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (568, 51, N'Huyện Mường Chà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (569, 52, N'Thành phố Hải Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (570, 52, N'Thị xã Chí Linh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (571, 52, N'Huyện Nam Sách')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (572, 52, N'Huyện Kinh Môn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (573, 52, N'Huyện Kim Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (574, 52, N'Huyện Thanh Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (575, 52, N'Huyện Cẩm Giàng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (576, 52, N'Huyện Bình Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (577, 52, N'Huyện Gia Lộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (578, 52, N'Huyện Tứ Kỳ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (579, 52, N'Huyện Ninh Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (580, 52, N'Huyện Thanh Miện')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (581, 53, N'Quận Hồng Bàng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (582, 53, N'Quận Ngô Quyền')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (583, 53, N'Quận Lê Chân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (584, 53, N'Quận Hải An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (585, 53, N'Quận Kiến An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (586, 53, N'Quận Đồ Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (587, 53, N'Quận Dương Kinh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (588, 53, N'Huyện Thuỷ Nguyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (589, 53, N'Huyện An Dương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (590, 53, N'Huyện An Lão')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (591, 53, N'Huyện Kiến Thuỵ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (592, 53, N'Huyện Tiên Lãng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (593, 53, N'Huyện Vĩnh Bảo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (594, 53, N'Huyện Cát Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (595, 53, N'Huyện Bạch Long Vĩ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (596, 54, N'Thành phố Hưng Yên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (597, 54, N'Huyện Văn Lâm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (598, 54, N'Huyện Văn Giang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (599, 54, N'Huyện Yên Mỹ')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (600, 54, N'Huyện Mỹ Hào')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (601, 54, N'Huyện Ân Thi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (602, 54, N'Huyện Khoái Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (603, 54, N'Huyện Kim Động')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (604, 54, N'Huyện Tiên Lữ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (605, 54, N'Huyện Phù Cừ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (606, 55, N'Thành phố Thái Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (607, 55, N'Huyện Quỳnh Phụ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (608, 55, N'Huyện Hưng Hà')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (609, 63, N'Huyện Ba Tri')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (610, 63, N'Huyện Thạnh Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (611, 63, N'Huyện Mỏ Cày Bắc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (612, 56, N'Thành phố Trà Vinh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (613, 56, N'Huyện Càng Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (614, 56, N'Huyện Cầu Kè')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (615, 56, N'Huyện Tiểu Cần')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (616, 56, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (617, 56, N'Huyện Cầu Ngang')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (618, 56, N'Huyện Trà Cú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (619, 56, N'Huyện Duyên Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (620, 56, N'Thị xã Duyên Hải')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (621, 57, N'Thành phố Vĩnh Long')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (622, 57, N'Huyện Long Hồ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (623, 57, N'Huyện Mang Thít')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (624, 57, N'Huyện  Vũng Liêm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (625, 57, N'Huyện Tam Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (626, 57, N'Thị xã Bình Minh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (627, 57, N'Huyện Trà Ôn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (628, 57, N'Huyện Bình Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (629, 58, N'Thành phố Cao Lãnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (630, 58, N'Thành phố Sa Đéc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (631, 58, N'Thị xã Hồng Ngự')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (632, 58, N'Huyện Tân Hồng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (633, 58, N'Huyện Hồng Ngự')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (634, 58, N'Huyện Tam Nông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (635, 58, N'Huyện Tháp Mười')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (636, 58, N'Huyện Cao Lãnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (637, 58, N'Huyện Thanh Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (638, 58, N'Huyện Lấp Vò')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (639, 58, N'Huyện Lai Vung')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (640, 58, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (641, 59, N'Thành phố Long Xuyên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (642, 59, N'Thành phố Châu Đốc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (643, 59, N'Huyện An Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (644, 59, N'Thị xã Tân Châu')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (645, 59, N'Huyện Phú Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (646, 59, N'Huyện Châu Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (647, 59, N'Huyện Tịnh Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (648, 59, N'Huyện Tri Tôn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (649, 59, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (650, 59, N'Huyện Chợ Mới')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (651, 59, N'Huyện Thoại Sơn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (652, 60, N'Thành phố Rạch Giá')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (653, 60, N'Thị xã Hà Tiên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (654, 60, N'Huyện Kiên Lương')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (655, 60, N'Huyện Hòn Đất')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (656, 60, N'Huyện Tân Hiệp')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (657, 60, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (658, 60, N'Huyện Giồng Riềng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (659, 60, N'Huyện Gò Quao')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (660, 60, N'Huyện An Biên')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (661, 60, N'Huyện An Minh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (662, 60, N'Huyện Vĩnh Thuận')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (663, 60, N'Huyện Phú Quốc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (664, 18, N'Quận Tân Bình')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (665, 18, N'Quận Tân Phú')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (666, 18, N'Quận Phú Nhuận')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (667, 18, N'Quận 2')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (668, 18, N'Quận 3')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (669, 18, N'Quận 10')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (670, 18, N'Quận 11')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (671, 18, N'Quận 4')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (672, 18, N'Quận 5')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (673, 18, N'Quận 6')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (674, 18, N'Quận 8')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (675, 18, N'Quận Bình Tân')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (676, 18, N'Quận 7')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (677, 18, N'Huyện Củ Chi')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (678, 18, N'Huyện Hóc Môn')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (679, 18, N'Huyện Bình Chánh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (680, 18, N'Huyện Nhà Bè')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (681, 18, N'Huyện Cần Giờ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (682, 61, N'Thành phố Tân An')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (683, 61, N'Thị xã Kiến Tường')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (684, 61, N'Huyện Tân Hưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (685, 61, N'Huyện Vĩnh Hưng')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (686, 61, N'Huyện Mộc Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (687, 61, N'Huyện Tân Thạnh')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (688, 61, N'Huyện Thạnh Hóa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (689, 61, N'Huyện Đức Huệ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (690, 61, N'Huyện Đức Hòa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (691, 61, N'Huyện Bến Lức')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (692, 61, N'Huyện Thủ Thừa')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (693, 61, N'Huyện Tân Trụ')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (694, 61, N'Huyện Cần Đước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (695, 61, N'Huyện Cần Giuộc')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (696, 61, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (697, 62, N'Thành phố Mỹ Tho')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (698, 62, N'Thị xã Gò Công')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (699, 62, N'Thị xã Cai Lậy')
GO
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (700, 62, N'Huyện Tân Phước')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (701, 62, N'Huyện Cái Bè')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (702, 62, N'Huyện Cai Lậy')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (703, 62, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (704, 62, N'Huyện Chợ Gạo')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (705, 62, N'Huyện Gò Công Tây')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (706, 62, N'Huyện Gò Công Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (707, 62, N'Huyện Tân Phú Đông')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (708, 63, N'Thành phố Bến Tre')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (709, 63, N'Huyện Châu Thành')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (710, 63, N'Huyện Chợ Lách')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (711, 63, N'Huyện Mỏ Cày Nam')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (712, 63, N'Huyện Giồng Trôm')
INSERT [dbo].[District] ([DistrictID], [ProvinceID], [DistrictName]) VALUES (713, 63, N'Huyện Bình Đại')
SET IDENTITY_INSERT [dbo].[District] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [userID], [provinceID], [districtID], [address], [phone], [status], [images], [creatAt], [description], [name], [shortDes], [thumb]) VALUES (9, 2, 1, 1, N'46 Ấu Triệu, Phường Hàng Trống', N'123456789                                         ', 1, NULL, CAST(N'2018-12-20' AS Date), N'Nhân viên khách sạn rất thân thiện và nhiệt tình, phòng sạch sẽ, giá cả phù hợp chưa kể vị trí thì thuận lợi. Nói chung tốt đó các bạn ạ', N'Khách sạn Church Legend Hà Nội', NULL, N'~\images\hotel\thumb\1.PNG')
INSERT [dbo].[Hotel] ([id], [userID], [provinceID], [districtID], [address], [phone], [status], [images], [creatAt], [description], [name], [shortDes], [thumb]) VALUES (11, 2, 1, 2, N'56 Hàng Đậu, Đồng Xuân', N'123456789                                         ', 1, NULL, CAST(N'2018-12-20' AS Date), N'Phòng mới, sạch đẹp, thái độ nhân viên thân thiện. Bữa sáng rất ngon. Tôi rất hài lòng.', N'Khách sạn Hanoi Genial', NULL, N'~\images\hotel\thumb\2.PNG')
INSERT [dbo].[Hotel] ([id], [userID], [provinceID], [districtID], [address], [phone], [status], [images], [creatAt], [description], [name], [shortDes], [thumb]) VALUES (12, 2, 2, 615, N'20 Hàng Cân, Hàng Đào', N'123456789                                         ', 1, NULL, CAST(N'2018-12-20' AS Date), N'Nhân viên dễ thương, thân thiện, phòng sạch sẽ. Ngay trung tâm phố cổ nên rất tiệ', N'Zesty Hotel', NULL, N'~\images\hotel\thumb\3.PNG')
INSERT [dbo].[Hotel] ([id], [userID], [provinceID], [districtID], [address], [phone], [status], [images], [creatAt], [description], [name], [shortDes], [thumb]) VALUES (13, 2, 2, 614, N'20 Hàng Đan, Hàng Đào', N'1234567789                                        ', 1, NULL, CAST(N'2018-12-20' AS Date), N' phòng sạch sẽ. Ngay trung tâm phố cổ nên rất tiện', N'The Queen Hotel & Spa', NULL, N'~\images\hotel\thumb\4.PNG')
INSERT [dbo].[Hotel] ([id], [userID], [provinceID], [districtID], [address], [phone], [status], [images], [creatAt], [description], [name], [shortDes], [thumb]) VALUES (14, 2, 44, 496, N'Cây 5 gần ủy ban nhân dân', N'123456789                                         ', 1, N'~/images/hotel/ks-anh-dao.jpg,', CAST(N'2018-12-20' AS Date), N'<p>Kh&aacute;ch sạn xanh sạch đẹp</p>
', N'Khách sạn anh đào', N'Khách sạn xanh sạch đẹp', N'~/images/hotel/thumb/ks-anh-dao.jpg')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (1, N'Thành phố Hà Nội')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (2, N'Tỉnh Hà Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (3, N'Tỉnh Kon Tum')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (4, N'Tỉnh Gia Lai')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (5, N'Tỉnh Đắk Lắk')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (6, N'Tỉnh Đắk Nông')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (7, N'Tỉnh Lâm Đồng')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (8, N'Tỉnh Bình Định')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (9, N'Tỉnh Phú Yên')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (10, N'Tỉnh Khánh Hòa')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (11, N'Tỉnh Ninh Thuận')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (12, N'Tỉnh Bình Thuận')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (13, N'Tỉnh Bình Phước')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (14, N'Tỉnh Tây Ninh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (15, N'Tỉnh Bình Dương')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (16, N'Tỉnh Đồng Nai')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (17, N'Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (18, N'Thành phố Hồ Chí Minh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (19, N'Tỉnh Quảng Trị')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (20, N'Tỉnh Thừa Thiên Huế')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (21, N'Thành phố Đà Nẵng')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (22, N'Tỉnh Quảng Nam')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (23, N'Tỉnh Quảng Ngãi')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (24, N'Tỉnh Hà Tĩnh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (25, N'Tỉnh Quảng Bình')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (26, N'Tỉnh Nghệ An')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (27, N'Tỉnh Hà Nam')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (28, N'Tỉnh Nam Định')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (29, N'Tỉnh Ninh Bình')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (30, N'Tỉnh Thanh Hóa')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (31, N'Thành phố Cần Thơ')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (32, N'Tỉnh Hậu Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (33, N'Tỉnh Sóc Trăng')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (34, N'Tỉnh Bạc Liêu')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (35, N'Tỉnh Cà Mau')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (36, N'Tỉnh Thái Nguyên')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (37, N'Tỉnh Lạng Sơn')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (38, N'Tỉnh Quảng Ninh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (39, N'Tỉnh Bắc Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (40, N'Tỉnh Lai Châu')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (41, N'Tỉnh Sơn La')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (42, N'Tỉnh Yên Bái')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (43, N'Tỉnh Hoà Bình')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (44, N'Tỉnh Phú Thọ')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (45, N'Tỉnh Vĩnh Phúc')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (46, N'Tỉnh Bắc Ninh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (47, N'Tỉnh Cao Bằng')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (48, N'Tỉnh Bắc Kạn')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (49, N'Tỉnh Tuyên Quang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (50, N'Tỉnh Lào Cai')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (51, N'Tỉnh Điện Biên')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (52, N'Tỉnh Hải Dương')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (53, N'Thành phố Hải Phòng')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (54, N'Tỉnh Hưng Yên')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (55, N'Tỉnh Thái Bình')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (56, N'Tỉnh Trà Vinh')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (57, N'Tỉnh Vĩnh Long')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (58, N'Tỉnh Đồng Tháp')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (59, N'Tỉnh An Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (60, N'Tỉnh Kiên Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (61, N'Tỉnh Long An')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (62, N'Tỉnh Tiền Giang')
INSERT [dbo].[Province] ([ProvinceID], [ProvinceName]) VALUES (63, N'Tỉnh Bến Tre')
SET IDENTITY_INSERT [dbo].[Province] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (9, N'Phòng thường', 9, 1, NULL, 50000, N'Sạch sẽ, nhân viên thân thiện chu đáo, đồ ăn sáng ổn, dịch vụ rất tuyệt', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\1.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (10, N'Phòng vip', 9, 1, NULL, 70000, N'Phòng đẹp, nhân viên thân thiện', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\2.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (11, N'Phòng thường', 11, 1, NULL, 30000, N'Phòng đẹp, thoáng mát', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\3.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (12, N'Phòng vip', 11, 1, NULL, 40000, N'Phòng đẹp, nhân viên thân thiện', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\4.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (13, N'Phòng thường', 12, 1, NULL, 45000, N'Phòng đẹp, thoáng mát', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\5.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (14, N'Phòng vip', 12, 1, NULL, 50000, N'Phòng đẹp, thoáng mát', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\6.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (15, N'Phòng thường', 13, 1, NULL, 35000, N'Phòng đẹp, nhân viên thân thiện', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\7.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (16, N'Phòng vip', 13, 1, NULL, 80000, N'Phòng đẹp, thoáng mát', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\8.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (17, N'Phòng thường', 13, 1, NULL, 90000, N'Phòng đẹp, nhân viên thân thiện', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\9.PNG')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (18, N'Phòng chất lượng cao', 14, 1, N'images/room/khach-san-iris-can-tho.jpg,', 500000, N'<p>Ph&ograve;ng xanh sạch đẹp</p>
', CAST(N'2018-12-20' AS Date), N'~\images\room\thumb\khach-san-iris-can-tho.jpg')
INSERT [dbo].[Room] ([id], [name], [hotelID], [status], [images], [price], [description], [createAt], [thumb]) VALUES (19, N'Phòng giá bình dân', 14, 1, N'~/images/room/nh-phong-khach-s-n-marino.jpg,', 300000, N'<p>Ph&ograve;ng đầy đủ tiện nghi nước n&oacute;ng</p>
', CAST(N'2018-12-20' AS Date), N'~/images/room/thumb/nh-phong-khach-s-n-marino.jpg')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [provinceID], [districtID], [address], [role], [cmt], [phone], [status], [createAt]) VALUES (2, N'long                                              ', N'123456                                            ', 1, 1, N'test địa  chỉ', 2, N'033097000404   ', N'0386000635     ', 1, CAST(N'2018-12-05' AS Date))
INSERT [dbo].[User] ([id], [email], [password], [provinceID], [districtID], [address], [role], [cmt], [phone], [status], [createAt]) VALUES (3, N'user                                              ', N'123456                                            ', 2, 2, N'địa chỉ', 3, N'0123456789     ', N'0123456789     ', 1, CAST(N'2018-12-05' AS Date))
INSERT [dbo].[User] ([id], [email], [password], [provinceID], [districtID], [address], [role], [cmt], [phone], [status], [createAt]) VALUES (4, N'admin                                             ', N'123456                                            ', 3, 3, N'địa chỉ', 1, N'123456789      ', N'123456789      ', 1, CAST(N'2018-12-18' AS Date))
INSERT [dbo].[User] ([id], [email], [password], [provinceID], [districtID], [address], [role], [cmt], [phone], [status], [createAt]) VALUES (5, N'vector0011.dev@gmail.com                          ', N'123456                                            ', 1, 19, N'Ngách 132/81, đường 32', 2, N'132228138      ', N'0981361681     ', 1, CAST(N'2018-12-21' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Booking] ADD  CONSTRAINT [DF_Bookings_creatAt]  DEFAULT (getdate()) FOR [creatAt]
GO
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_creatAt]  DEFAULT (getdate()) FOR [creatAt]
GO
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [DF_Rooms_createAt]  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Users_createAt]  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([districtID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([provinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Hotel] FOREIGN KEY([id])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Hotel]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([districtID])
REFERENCES [dbo].[District] ([DistrictID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([provinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
USE [master]
GO
ALTER DATABASE [QLKhachSan] SET  READ_WRITE 
GO
