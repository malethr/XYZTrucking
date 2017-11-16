CREATE PROCEDURE HaulRecordManifestDateRange (@TruckID INT, @BeginDate DATETIME, @EndDate DATETIME)

AS

BEGIN

SELECT T.TruckID, D.DriverID, HR.Client, HR.CargoTypeID, LU.CargoType, HR.DateHaulBegan, HR.DateDelivered, HR.Mileage, HR.HaulNotes,
HM.Item, HM.ItemDescription, HM.ItemWeightPerUnit, HM.Quantity
FROM TruckInformation AS T
JOIN DriverDemographicInformation AS D
ON T.DriverID = D.DriverID
JOIN HaulRecord AS HR
ON T.TruckID = HR.TruckUsedID 
JOIN HaulManifest AS HM
ON HR.HaulRecordID = HM.HaulRecordID
JOIN LUCargoType AS LU
ON LU.CargoTypeID = HR.CargoTypeID
WHERE T.TruckID = @TruckID AND HR.DateDelivered BETWEEN @BeginDate AND @EndDate
ORDER BY HR.HaulRecordID

END
