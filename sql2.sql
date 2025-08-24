use QLKHOHANG;
go
insert into LOAIHANG values
	(1, N'Điện tử', N'Thiết bị điện tử'),
	(2, N'Thực phẩm', N'Đồ ăn, thức uống'),
	(3, N'Mỹ phẩm', N'Sản phẩm chăm sóc da'),
	(4, N'Trong nhà', N'Vật dụng nội thất'),
	(5, N'Dụng cụ học tập', N'Dành cho học sinh, sinh viên');
insert into NHACUNGCAP values
	(1, N'Công ty A', N'Hà Nội', 123456789, N'a@example.com'),
	(2, N'Công ty B', N'Hồ Chí Minh', 987654321, N'b@example.com'),
	(3, N'Công ty C', N'Đà Nẵng', 112233445, N'c@example.com'),
	(4, N'Công ty D', N'Cần Thơ', 556677889, N'd@example.com'),
	(5, N'Công ty E', N'Huế', 101010101, N'e@example.com');
insert into HANGHOA values
	(101, N'Laptop', N'Cái', 20, '2025-01-10', 18000000, 1, 1),
	(102, N'Nước suối', N'Chai', 200, '2025-02-01', 5000, 2, 2),
	(103, N'Son môi', N'Cây', 50, '2025-03-01', 250000, 3, 3),
	(104, N'Bàn học', N'Cái', 15, '2025-04-01', 1500000, 4, 4),
	(105, N'Bút bi', N'Cây', 500, '2025-05-01', 4000, 5, 5);
insert into NHANVIEN values
	(1, N'Nguyễn Văn A', N'Quản lý kho', N'Kho trung tâm', 111222333),
	(2, N'Trần Thị B', N'Nhân viên', N'Kho A', 222333444),
	(3, N'Lê Văn C', N'Nhân viên', N'Kho B', 333444555),
	(4, N'Phạm Thị D', N'Kế toán', N'Tài chính', 444555666),
	(5, N'Hồ Văn E', N'Bảo vệ', N'An ninh', 555666777);
insert into KHO values
	(1, N'Kho trung tâm', N'Hà Nội', 10000),
	(2, N'Kho miền Nam', N'Hồ Chí Minh', 8000),
	(3, N'Kho miền Trung', N'Đà Nẵng', 6000),
	(4, N'Kho miền Bắc', N'Hải Phòng', 4000),
	(5, N'Kho phụ A', N'Bắc Ninh', 2000);
insert into CHUONGTRINH values
	(1, N'Tri ân khách hàng', '2025-01-01', '2025-01-31', N'Hà Nội', N'Khuyến mãi đầu năm'),
	(2, N'Giảm giá hè', '2025-06-01', '2025-06-30', N'Đà Nẵng', N'Tăng doanh số hè'),
	(3, N'Ngày hội mua sắm', '2025-03-15', '2025-03-17', N'Hồ Chí Minh', N'Thu hút khách hàng mới'),
	(4, N'Back to School', '2025-08-01', '2025-08-31', N'Toàn quốc', N'Tập trung học sinh'),
	(5, N'Siêu sale cuối năm', '2025-12-01', '2025-12-31', N'Hà Nội', N'Xả kho cuối năm');
insert into HANGHOA_CHUONGTRINH values
	(101, 1, N'Khuyến mãi', N'Giảm 10%'),
	(102, 2, N'Trưng bày', N'Hình ảnh đẹp'),
	(103, 3, N'Mẫu thử', N'Khách hàng thích thú'),
	(104, 4, N'Sự kiện', N'Có quà tặng'),
	(105, 5, N'Giảm giá', N'Bán chạy');
insert into NHANVIEN_CHUONGTRINH values
	(1, 1, N'Tổ chức', N'Rất tích cực'),
	(2, 2, N'Phụ trách gian hàng', N'Nhiệt tình'),
	(3, 3, N'Hướng dẫn khách', N'Hiệu quả'),
	(4, 4, N'Thuyết trình', N'Ấn tượng'),
	(5, 5, N'Phát quà', N'Vui vẻ');
insert into HANGHOA_KHO values
	(101, 1, 10, '2025-06-01'),
	(102, 2, 50, '2025-06-01'),
	(103, 3, 30, '2025-06-01'),
	(104, 4, 15, '2025-06-01'),
	(105, 5, 100, '2025-06-01');
insert into NHANVIEN_KHO values
	(1, 1, '2024-01-01', N'Trưởng kho'),
	(2, 2, '2024-02-01', N'Thủ kho'),
	(3, 3, '2024-03-01', N'Nhập hàng'),
	(4, 4, '2024-04-01', N'Giám sát'),
	(5, 5, '2024-05-01', N'Kiểm kho');
-- 1. Cập nhật giá bán của sản phẩm MaHH = 105
update HANGHOA
set GiaBan = 4500
where MaHH = 105;
-- 2. Thay đổi tên nhà cung cấp MaNCC = 2
update NHACUNGCAP
set TenNCC = N'Công ty B Mới'
where MaNCC = 2;
-- 3. Cập nhật chức vụ nhân viên MaNV = 4
update NHANVIEN
set ChucVu = N'Trưởng phòng'
where MaNV = 4;
-- 4. Nhân viên mã 2 được gán vào chương trình mã 2
delete from HANGHOA_CHUONGTRINH
where MaHH = 2 and MaCT = 2;
-- 5. Xóa bản ghi hàng hóa mã 102 khỏi bảng trung gian lưu trữ kho
delete from HANGHOA_KHO
where MaHH = 102;
-- 6. Xóa chương trình có mã số 5 khỏi bảng chương trình
delete from HANGHOA_CHUONGTRINH
where MaCT = 5
delete from NHANVIEN_CHUONGTRINH
where MaCT = 5;
delete from CHUONGTRINH
where MaCT = 5;

select * from HANGHOA
select * from LOAIHANG
select * from NHACUNGCAP
select * from KHO
select * from NHANVIEN
select * from CHUONGTRINH
select * from HANGHOA_KHO
select * from HANGHOA_CHUONGTRINH
select * from NHANVIEN_KHO
select * from NHANVIEN_CHUONGTRINH
