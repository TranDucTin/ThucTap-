CREATE DATABASE QUANLYDOANVIEN

use QUANLYDOANVIEN
go

create table Student
(
	MaSV char(10) primary key not null,
	HoTen nvarchar(50) not null,
	GioiTinh nvarchar(10) null,
	NgaySinh datetime null,
	NgayVaoDoan datetime null,
	DienThoai char(14) null,
	DiaChi nvarchar(50) null,
	ChucVu nvarchar(50) null,
	SoDoan bit not null,
	SinhHoat bit not null,
	DoanPhi int not null,
	MaLop char(10) not null,
	MaXa char(10) not null,
	MaKH char(10) not null,
)
ALTER TABLE Student ADD CONSTRAINT Xa_Student FOREIGN KEY (MaXa) REFERENCES Xa(MaXa);
ALTER TABLE Student ADD CONSTRAINT KhoaHoc_Student FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH);
ALTER TABLE Student ADD CONSTRAINT Lop_Student FOREIGN KEY (MaLop) REFERENCES Lop(MaLop);

ALTER TABLE dbo.Student DROP CONSTRAINT KhoaHoc_Student 

create table Xa
(
	MaXa char(10) primary key not null,
	TenXa nvarchar(100) not null,
	type nvarchar(30) not null,
	MaHuyen char(10) not null,
)
ALTER TABLE Xa ADD CONSTRAINT Huyen_Xa FOREIGN KEY (MaHuyen) REFERENCES Huyen(MaHuyen);


create table Huyen
(
	MaHuyen char(10) primary key not null,
	TenHuyen nvarchar(100) not null,
	type nvarchar(30) not null,
	MaTinh char(10) not null
)
ALTER TABLE Huyen ADD CONSTRAINT Tinh_Huyen FOREIGN KEY (MaTinh) REFERENCES Tinh(MaTinh);


create table Tinh
(
	MaTinh char(10) primary key not null,
	TenTinh nvarchar(100) not null,
	type nvarchar(30) not null
)

create table KhoaHoc
(
	MaKH char(10) primary key not null,
	TenKH nvarchar(50) not null,
	LastCode int not null, 
)
ALTER TABLE KhoaHoc ADD CONSTRAINT KhoaHoc_Student FOREIGN KEY (MaKH) REFERENCES Student(MaKH);



create table Lop
(
	MaLop char(10) primary key not null,
	TenLop nvarchar(50)  not null,
	MaNganh char(10)  not null,
)
ALTER TABLE Lop ADD CONSTRAINT NganhHoc_Lop FOREIGN KEY (MaNganh) REFERENCES NganhHoc(MaNganh);

create table NganhHoc
(
	MaNganh char(10) primary key not null,
	TenNganh nvarchar(50) not null,
	MaKhoa char(10) not null,
)
ALTER TABLE NganhHoc ADD CONSTRAINT Khoa_NganhHoc FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa);


create table Khoa
(
	MaKhoa char(10) primary key not null,
	TenKhoa nvarchar(50) not null,
)

create table [User]
(
	MaUser char	(10) primary key not null,
	Username varchar(50) not null,
	Password varchar(50) not null,
	Name nvarchar(50) not null,
	MaKhoa char(10) not null,
	MaRole char(10) not null,
)
ALTER TABLE dbo.[User] ADD CONSTRAINT Khoa_User FOREIGN KEY (MaKhoa) REFERENCES dbo.Khoa(MaKhoa);
ALTER TABLE dbo.[User] ADD CONSTRAINT Role_User FOREIGN KEY (MaRole) REFERENCES dbo.Role(MaRole);



create table Role	
(
	MaRole char(10) primary key not null,
	TenRole nvarchar(50) not null,
)

