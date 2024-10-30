USE [Demo]
GO

/****** Object:  StoredProcedure [dbo].[spgetlistCustomber]    Script Date: 10/28/2024 12:42:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[spgetlistCustomber]



AS
BEGIN 

select * from Customerinfo ;


End
GO


