-- Declare the variable to be used.
DECLARE @FromEmirateId int;
DECLARE @ToEmirateId int;
DECLARE @FromZoneNo int;
DECLARE @ToZoneNo int;
DECLARE @FromZoneCounter int;
DECLARE @CarPrice decimal(18,5);
DECLARE @MotorcyclePrice decimal(18,5);
DECLARE @fromZones table(RowNumber int, [ZoneId] int, [EnglishName] [nvarchar](50), [zone_number] [int], [EmirateId] [int])
DECLARE @toZones table(RowNumber int, [ZoneId] int, [EnglishName] [nvarchar](50), [zone_number] [int], [EmirateId] [int])

SET @FromZoneCounter = 1;

-- Initialize the variable the @FromZoneNo and @ToZoneNo must be different when updating in the same Emirate
SET @FromEmirateId = 2;

SET @ToEmirateId = 2;

SET @FromZoneNo = ;

SET @ToZoneNo = ;

SET @MotorcyclePrice = ;
SET @CarPrice = ;

INSERT INTO @fromZones (RowNumber, [ZoneId], [EnglishName], [zone_number], [EmirateId])
SELECT ROW_NUMBER() OVER (ORDER BY [ZoneId]) AS RowNumber, [ZoneId], [EnglishName], [zone_number], [EmirateId] FROM [mashaweerrel2tmp].[dbo].[Zone]
WHERE EmirateId = @FromEmirateId AND [zone_number] = @FromZoneNo;

INSERT INTO @toZones (RowNumber, [ZoneId], [EnglishName], [zone_number], [EmirateId])
SELECT ROW_NUMBER() OVER (ORDER BY [ZoneId]) AS RowNumber, [ZoneId], [EnglishName], [zone_number], [EmirateId] FROM [mashaweerrel2tmp].[dbo].[Zone]
WHERE EmirateId = @ToEmirateId AND [zone_number] = @ToZoneNo;

WHILE (@FromZoneCounter <= (select count([ZoneId]) From @fromZones))
BEGIN

	DECLARE @ToZoneCounter int;
	DECLARE @fZoneID int;
	DECLARE @fEnglishName [nvarchar](50);
	DECLARE @fZoneNumber int;
	DECLARE @fEmirateId int;
	
	SET @ToZoneCounter = 1;
	--SET @ToZoneCounter = @FromZoneCounter; --For the Same ZoneNo in the same Emirate
	
	SELECT @fZoneID = (SELECT [ZoneId] 
	FROM @fromZones 
	WHERE RowNumber = @FromZoneCounter)
	
	SELECT @fEnglishName = (SELECT [EnglishName] 
	FROM @fromZones 
	WHERE RowNumber = @FromZoneCounter)
	
	SELECT @fZoneNumber = (SELECT [zone_number] 
	FROM @fromZones 
	WHERE RowNumber = @FromZoneCounter)
	
	SELECT @fEmirateId = (SELECT [EmirateId] 
	FROM @fromZones 
	WHERE RowNumber = @FromZoneCounter)
	
	PRINT 'Begin Insertion Zone ' + CAST(@fZoneID AS VARCHAR) + ' ' + @fEnglishName + ' in Zone Number ' + CAST(@fZoneNumber AS VARCHAR) + ' at Emirate No ' + CAST(@fEmirateId AS VARCHAR) + ' with Counter ' + CAST(@FromZoneCounter AS VARCHAR)
	
	WHILE (@ToZoneCounter <= (select count([ZoneId]) From @toZones))
	BEGIN
		
		DECLARE @tZoneID int;
		DECLARE @tEnglishName [nvarchar](50);
		DECLARE @tZoneNumber int;
		DECLARE @tEmirateId int;
	
		SELECT @tZoneID = (SELECT [ZoneId] 
		FROM @toZones 
		WHERE RowNumber = @ToZoneCounter)
		
		SELECT @tEnglishName = (SELECT [EnglishName] 
		FROM @toZones 
		WHERE RowNumber = @ToZoneCounter)
		
		SELECT @tZoneNumber = (SELECT [zone_number] 
		FROM @toZones 
		WHERE RowNumber = @ToZoneCounter)
		
		SELECT @tEmirateId = (SELECT [EmirateId] 
		FROM @toZones 
		WHERE RowNumber = @ToZoneCounter)
		
		INSERT INTO [mashaweerrel2tmp].[dbo].[ZonePrice]
           ([FromZone]
           ,[ToZone]
           ,[CarPrice]
           ,[MotorcyclePrice])
		VALUES
           (@fZoneID
           ,@tZoneID
           ,@CarPrice
           ,@MotorcyclePrice)
		
		
		SET @ToZoneCounter = @ToZoneCounter + 1
	END
	
	PRINT 'End Insertion for ' + CAST(@ToZoneCounter AS VARCHAR) + ' Records'
	
	SET @FromZoneCounter = @FromZoneCounter + 1
END

--select * from ZonePrice
select count(zPrice.PriceId) from ZonePrice as zPrice
Join Zone as fZone on fZone.ZoneId = zPrice.FromZone
Join Zone as tZone on tZone.ZoneId = zPrice.ToZone
Where fZone.zone_number = @FromZoneNo
AND tZone.zone_number = @ToZoneNo
AND fZone.EmirateId = @FromEmirateId
AND tZone.EmirateId = @ToEmirateId

select count(zPrice.PriceId) from ZonePrice as zPrice

select top 1 PriceId from ZonePrice order by PriceId DESC
