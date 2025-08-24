use QLKHOHANG;
go
--Câu 1: Lấy danh sách tất cả hàng hóa
select * from HANGHOA; 
--Câu 2:Liệt kê tên hàng hóa và giá bán của các mặt hàng có giá bán lớn hơn 100.000.
select TenHH, GiaBan from HANGHOA 
where GiaBan > 100000; 
--Câu 3:Tính tổng số lượng tồn của tất cả hàng hóa.
select sum(SoLuongTon) from HANGHOA; 
--Câu 4:Liệt kê họ tên và bộ phận của những nhân viên thuộc bộ phận "Kho trung tâm".
select HoTen, BoPhan from NHANVIEN 
where BoPhan = N'Kho trung tâm';
--Câu 5:Hiển thị toàn bộ thông tin hàng hóa, sắp xếp theo ngày nhập giảm dần.
select * from HANGHOA 
order by NgayNhap desc;
--Câu 6:Với mỗi loại hàng, hãy thống kê tổng số lượng tồn.
select MaLoai, sum(SoLuongTon) as tong_ton 
from HANGHOA
group by MaLoai;
--Câu 7:Với mỗi nhà cung cấp, đếm số mặt hàng cung cấp và chỉ lấy các nhà cung cấp có trên 2 mặt hàng.
select MaNCC, count(*) as so_mat_hang 
from HANGHOA
group by MaNCC
having count(*) > 2;
--Câu 8:Với mỗi loại hàng, tính giá bán trung bình và chỉ lấy các loại có giá trung bình lớn hơn 100.000.
select MaLoai, avg(GiaBan) as giatb 
from HANGHOA
group by MaLoai
having avg(GiaBan) > 100000;
--Câu 9:Liệt kê tên hàng hóa có giá bán cao nhất.
select TenHH 
from HANGHOA
where GiaBan = (select max(GiaBan) from HANGHOA);
--Câu 10:Với mỗi nhân viên, đếm số kho mà họ phụ trách và chỉ lấy những nhân viên phụ trách từ 2 kho trở lên.
select MaNV, count(*) as so_kho 
from NHANVIEN_KHO
group by MaNV
having count(*) >= 2;

--Câu 11:Lấy danh sách tất cả các nhà cung cấp
select * from NHACUNGCAP;
--Câu 12:Đếm tổng số mặt hàng trong kho
select count(MaHH) as TongMatHang 
from HANGHOA;
--Câu 13: Lấy danh sách các mặt hàng có số lượng tồn nhỏ hơn 50
select * from HANGHOA 
where SoLuongTon < 50;
--Câu 14:Lấy thông tin các nhân viên thuộc bộ phận Tài chính
select * from NHANVIEN 
where BoPhan = N'Tài chính';
--Câu 15:Lấy tên các bộ phận có nhiều hơn 2 nhân viên
select BoPhan, count(*) as SoNhanVien
from NHANVIEN
group by BoPhan
having count(*) > 2;
--Câu 16: Lấy tên nhà cung cấp và tổng số lượng hàng đã nhập từ mỗi nhà cung cấp
select t.TenNCC, sum(h.SoLuongTon) as TongSoLuong
from HANGHOA h inner join NHACUNGCAP t on h.MaNCC = t.MaNCC
group by t.TenNCC;
--Câu 17:Lấy tên nhân viên và số kho mà mỗi nhân viên quản lý, chỉ lấy những nhân viên quản lý nhiều hơn 1 kho
select n.HoTen, count(nk.MaKho) as SoKho
from NHANVIEN n inner join NHANVIEN_KHO nk on n.MaNV = nk.MaNV
group by n.HoTen
having count(nk.MaKho) > 1;
--Câu 18:Lấy danh sách các mặt hàng có giá bán lớn hơn giá bán trung bình, sắp xếp theo giá bán giảm dần
select * 
from HANGHOA
where GiaBan > (select avg(GiaBan) from HANGHOA)
order by GiaBan desc;
--Câu 19:Lấy tên các loại hàng mà tất cả các mặt hàng thuộc loại đó đều có giá bán tối thiểu phải trên 100,000
select l.TenLoai
from LOAIHANG l inner join HANGHOA h on l.MaLoai = h.MaLoai
group by l.TenLoai
having MIN(h.GiaBan) > 100000;
--Câu 20:Lấy tên các mặt hàng có số lượng tồn nhỏ hơn số lượng tồn trung bình của tất cả mặt hàng ( sắp xếp tăng dần)
select TenHH, SoLuongTon
from HANGHOA
where SoLuongTon < (select avg(SoLuongTon) from HANGHOA)
order by SoLuongTon asc;
