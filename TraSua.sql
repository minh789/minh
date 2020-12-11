CREATE DATABASE MilkTeaShop 
GO

USE MilkTeaShop
GO
---------------------------
--MilkTea
-- Menu 
-- TableOfGuest
--Bill
--DetailBill
--Acount
--Barn 
--Materials
----------------------------

CREATE TABLE TableOfGuest
(
	IdTable INT IDENTITY PRIMARY KEY ,
	NameTable NVARCHAR (50) NOT NULL DEFAULT N'Bàn chưa có tên',
	StatusTable NVARCHAR (50) NOT NULL DEFAULT N'Trống' --Trống || Có người 
)
GO

CREATE TABLE Menu
(
	IdCategory INT IDENTITY PRIMARY KEY,
	NameCategory NVARCHAR (100) NOT NULL
)
GO

CREATE TABLE MilkTea
(
	IdMilkTea INT IDENTITY PRIMARY KEY ,
	IdCategory  INT constraint FK_TK_Menu FOREIGN KEY (IdCategory ) REFERENCES  Menu(IdCategory) not null,
	NameMilkTea NVARCHAR(50) NOT NULL DEFAULT N'Trà sữa truyền thống',
	NameCategory NVARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL DEFAULT 0,
	Size NVARCHAR(10) NOT NULL,
	Topping NVARCHAR(50) NOT NULL,
	Ice INT NOT NULL,
	SUGAR INT NOT NULL
)
GO

CREATE TABLE Bill
(
	IdBill INT IDENTITY PRIMARY KEY,
	IdTable  INT constraint FK_TK_Table FOREIGN KEY (IdTable ) REFERENCES TableOfGuest (IdTable) NOT NULL,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateChekOut DATE NOT NULL DEFAULT GETDATE(),
	StatusBill INT NOT NULL DEFAULT 0, --1:đã thanh toán ,--0:chưa thanh toán,
	TotalPrice FLOAT NOT NULL
)
GO

CREATE TABLE DetailBill
(
	IdDetailBill INT IDENTITY PRIMARY KEY,
	IdBill  int constraint FK_TK_Bill FOREIGN KEY (IdBill ) REFERENCES Bill (IdBill) not null,
	IdMilkTea  int constraint FK_TK_MilkTea FOREIGN KEY (IdMilkTea ) REFERENCES MilkTea (IdMilkTea) not null,
	count INT NOT NULL DEFAULT 0 

)
GO

CREATE TABLE Materials
(
	IdMaterials INT IDENTITY PRIMARY KEY,
	NameMaterials NVARCHAR(100) NOT NULL,
	BeginDate DATE NOT NULL DEFAULT GETDATE(),
	ExpiryDate DATE NOT NULL DEFAULT GETDATE()
)
GO

CREATE TABLE Barn
(
	NameBarn NVARCHAR(100) PRIMARY KEY,
	IdMaterials  int constraint FK_TK_Materials FOREIGN KEY (IdMaterials ) REFERENCES Materials (IdMaterials) not null,
	IdMilkTea  int constraint FK_TK_MilkTeaBarn FOREIGN KEY (IdMilkTea ) REFERENCES MilkTea (IdMilkTea) not null,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateChekOut DATE NOT NULL DEFAULT GETDATE()
	
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL,
	PassWord NVARCHAR(100) NOT NULL ,
	Position INT NOT NULL ,--1:quản trị ,--2:quản lý,--3:nv quản lý kho,--4:nv quản lý hóa đơn ,--5:nv quản lý menu
)
GO


