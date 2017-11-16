GO

CREATE PROCEDURE ClientDateDeliveredSearch (@Char VARCHAR(20), @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT  HR.HaulRecordID, HR.Client, HM.Item, HM.ItemDescription, HR.DateDelivered, D.DriverID, T.TruckID
FROM HaulRecord AS HR
JOIN HaulManifest AS HM
ON HR.HaulRecordID = HM.HaulRecordID
JOIN TruckInformation AS T
ON HR.TruckUsedID = T.TruckID
JOIN DriverDemographicInformation AS D
ON D.DriverID = T.DriverID					 /* SQL Statement using SQL Wildcard */
WHERE HR.Client LIKE @Char AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate 
ORDER BY HR.CLIENT

END

																	   /* Example execution of stored procedure above */
EXEC ClientDateDeliveredSearch '[c-m]%', '2016-01-01', '2016-04-30'    /* SQL Statement using SQL [charlist] Wildcard */


/*----------------- SQL Statement Using DATEDIFF -----------------*/

SELECT T.TruckID, DATEDIFF (DAY, TM.MaintenanceStartDate, TM.MaintenanceEndDate) AS DAYDIFF,  LU.MaintenanceType
FROM TruckInformation AS T
JOIN TruckMaintenance AS TM
ON T.TruckID = TM.TruckID
JOIN LUMaintenanceType AS LU
ON LU.MaintenanceTypeID = TM.MaintenanceTypeID
ORDER BY DAYDIFF DESC


