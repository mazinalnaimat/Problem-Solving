USE WindowFunctionsTrainingDB;
GO

WITH DistinctChannels AS
(
    SELECT DISTINCT SiteName, Channel
    FROM dbo.WebsiteTraffic
)
SELECT
    SiteName,
    COUNT(*) AS DistinctChannelCount,
    STRING_AGG(CONVERT(nvarchar(max), Channel), ', ')
        WITHIN GROUP (ORDER BY Channel) AS Channels
FROM DistinctChannels
GROUP BY SiteName
ORDER BY SiteName;
