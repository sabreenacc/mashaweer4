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
  JOIN [mashaweerrel2tmp].[dbo].[Zone] as fzone ON  fzone.[ZoneID] = price.[FromZone]
  JOIN [mashaweerrel2tmp].[dbo].[EEmirate] as femirate ON  femirate.[EmirateID] = fzone.[EmirateID]
  JOIN [mashaweerrel2tmp].[dbo].[Zone] as tzone ON  tzone.[ZoneID] = price.[ToZone]
  JOIN [mashaweerrel2tmp].[dbo].[EEmirate] as temirate ON  temirate.[EmirateID] = tzone.[EmirateID]
  where PriceId > 35732
  order by PriceId ASC