create table Permission
(
	MaPMS char(10) primary key not null,
	TenPMS nvarchar(50) not null,
)
create table PhanQuyen
(
	MaRole char(10) not null,
	MaPMS char(10) not null,
	primary key (MaRole, MaPMS),
)
ALTER TABLE Phanquyen ADD CONSTRAINT Permission_PhanQuyen FOREIGN KEY (MaRole) REFERENCES [Role](MaRole);
ALTER TABLE Phanquyen ADD CONSTRAINT Role_PhanQuyen FOREIGN KEY (MaPMS) REFERENCES Permission(MaPMS);

/*du lieu vao */
INSERT INTO Student (MaSV, HoTen, GioiTinh, NgaySinh, NgayVaoDoan, DienThoai, DiaChi, ChucVu, SoDoan, SinhHoat, DoanPhi, MaLop, MaXa, MaKH)
VALUES
('SV001', 'Nguyễn Lê Anh Như', 'Nữ', '1999-01-01', '2018-09-01', '0123456789', '123 Nguyễn Trãi', 'Bí Thư', 1, 1, 5000, 'LP001', 'XA001', 'KHOA001'),
('SV002', 'Trần Đức Tín', 'Nam', '2000-02-02', '2019-09-01', '0987654321', '456 Lê Lợi', 'Phó Bí Thư', 1, 1, 5000, 'LP002', 'XA002', 'KHOA002'),
('SV003', 'Le Quốc Cường', 'Nam', '1998-03-03', '2017-09-01', '0369852147', '789 Nguyễn Huệ', 'Thành viên', 0, 1, 50000, 'LP003', 'XA003', 'KHOA001');
GO

INSERT INTO Xa (MaXa, TenXa, type, MaHuyen)
VALUES
('XA001', 'Xã A', 'Thị trấn', 'HUYEN001'),
('XA002', 'Xã B', 'Thị trấn', 'HUYEN001'),
('XA003', 'Xã C', 'Nông thôn', 'HUYEN002'),
('XA004', 'Xã D', 'Nông thôn', 'HUYEN002');


INSERT INTO Huyen (MaHuyen, TenHuyen, type, MaTinh)
VALUES
('HUYEN001', 'Huyện A', 'Thị xã', 'TINH001'),
('HUYEN002', 'Huyện B', 'Thị xã', 'TINH001'),
('HUYEN003', 'Huyện C', 'Nông thôn', 'TINH002'),
('HUYEN004', 'Huyện D', 'Nông thôn', 'TINH002');


INSERT INTO Tinh (MaTinh, TenTinh, type)
VALUES
('TINH001', 'Tỉnh A', 'Miền Trung'),
('TINH002', 'Tỉnh B', 'Miền Nam'),
('TINH003', 'Tỉnh C', 'Miền Bắc');
GO

INSERT INTO KhoaHoc (MaKH, TenKH, LastCode)
VALUES
('KH001', 'Khóa học A', 100),
('KH002', 'Khóa học B', 200),
('KH003', 'Khóa học C', 300);


INSERT INTO Lop (MaLop, TenLop, MaNganh)
VALUES
('LP001', 'Lớp A1', 'NGANH001'),
('LP002', 'Lớp B2', 'NGANH002'),
('LP003', 'Lớp C3', 'NGANH003');


INSERT INTO NganhHoc (MaNganh, TenNganh, MaKhoa)
VALUES
('NGANH001', 'Ngành học A', 'KHOA001'),
('NGANH002', 'Ngành học B', 'KHOA002'),
('NGANH003', 'Ngành học C', 'KHOA003');


INSERT INTO Khoa (MaKhoa, TenKhoa)
VALUES
('KHOA001', 'Khoa A'),
('KHOA002', 'Khoa B'),
('KHOA003', 'Khoa C');


INSERT INTO [User] (MaUser, Username, Password, Name, MaKhoa, MaRole)
VALUES
('U001', 'anhnhu', 'anhnhu123', N'Anh Như', 'KHOA001', 'Role001'),
('U002', 'ductin', 'ductin123', N'Đức Tín', 'KHOA002', 'Role002'),
('U003', 'quoccuong', 'quoccuong123', N'Quốc Cường', 'KHOA003', 'Role0003');


