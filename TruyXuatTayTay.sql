USE MilkTeaShop
GO

CREATE PROC USP_GetAccountByUserName	
@username NVARCHAR(50)
AS
BEGIN
	SELECT* FROM dbo.Account WHERE @username=UserName
END
GO

EXEC dbo.USP_GetAccountByUserName @username = N'kminh' -- nvarchar(50)
GO

CREATE PROC USP_GetAccount	
AS
BEGIN
	SELECT* FROM dbo.Account 
END
GO
 
EXEC dbo.USP_GetAccount
GO

CREATE PROC USP_Login	
@userName NVARCHAR(100),@passWord NVARCHAR(100), @position NVARCHAR(100)
AS
BEGIN
	SELECT* FROM dbo.Account WHERE  @userName=UserName AND @passWord=PassWord  AND @position=Position
END
GO

CREATE PROC USP_GetCardList
AS
BEGIN
	SELECT* FROM dbo.OrderCard
END
GO

EXECUTE dbo.USP_GetCardeList


CREATE PROC CardUpdate(@n int)
AS
	BEGIN
		DECLARE @i INT = 10;
		WHILE @i<@n
		BEGIN
			INSERT dbo.OrderCard(CardId) VALUES (@i)
			SET @i+=1
		END
	END

		UPDATE dbo.TableOfGuest SET StatusTable = N'Đã có người' WHERE IdTable =9


CREATE PROC USP_GetPos(@Username nvarchar(100), @pass nvarchar(100))
AS
	BEGIN
		SELECT position
		FROM dbo.Account
		WHERE Username=@Username AND PassWord=@pass
	END

EXEC USP_GetPos N'hminh', N'minhdesigner' 

EXEC USP_GetPos N'kminh', N'1701yeu2409' 

