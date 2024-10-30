USE [Demo]
GO

/****** Object:  StoredProcedure [dbo].[spdeleteCustomber]    Script Date: 10/28/2024 12:40:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE   [dbo].[spdeleteCustomber]

@id varchar(200)

AS
BEGIN 

delete from Customerinfo where id=@id;



End
GO