INSERT INTO Permission (MaPMS, TenPMS)
VALUES
('PMS001', N'Cập nhật quyền'),
('PMS002', N'Phân quyền'),
('PMS003', N'Xem thông tin tài khoản'),
('PMS004', N'Quản lý tài khoản'),
('PMS005', N'Chuyển sinh hoạt'),
('PMS006', N'Đoàn phí'),
('PMS007', N'Quản lý đoàn viên'),
('PMS008', N'Sửa thông tin đoàn viên'),
('PMS009', N'Thêm đoàn viên'),
('PMS010', N'Tìm kiếm đoàn viên'),
('PMS011', N'Xóa đoàn viên'),
('PMS012', N'Quản lý Khoa'),
('PMS013', N'Sửa thông tin Khoa'),
('PMS014', N'Thêm đoàn Khoa'),
('PMS016', N'Xóa đoàn Khoa'),
('PMS017', N'Quản lý Khóa học'),
('PMS018', N'Sửa thông tin Khóa học'),
('PMS019', N'Thêm đoàn Khóa học'),
('PMS020', N'Xóa đoàn Khóa học'),
('PMS021', N'Quản lý Lớp học'),
('PMS022', N'Sửa thông tin Lớp học'),
('PMS023', N'Thêm đoàn Lớp học'),
('PMS024', N'Xóa đoàn Lớp học'),
('PMS025', N'Quản lý Ngành '),
('PMS026', N'Sửa thông tin Ngành'),
('PMS027', N'Thêm đoàn Ngành'),
('PMS028', N'Xóa đoàn Ngành');


INSERT INTO PhanQuyen (MaRole, MaPMS)
VALUES
('Role001', 'PMS001'),
('Role001', 'PMS002'),
('Role001', 'PMS003'),
('Role001', 'PMS004'),
('Role001', 'PMS005'),
('Role001', 'PMS006'),
('Role001', 'PMS007'),
('Role001', 'PMS008'),
('Role001', 'PMS009'),
('Role001', 'PMS010'),
('Role001', 'PMS011'),
('Role001', 'PMS012'),
('Role001', 'PMS013'),
('Role001', 'PMS014'),
('Role001', 'PMS015'),
('Role001', 'PMS016'),
('Role001', 'PMS017'),
('Role001', 'PMS018'),
('Role001', 'PMS019'),
('Role001', 'PMS020'),
('Role001', 'PMS021'),
('Role001', 'PMS022'),
('Role001', 'PMS023'),
('Role001', 'PMS024'),
('Role001', 'PMS025'),
('Role001', 'PMS026'),
('Role001', 'PMS027'),
('Role001', 'PMS028'),
('Role002', 'PMS001'),
('Role002', 'PMS002'),
('Role002', 'PMS003'),
('Role002', 'PMS004'),
('Role002', 'PMS005'),
('Role002', 'PMS006'),
('Role002', 'PMS007'),
('Role002', 'PMS008'),
('Role002', 'PMS009'),
('Role002', 'PMS010'),
('Role002', 'PMS011'),
('Role002', 'PMS012'),
('Role002', 'PMS013'),
('Role002', 'PMS014'),
('Role002', 'PMS015'),
('Role002', 'PMS016'),
('Role002', 'PMS017'),
('Role002', 'PMS018'),
('Role002', 'PMS019'),
('Role002', 'PMS020'),
('Role002', 'PMS021'),
('Role002', 'PMS022'),
('Role002', 'PMS023'),
('Role002', 'PMS024'),
('Role002', 'PMS025'),
('Role002', 'PMS026'),
('Role002', 'PMS027'),
('Role002', 'PMS028'),
('Role003', 'PMS017'),
('Role003', 'PMS018'),
('Role003', 'PMS019'),
('Role003', 'PMS020');


INSERT INTO Role (MaRole, TenRole)
VALUES
('Role001', N'Bí thư đoàn trường'),
('Role002',N'Bí thư đoàn khoa'),
('Role003', N'Bí thư đoàn lớp');



select * from dbo.Student