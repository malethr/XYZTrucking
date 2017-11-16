CREATE PROCEDURE HaulRecordDateRange (@TruckID INT, @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT T.TruckID, D.DriverID, HR.Client, HR.CargoTypeID, LU.CargoType, HR.DateHaulBegan, HR.DateDelivered, HR.Mileage, HR.HaulNotes
FROM TruckInformation AS T
JOIN DriverDemographicInformation as D
ON T.TruckID = D.DriverID
JOIN HaulRecord AS HR
ON T.TruckID = HR.TruckUsedID
JOIN LUCargoType AS LU
ON HR.CargoTypeID = LU.CargoTypeID
WHERE T.TruckID = @TruckID AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate
ORDER BY HR.HaulRecordID

END

