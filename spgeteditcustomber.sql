USE [Demo]
GO

/****** Object:  StoredProcedure [dbo].[spgeteditCustomber]    Script Date: 10/28/2024 12:41:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[spgeteditCustomber]

@id varchar(100)

AS
BEGIN 

select * from Customerinfo where id=@id;


End
GO


