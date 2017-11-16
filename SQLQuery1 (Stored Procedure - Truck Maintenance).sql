CREATE PROCEDURE TruckMaintenanceDateRange (@BeginDate DATE, @EndDate DATE)

AS

BEGIN

SELECT T.TruckID, T.TruckType, M.MaintenanceStartDate, M.MaintenanceEndDate, 
M.MaintenanceTypeID, LUT.MaintenanceType, M.MaintenanceCodeID, LUC.MaintenanceCode
FROM TruckInformation AS T
JOIN TruckMaintenance AS M
ON T.TruckID = M.TruckID
JOIN LUMaintenanceType AS LUT
ON M.MaintenanceTypeID = LUT.MaintenanceTypeID
JOIN LUMaintenanceCode AS LUC
ON M.MaintenanceCodeID = LUC.MaintenanceCodeID
WHERE M.MaintenanceStartDate BETWEEN @BeginDate AND @EndDate
ORDER BY T.TruckType

END