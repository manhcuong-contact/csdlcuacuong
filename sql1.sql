use master;
go
if db_id('QLKHOHANG') is not null
begin
    alter database QLKHOHANG set single_user with rollback immediate;
    drop database QLKHOHANG;
end
CREATE DATABASE QLKHOHANG;
go
USE QLKHOHANG;
create table LOAIHANG (
    MaLoai int primary key, -- mã loại
    TenLoai nvarchar(60), -- tên loại hàng
    MoTa nvarchar(100) -- mô tả đặc điểm loại hàng
    );
create table NHACUNGCAP (
    MaNCC int primary key, -- mã nhà cung cấp
    TenNCC nvarchar(100), -- tên nhà cung cấp
    DiaChi nvarchar(100), -- địa chỉ
    SoDienThoai int, -- SĐT liên hệ
    Email nvarchar(100) -- email liên hệ
    );
create table HANGHOA (
    MaHH int primary key, -- mã hàng hóa
    TenHH nvarchar(30), -- tên hàng hóa
    DonViTinh nvarchar(10), -- đơn vị tính (kg, cái, hộp…)  
    SoLuongTon float, -- Số lượng tồn  
    NgayNhap date, -- Ngày nhập kho đầu tiên 
    GiaBan float, -- Giá bán
    MaLoai int references LOAIHANG(MaLoai), -- Mã loại hàng
    MaNCC int references NHACUNGCAP(MaNCC) -- Mã nhà cung cấp
    );
create table NHANVIEN (
    MaNV int primary key, -- Mã nhân viên 
    HoTen nvarchar(50), -- Họ tên  
    ChucVu nvarchar(30), -- Chức vụ (VD: Quản lý kho, nhân viên nhập kho…)
    BoPhan nvarchar(50), -- Bộ phận làm việc  
    SoDienThoai int -- SĐT liên lạc
    );
create table KHO (
    MaKho int primary key, -- Mã kho 
    TenKho nvarchar(50), -- Tên kho  
    DiaChi nvarchar(100), -- Địa chỉ kho  
    SucChuaToiDa float -- Sức chứa tối đa
    );
create table CHUONGTRINH (
    MaCT int primary key, -- Mã chương trình  
    TenCT nvarchar(100), -- Tên chương trình
    NgayBatDau date, -- Ngày bắt đầu
    NgayKetThuc date, --  Ngày kết thúc
    DiaDiem nvarchar(100), --  Địa điểm tổ chức
    MucTieu nvarchar(100) -- Mục tiêu / mô tả chương trình 
    );
create table HANGHOA_CHUONGTRINH ( 
    MaHH int references HANGHOA(MaHH), 
    MaCT int references CHUONGTRINH(MaCT),
    VaiTro nvarchar(50), -- Vai trò (trưng bày, khuyến mãi…)  
    DanhGia nvarchar(100) -- Đánh giá kết quả
    );
create table NHANVIEN_CHUONGTRINH (
    MaNV int references NHANVIEN(MaNV), 
    MaCT int references CHUONGTRINH(MaCT),
    NhiemVu nvarchar(50), -- Nhiệm vụ cụ thể
    GhiChu nvarchar(50) -- Nhận xét  
    );
create table HANGHOA_KHO (
    MaHH int references HANGHOA(MaHH),
    MaKho int references KHO(MaKho),
    SoLuong float, -- Số lượng lưu trữ tại kho
    NgayCapNhat date -- Ngày cập nhật tồn kho 
    );
create table NHANVIEN_KHO (
    MaNV int references NHANVIEN(MaNV),
    MaKho int references KHO(MaKho),
    NgayBatDau date, -- Ngày bắt đầu phụ trách 
    VaiTro nvarchar(50) -- Vai trò tại kho  
    );
