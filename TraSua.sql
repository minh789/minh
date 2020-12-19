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
--Ingredient 
----------------------------

CREATE TABLE OrderCard
(
	CardId INT IDENTITY PRIMARY KEY,
	CardStatus NVARCHAR (50) NOT NULL DEFAULT N'Thẻ trống' --Trống || Có người 
)
GO

CREATE TABLE Category
(
	CategoryId INT IDENTITY PRIMARY KEY,
	CategoryName NVARCHAR (100) NOT NULL
)
GO

CREATE TABLE Drink
(
	DrinkId INT IDENTITY PRIMARY KEY ,
	CategoryId  INT constraint FK_TK_Menu FOREIGN KEY (CategoryId ) REFERENCES  Category(CategoryId) not null,
	DrinkName NVARCHAR(50) NOT NULL DEFAULT N'Trà sữa truyền thống',
	Price FLOAT NOT NULL DEFAULT 0,
)
GO

/*Topping NVARCHAR(50) NOT NULL,
Ice INT NOT NULL,
SUGAR INT NOT NULL*/


CREATE TABLE Bill
(
	BillId INT IDENTITY PRIMARY KEY,
	TableId  INT constraint FK_TK_Table FOREIGN KEY (TableId ) REFERENCES OrderCard (CardId) NOT NULL,
	CheckInDate DATE NOT NULL DEFAULT GETDATE(),
	ChekOutDate DATE NOT NULL DEFAULT GETDATE(),
	BillStatus INT NOT NULL DEFAULT 0, --1:đã thanh toán ,--0:chưa thanh toán,
	TotalPrice FLOAT NOT NULL,
	
)
GO

CREATE TABLE BillDetail
(
	BillDetailId INT IDENTITY PRIMARY KEY,
	BillId  int constraint FK_TK_Bill FOREIGN KEY (BillId ) REFERENCES Bill (BillId) not null,
	DrinkId  int constraint FK_TK_MilkTea FOREIGN KEY (DrinkId ) REFERENCES Drink (DrinkId) not null,
	Number INT NOT NULL DEFAULT 0,
	Size NVARCHAR(10) NOT NULL,
	Topping NVARCHAR(50) NOT NULL,
	Ice INT NOT NULL,
	SUGAR INT NOT NULL
)
GO

CREATE TABLE Ingredient
(
	IngredientID INT IDENTITY PRIMARY KEY,
	IngredientName NVARCHAR(100) NOT NULL,
	ProducedDate DATE NOT NULL DEFAULT GETDATE(),
	ExpiryDate DATE NOT NULL DEFAULT GETDATE()
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL,
	PassWord NVARCHAR(100) NOT NULL ,
	Position NVARCHAR(100) NOT NULL ,--1:quản lý,--2:nv quản lý kho,--3:nv quản lý hóa đơn ,--4:nv quản lý menu
)
GO

INSERT dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Position
)
VALUES
(   N'kminh', -- UserName - nvarchar(100)
    N'Khải Minh', -- DisplayName - nvarchar(100)
    N'1701yeu2409', -- PassWord - nvarchar(100)
    N'Quản lý'   -- Position - nvarchar(100)
    )

INSERT dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Position
)
VALUES
(   N'hminh', -- UserName - nvarchar(100)
    N'Huỳnh Minh', -- DisplayName - nvarchar(100)
    N'minhdesigner', -- PassWord - nvarchar(100)
    N'Quản lý Menu'   -- Position - nvarchar(100)
    )

INSERT dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Position
)
VALUES
(   N'luan', -- UserName - nvarchar(100)
    N'Thành Luân', -- DisplayName - nvarchar(100)
    N'luanmegame', -- PassWord - nvarchar(100)
    N'Quản lý kho'   -- Position - nvarchar(100)
    )

INSERT dbo.Account
(
    UserName,
    DisplayName,
    PassWord,
    Position
)
VALUES
(   N'quyen', -- UserName - nvarchar(100)
    N'Trần Quyền', -- DisplayName - nvarchar(100)
    N'quyencothu', -- PassWord - nvarchar(100)
    N'Nhân viên'   -- Position - nvarchar(100)
    )

