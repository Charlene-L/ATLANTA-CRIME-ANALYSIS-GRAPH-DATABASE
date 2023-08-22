:setvar SqlSamplesSourceDataPath "C:\Users\admin\Desktop\CSVfiles\"
:setvar DatabaseName "AtlantaCrimeDW"

PRINT '';
PRINT '*** Loading Data';
GO

PRINT 'Loading [dbo].[DimTime]';

BULK INSERT [dbo].[DimTime] FROM '$(SqlSamplesSourceDataPath)DimTime.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[DimLocation]';

BULK INSERT [dbo].[DimLocation] FROM '$(SqlSamplesSourceDataPath)DimLocation.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[DimCrimeType]';

BULK INSERT [dbo].[DimCrimeType] FROM '$(SqlSamplesSourceDataPath)DimCrimeType.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[DimPoliceArea]';

BULK INSERT [dbo].[DimPoliceArea] FROM '$(SqlSamplesSourceDataPath)DimPoliceArea.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[DimBuildingType]';

BULK INSERT [dbo].[DimBuildingType] FROM '$(SqlSamplesSourceDataPath)DimBuildingType.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

PRINT 'Loading [dbo].[FactAtlantaCrime]';

BULK INSERT [dbo].[FactAtlantaCrime] FROM '$(SqlSamplesSourceDataPath)Fact.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE=' ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);