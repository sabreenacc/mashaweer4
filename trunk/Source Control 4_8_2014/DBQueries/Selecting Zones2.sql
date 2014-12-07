SELECT zone.[ZoneId]
      ,zone.X
      ,zone.Y
      ,zone.[ArabicName]
      ,zone.[EnglishName]
      ,zone.[zone_number]
      ,zone.[EmirateId]
      ,emirate.[EnglishName]
  FROM [mashaweerrel2tmp].[dbo].[Zone] as zone
  JOIN [mashaweerrel2tmp].[dbo].[EEmirate] as emirate on emirate.EmirateId = zone.EmirateId
  WHERE zone.[EmirateId] = 2
	AND zone.[zone_number] = 9
GO


