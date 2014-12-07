-- Declare the variable to be used.
DECLARE @FromEmirateId int;
DECLARE @ToEmirateId int;
DECLARE @FromZoneNo int;
DECLARE @ToZoneNo int;

-- Initialize the variable the @FromZoneNo and @ToZoneNo must be different when updating in the same Emirate
SET @FromEmirateId = 2;
SET @ToEmirateId = 2;
SET @FromZoneNo = 7;
SET @ToZoneNo = 7;

SELECT price.[PriceId]
      ,price.[CarPrice]
      ,price.[MotorcyclePrice]
      ,price.[FromZone] AS FromZoneID
      ,fzone.[EnglishName] AS FromZone
      ,fzone.[zone_number] AS FromZoneNo
      ,femirate.[EnglishName] AS FromEmirate
      ,price.[ToZone] AS ToZoneID
      ,tzone.[EnglishName] AS ToZone
      ,tzone.[zone_number] AS ToZoneNo
      ,temirate.[EnglishName] AS ToEmirate
      
  FROM [mashaweerrel2tmp].[dbo].[ZonePrice] as price
  INNER JOIN [mashaweerrel2tmp].[dbo].[Zone] as fzone ON  fzone.[ZoneID] = price.[FromZone]
  INNER JOIN [mashaweerrel2tmp].[dbo].[EEmirate] as femirate ON  femirate.[EmirateID] = fzone.[EmirateID]
  INNER JOIN [mashaweerrel2tmp].[dbo].[Zone] as tzone ON  tzone.[ZoneID] = price.[ToZone]
  INNER JOIN [mashaweerrel2tmp].[dbo].[EEmirate] as temirate ON  temirate.[EmirateID] = tzone.[EmirateID]
  
  WHERE ((femirate.[EmirateID] = @FromEmirateId AND temirate.[EmirateID] = @ToEmirateId)
	  OR (femirate.[EmirateID] = @ToEmirateId AND temirate.[EmirateID] = @FromEmirateId))
	 
	AND ((fzone.[zone_number] = @FromZoneNo AND tzone.[zone_number] = @ToZoneNo)
	  OR (fzone.[zone_number] = @ToZoneNo AND tzone.[zone_number] = @FromZoneNo))
GO


