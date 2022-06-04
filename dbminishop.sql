USE master
GO
CREATE DATABASE dbminishop;
GO
USE dbminishop;
GO
CREATE TABLE ChucVu(
	MaChucVu INT IDENTITY(1,1),
    TenChucVu NVARCHAR(50),
    PRIMARY KEY(MaChucVu)
);

CREATE TABLE NhanVien(
	NhanVien INT IDENTITY(1,1),
    HoTen NVARCHAR(50),
    DiaChi NVARCHAR(100),
    GioiTinh nvarchar(50),
    Cmnd NVARCHAR(20),
    SoDT VARCHAR(12),
    MaChucVu INT,
    Email VARCHAR(50),
    TenDangNhap VARCHAR(50),
    MatKhau VARCHAR(50),
    PRIMARY KEY(NhanVien),
    CONSTRAINT FK_ChucVu FOREIGN KEY(MaChucVu) REFERENCES ChucVu(MaChucVu)

);

CREATE TABLE DanhMucSanPham(
	MaDanhMuc INT IDENTITY(1,1),
    TenDanhMuc NVARCHAR(100),
    HinhDanhMuc VARCHAR(max),
    PRIMARY KEY(MaDanhMuc)

);

CREATE TABLE NhanHang(
	MaNhanHang INT IDENTITY(1,1),
    TenNhanHang NVARCHAR(100),
    HinhNhanHang VARCHAR(max),
    PRIMARY KEY(MaNhanHang)

);

CREATE TABLE SanPham(
	MaSanPham INT IDENTITY(1,1),
    MaDanhMuc INT,
	MaNhanHang INT,
    TenSanPham NVARCHAR(100),
    GiaTien VARCHAR(50),
    MoTa VARCHAR(max),
    HinhSanPham VARCHAR(max),
    PRIMARY KEY(MaSanPham),
    CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham(MaDanhMuc),
	CONSTRAINT FK_SanPham_NhanHang FOREIGN KEY (MaNhanHang) REFERENCES NhanHang(MaNhanHang)
);

CREATE TABLE MauSanPham(
	 MaMau INT IDENTITY(1,1),
     TenMau NVARCHAR(50),
     PRIMARY KEY(MaMau)
);

CREATE TABLE SizeSanPham(
MaSize INT IDENTITY(1,1),
Size NVARCHAR(20),
PRIMARY KEY(MaSize)
);

CREATE TABLE ChiTietSanPham(
MaChiTietSanPham INT IDENTITY(1,1),
MaSanPham INT,
MaSize INT,
MaMau INT,
SoLuong INT,
NgayNhap NVARCHAR(50),
PRIMARY KEY(MaChiTietSanPham),
CONSTRAINT FK_CHITET_SanPham FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
CONSTRAINT FK_ChiTiet_Size FOREIGN KEY(MaSize) REFERENCES SizeSanPham(MaSize),
CONSTRAINT FK_ChiTiet_Mau FOREIGN KEY(MaMau) REFERENCES MauSanPham(MaMau)

);

CREATE TABLE KhuyenMai(
MaKhuyenMai INT IDENTITY(1,1),
TenKhuyenMai NVARCHAR(200),
ThoiGianBatDau NVARCHAR(50),
ThoiGianKetThuc NVARCHAR(50),
MoTa VARCHAR(max),
HinhKhuyenMai VARCHAR(max),
GiaGiam INT,
PRIMARY KEY(MaKhuyenMai)
);

CREATE TABLE ChiTietKhuyenMai(
MaKhuyenMai INT,
MaSanPham INT,

PRIMARY KEY(MaKhuyenMai,MaSanPham),
CONSTRAINT FK_CTKM FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham),
CONSTRAINT FK_CTKM1 FOREIGN KEY(MaKhuyenMai)REFERENCES KhuyenMai(MaKhuyenMai)
);

CREATE TABLE HoaDon(
MaHoaDon INT IDENTITY(1,1),
TenKhachHang NVARCHAR(100),
SoDT CHAR(12),
DiaChiGiaoHang NVARCHAR(200),
TinhTrang binary,
NgayLap VARCHAR(50),
PRIMARY KEY(MaHoaDon)
);

CREATE TABLE ChiTietHoaDon(
 MaHoaDon INT,
 MaChiTietSanPham INT,
 SoLuong INT,
 GiaTien VARCHAR(100),
 PRIMARY KEY(MaHoaDon,MaChiTietSanPham),
 CONSTRAINT FK_CTHD FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
 CONSTRAINT FK_CTSP FOREIGN KEY (MaChiTietSanPham) REFERENCES ChiTietSanPham(MaChiTietSanPham)
);
