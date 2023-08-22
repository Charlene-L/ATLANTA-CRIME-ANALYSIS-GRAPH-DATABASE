/* Create DW */
PRINT '';
PRINT '*** Dropping Database';
GO
IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'AtlantaCrimeDW')
DROP DATABASE AtlantaCrimeDW;
GO
PRINT '';
PRINT '*** Creating Database';
GO
Create database AtlantaCrimeDW
Go
Use AtlantaCrimeDW
Go

/* Create Time Dimension */
PRINT '';
PRINT '*** Creating Table DimTime';
GO
Create table DimTime
(
Year varchar(10) not null,
Quarter varchar(10) not null,
Month varchar(10) not null,
PublicHoliday varchar(50) not null,
Weekday varchar(50) not null,
Date varchar(100) not null,
TimeKey bigint primary key identity
)
Go

/* Create Location Dimension */
PRINT '';
PRINT '*** Creating Table DimLocation';
GO
Create table DimLocation
(
County varchar(50) not null,
NPU varchar(10) not null,
Neighborhood varchar(50),
Road varchar(100) not null,
Location varchar(100) not null,
LocationKey bigint primary key identity
)
Go

/* Create CrimeType Dimension */
PRINT '';
PRINT '*** Creating Table DimCrimeType';
GO
Create table DimCrimeType
(
CrimeType varchar(50) not null,
SubCrimeType varchar(50) not null,
CrimeTypeKey bigint primary key identity
)
Go

/* Create PoliceArea Dimension */
PRINT '';
PRINT '*** Creating Table DimPoliceArea';
GO
Create table DimPoliceArea
(
Zone varchar(10) not null,
Beat varchar(10) not null,
PoliceAreaKey bigint primary key identity
)
Go

/* Create BuildingType Dimension */
PRINT '';
PRINT '*** Creating Table DimBuildingType';
GO
Create table DimBuildingType
(
BuildingType varchar(50) not null,
SubBuildingType varchar(50) not null,
BuildingTypeKey bigint primary key identity
)
Go

/* Create Fact Table */
PRINT '*** Creating Table Fact';
GO
Create Table FactAtlantaCrime
(
TimeKey bigint not null,
LocationKey bigint not null,
CrimeTypeKey bigint not null,
PoliceAreaKey bigint not null,
BuildingTypeKey bigint not null,
CrimeCount bigint not null,
AtlantaCrimeID bigint primary key identity
)
Go

/* Add Relationship */
PRINT '';
PRINT '*** Add relation between Fact table Foreign keys to Primary keys of Dimensions';
GO
AlTER TABLE FactAtlantaCrime ADD CONSTRAINT
FK_TimeKey FOREIGN KEY (TimeKey)REFERENCES DimTime(TimeKey);
AlTER TABLE FactAtlantaCrime ADD CONSTRAINT
FK_LocationKey FOREIGN KEY (LocationKey)REFERENCES DimLocation(LocationKey);
AlTER TABLE FactAtlantaCrime ADD CONSTRAINT
FK_CrimeTypeKey FOREIGN KEY (CrimeTypeKey)REFERENCES DimCrimeType(CrimeTypeKey);
AlTER TABLE FactAtlantaCrime ADD CONSTRAINT
FK_PoliceAreaKey FOREIGN KEY (PoliceAreaKey)REFERENCES DimPoliceArea(PoliceAreaKey);
AlTER TABLE FactAtlantaCrime ADD CONSTRAINT
FK_BuildingTypeKey FOREIGN KEY (BuildingTypeKey)REFERENCES DimBuildingType(BuildingTypeKey);
Go