-- Declare the variable to be used.
DECLARE @FromEmirateId int;
DECLARE @ToEmirateId int;
DECLARE @FromZoneNo int;
DECLARE @ToZoneNo int;

-- Initialize the variable the @FromZoneNo and @ToZoneNo must be different when updating in the same Emirate
SET @FromEmirateId = ;
SET @ToEmirateId = ;
SET @FromZoneNo = ;
SET @ToZoneNo = ;

DELETE [mashaweerrel2tmp].[dbo].[ZonePrice]
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


