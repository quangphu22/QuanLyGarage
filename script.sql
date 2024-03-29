USE [master]
GO
/****** Object:  Database [QuanLyGarage]    Script Date: 6/24/2019 11:12:32 PM ******/
CREATE DATABASE [QuanLyGarage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Karaoke', FILENAME = N'E:\SQLServer\MSSQL14.MAHLAP\MSSQL\DATA\Karaoke.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Karaoke_log', FILENAME = N'E:\SQLServer\MSSQL14.MAHLAP\MSSQL\DATA\Karaoke_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyGarage] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyGarage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyGarage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyGarage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyGarage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyGarage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyGarage] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyGarage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyGarage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyGarage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyGarage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyGarage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyGarage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyGarage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyGarage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyGarage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyGarage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyGarage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyGarage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyGarage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyGarage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyGarage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyGarage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyGarage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyGarage] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyGarage] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyGarage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyGarage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyGarage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyGarage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyGarage] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyGarage', N'ON'
GO
ALTER DATABASE [QuanLyGarage] SET QUERY_STORE = OFF
GO
USE [QuanLyGarage]
GO
/****** Object:  Table [dbo].[CHITIETPHIEUSUACHUA]    Script Date: 6/24/2019 11:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUSUACHUA](
	[MaPhieuSuaChua] [int] NULL,
	[MaTC] [int] NULL,
	[MaPhuTung] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HIEUXE]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HIEUXE](
	[MaHX] [int] NOT NULL,
	[TenHieuXe] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] NOT NULL,
	[TenKH] [varchar](30) NULL,
	[DienThoai] [varchar](10) NULL,
	[DiaChi] [varchar](100) NULL,
	[TienNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHO]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHO](
	[MaPhuTung] [int] NOT NULL,
	[TenVatTuPhuTung] [varchar](30) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhuTung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUSUACHUA]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUSUACHUA](
	[MaPhieuSuaChua] [int] NOT NULL,
	[BienSo] [varchar](10) NULL,
	[MaKH] [int] NULL,
	[TienCong] [int] NULL,
	[TienPhuTung] [int] NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuSuaChua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaNhanVien] [nchar](3) NOT NULL,
	[HoTen] [varchar](40) NULL,
	[TenDangNhap] [varchar](20) NULL,
	[MatKhau] [varchar](20) NULL,
	[QuyenHan] [tinyint] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THAMSO]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAMSO](
	[MaThamSo] [varchar](5) NOT NULL,
	[TenThamSo] [varchar](50) NULL,
	[GiaTri] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThamSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIENCONG]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIENCONG](
	[MaTC] [int] NOT NULL,
	[TenTienCong] [varchar](100) NULL,
	[ChiPhi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XE]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[BienSo] [varchar](10) NOT NULL,
	[MaHX] [int] NULL,
	[MaKH] [int] NULL,
	[NgaySuaChua] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BienSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HIEUXE] ([MaHX], [TenHieuXe]) VALUES (1, N'Dream')
INSERT [dbo].[HIEUXE] ([MaHX], [TenHieuXe]) VALUES (2, N'Innova')
INSERT [dbo].[HIEUXE] ([MaHX], [TenHieuXe]) VALUES (3, N'Honda')
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DienThoai], [DiaChi], [TienNo]) VALUES (1, N'Tran Kim Trung', N'1', N'QN', 1000)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DienThoai], [DiaChi], [TienNo]) VALUES (2, N'Tran Thi Kim Dung', N'2', N'QN', 2000)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DienThoai], [DiaChi], [TienNo]) VALUES (3, N'Ta Thi Thu Lieu', N'3', N'QN', 3000)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DienThoai], [DiaChi], [TienNo]) VALUES (4, N'Tran Kim Ngoc', N'4', N'QN', 0)
INSERT [dbo].[TAIKHOAN] ([MaNhanVien], [HoTen], [TenDangNhap], [MatKhau], [QuyenHan]) VALUES (N'B01', N'Nguyen Van Boss', N'admin', N'1', 0)
INSERT [dbo].[TAIKHOAN] ([MaNhanVien], [HoTen], [TenDangNhap], [MatKhau], [QuyenHan]) VALUES (N'S01', N'Nguyen Thi Thu Ky', N'staff', N'2', 1)
INSERT [dbo].[THAMSO] ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS1', N'So hieu xe', 10)
INSERT [dbo].[THAMSO] ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS2', N'So xe sua chua toi da', 30)
INSERT [dbo].[THAMSO] ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS3', N'So loai vat tu', 200)
INSERT [dbo].[THAMSO] ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'TS4', N'So loai tien cong', 100)
INSERT [dbo].[XE] ([BienSo], [MaHX], [MaKH], [NgaySuaChua]) VALUES (N'8337', 1, 1, CAST(N'2019-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[XE] ([BienSo], [MaHX], [MaKH], [NgaySuaChua]) VALUES (N'8338', 2, 2, CAST(N'2019-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[XE] ([BienSo], [MaHX], [MaKH], [NgaySuaChua]) VALUES (N'8339', 3, 3, CAST(N'2019-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[XE] ([BienSo], [MaHX], [MaKH], [NgaySuaChua]) VALUES (N'8340', 3, 4, CAST(N'2019-03-02T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[CHITIETPHIEUSUACHUA]  WITH CHECK ADD FOREIGN KEY([MaPhieuSuaChua])
REFERENCES [dbo].[PHIEUSUACHUA] ([MaPhieuSuaChua])
GO
ALTER TABLE [dbo].[CHITIETPHIEUSUACHUA]  WITH CHECK ADD FOREIGN KEY([MaPhuTung])
REFERENCES [dbo].[KHO] ([MaPhuTung])
GO
ALTER TABLE [dbo].[CHITIETPHIEUSUACHUA]  WITH CHECK ADD FOREIGN KEY([MaTC])
REFERENCES [dbo].[TIENCONG] ([MaTC])
GO
ALTER TABLE [dbo].[PHIEUSUACHUA]  WITH CHECK ADD FOREIGN KEY([BienSo])
REFERENCES [dbo].[XE] ([BienSo])
GO
ALTER TABLE [dbo].[PHIEUSUACHUA]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD FOREIGN KEY([MaHX])
REFERENCES [dbo].[HIEUXE] ([MaHX])
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
/****** Object:  StoredProcedure [dbo].[ThemKhachHang]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemKhachHang]
	@TenKH varchar(30),
	@DienThoai varchar(10),
	@DiaChi varchar(100),
	@TienNo int
AS
BEGIN
	DECLARE @test int
	SELECT @test=COUNT(MaKH) FROM KHACHHANG WHERE (@TenKH = TenKH) and (@DienThoai = DienThoai) 
	if @test = 0
	BEGIN
		DECLARE @imakh int
		SELECT @imakh = MAX(MaKH) from KHACHHANG
		SET @imakh = @imakh + 1
		INSERT INTO KHACHHANG (MaKH, TenKH, DiaChi, DienThoai, TienNo) VALUES (@imakh, @TenKH, @DiaChi,@DienThoai, @TienNo)
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemXe]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemXe]
	@BienSo varchar(10) ,
	@HieuXe varchar(20),
	@MaKH int,
	@NgaySuaChua datetime
AS
BEGIN
	DECLARE @iMaHX int
	SELECT @iMaHX = MaHX from HIEUXE where @HieuXe = TenHieuXe
	INSERT INTO Xe (BienSo, MaHX, MaKH, NgaySuaChua) VALUES (@BienSo, @iMaHX, @MaKH,@NgaySuaChua)
END;
GO
/****** Object:  StoredProcedure [dbo].[USP_DangNhap]    Script Date: 6/24/2019 11:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DangNhap]
@TenDangNhap nvarchar(50), @MatKhau nvarchar(50)
AS
BEGIN
	SELECT * FROM dbo.TAIKHOAN WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyGarage] SET  READ_WRITE 
GO
