/* Create DW */
PRINT '';
PRINT '*** Dropping Database';
GO
IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'AtlantaCrimeDW2')
DROP DATABASE AtlantaCrimeDW2;
GO
PRINT '';
PRINT '*** Creating AtlantaCrimeDW2';
GO
Create database AtlantaCrimeDW2
Go
Use AtlantaCrimeDW2
Go

/* Create AdjacentZones Table */
PRINT '';
PRINT '*** Creating Table AdjacentZones';
GO
Create table AdjacentZones
(
  ZoneKey bigint not null,
  AdjacentZoneKey bigint not null
)
GO


/* Create Time Dimension */
PRINT '';
PRINT '*** Creating Table Time';
GO
Create table DimTime
(
Year varchar(10) not null,
Month varchar(10) not null,
Date varchar(100) not null,
TimeKey bigint primary key identity
)
Go

/* Create Location Dimension */
PRINT '';
PRINT '*** Creating Table Location';
GO
Create table Location
(
Neighborhood varchar(50),
LocationKey bigint primary key identity,
NPUKey bigint
)
Go

/* Create Location Dimension */
PRINT '';
PRINT '*** Creating Table Location';
GO
Create table NPU
(
NPU varchar(10) not null,
NPUKey bigint primary key identity
)
Go

/* Create CrimeType Dimension */
PRINT '';
PRINT '*** Creating Table CrimeType';
GO
Create table CrimeType
(
CrimeType varchar(50) not null,
CrimeTypeKey bigint primary key identity
)
Go

/* Create Beat Dimension */
PRINT '';
PRINT '*** Creating Table Beat';
GO
Create table Beat
(
Beat varchar(10) not null,
BeatKey bigint primary key identity,
ZoneKey bigint
)
Go

/* Create Zone Dimension */
PRINT '';
PRINT '*** Creating Table Zone';
GO
Create table Zone
(
Zone varchar(10) not null,
ZoneKey bigint primary key identity
)
Go

/* Create PropertyType Dimension */
PRINT '';
PRINT '*** Creating Table PropertyType';
GO
Create table PropertyType
(
PropertyType varchar(50) not null,
PropertyTypeKey bigint primary key identity
)
Go

/* Create Fact Table */
PRINT '*** Creating Table Fact';
GO
Create Table CrimeID
(
TimeKey bigint not null,
LocationKey bigint not null,
CrimeTypeKey bigint not null,
BeatKey bigint not null,
PropertyTypeKey bigint not null,
CrimeID bigint primary key identity
)
Go

/* Add Relationship */
PRINT '';
PRINT '*** Add relation between Fact table Foreign keys to Primary keys of Dimensions';
GO
AlTER TABLE CrimeID ADD CONSTRAINT
FK_TimeKey FOREIGN KEY (TimeKey)REFERENCES DimTime(TimeKey);
AlTER TABLE CrimeID ADD CONSTRAINT
FK_LocationKey FOREIGN KEY (LocationKey)REFERENCES Location(LocationKey);
AlTER TABLE CrimeID ADD CONSTRAINT
FK_CrimeTypeKey FOREIGN KEY (CrimeTypeKey)REFERENCES CrimeType(CrimeTypeKey);
AlTER TABLE CrimeID ADD CONSTRAINT
FK_BeatKey FOREIGN KEY (BeatKey)REFERENCES Beat(BeatKey);
AlTER TABLE CrimeID ADD CONSTRAINT
FK_PropertyTypeKey FOREIGN KEY (PropertyTypeKey)REFERENCES PropertyType(PropertyTypeKey);

ALTER TABLE Location ADD CONSTRAINT
FK_NPUKey FOREIGN KEY (NPUKey) REFERENCES NPU(NPUKey);

ALTER TABLE Beat ADD CONSTRAINT
FK_ZoneKey FOREIGN KEY (ZoneKey) REFERENCES Zone(ZoneKey);
Go

/* Add Foreign Key Relationships for AdjacentZones Table */
PRINT '';
PRINT '*** Add Foreign Key Relationships for AdjacentZones Table';
GO
ALTER TABLE AdjacentZones ADD CONSTRAINT
FK_ZoneKey_A FOREIGN KEY (ZoneKey) REFERENCES Zone(ZoneKey);

ALTER TABLE AdjacentZones ADD CONSTRAINT
FK_AdjacentZoneKey FOREIGN KEY (AdjacentZoneKey) REFERENCES Zone(ZoneKey);
GO