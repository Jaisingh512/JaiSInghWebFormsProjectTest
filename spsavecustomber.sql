USE [Demo]
GO

/****** Object:  StoredProcedure [dbo].[spSaveCustomber]    Script Date: 10/28/2024 12:42:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[spSaveCustomber]

@name varchar(200),

@email varchar(200),

@phone varchar(10)

AS
BEGIN 

insert into Customerinfo  values(@name ,@phone,@email)




End
GO


