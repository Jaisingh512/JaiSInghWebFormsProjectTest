USE [Demo]
GO

/****** Object:  StoredProcedure [dbo].[speditCustomber]    Script Date: 10/28/2024 12:41:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[speditCustomber]

@id varchar(100),
@name varchar(200),
@email varchar(200),
@phone varchar(10)
AS
BEGIN 

update Customerinfo set name=@name ,phone =@phone ,email= @email where id=@id;



End
GO


