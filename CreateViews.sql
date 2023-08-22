-- For Rule 1
-- Create the vAssocCase view
IF OBJECT_ID('vDMPre2') IS NOT NULL
DROP VIEW vDMPre2;
GO

IF OBJECT_ID('vAssocCase02') IS NOT NULL
DROP VIEW vAssocCase02;
GO

-- Create the vAssocNested view
IF OBJECT_ID('vAssocNested02') IS NOT NULL
DROP VIEW vAssocNested02;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDMPre2]
AS
SELECT    f.AtlantaCrimeID, p.beat, t.date, c.SubCrimeType
FROM      [dbo].[FactAtlantaCrime] f
LEFT JOIN [dbo].[DimTime] t
ON f.TimeKey = t.TimeKey
LEFT JOIN [dbo].[DimPoliceArea] p
ON f.PoliceAreaKey = p.PoliceAreaKey
LEFT JOIN [dbo].[DimCrimeType] c
ON f.CrimeTypeKey = c.CrimeTypeKey
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssocCase02]
AS
SELECT    wn.date, wn.beat , ROW_NUMBER() OVER(ORDER BY wn.date, wn.beat ASC) AS WNKey
FROM      (SELECT    DISTINCT date, beat FROM [dbo].[vDMPre2]) AS wn
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssocNested02]
AS
SELECT     p.SubCrimeType, v.WNKey
FROM      [dbo].[vDMPre2] p
JOIN [dbo].[vAssocCase02] v
ON p.date = v.date AND p.beat = v.beat
GO

-- For Rule 2
-- Create the vAssocCase view
IF OBJECT_ID('vDMPre3') IS NOT NULL
DROP VIEW vDMPre3;
GO

IF OBJECT_ID('vAssocCase03') IS NOT NULL
DROP VIEW vAssocCase03;
GO

-- Create the vAssocNested view
IF OBJECT_ID('vAssocNested03') IS NOT NULL
DROP VIEW vAssocNested03;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vDMPre3]
AS
SELECT    f.AtlantaCrimeID, b.BuildingType, b.SubBuildingType, t.Date, c.SubCrimeType
FROM      [dbo].[FactAtlantaCrime] f
LEFT JOIN [dbo].[DimTime] t
ON f.TimeKey = t.TimeKey
LEFT JOIN [dbo].[DimBuildingType] b
ON f.BuildingTypeKey = b.BuildingTypeKey
LEFT JOIN [dbo].[DimCrimeType] c
ON f.CrimeTypeKey = c.CrimeTypeKey
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssocCase03]
AS
SELECT    db.Date, db.BuildingType, db.SubBuildingType, ROW_NUMBER() OVER(ORDER BY db.Date, db.BuildingType, db.SubBuildingType ASC) AS DBKey
FROM      (SELECT    DISTINCT Date, BuildingType, SubBuildingType FROM [dbo].[vDMPre3]) AS db
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssocNested03]
AS
SELECT     p.SubCrimeType, v.DBKey
FROM      [dbo].[vDMPre3] p
JOIN [dbo].[vAssocCase03] v
ON p.Date = v.Date AND p.SubBuildingType = v.SubBuildingType
GO
