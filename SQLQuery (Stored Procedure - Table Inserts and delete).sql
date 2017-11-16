USE [XYZ Trucking];

/* Insert Stored Procedure for DriverDemographicInformation*/
GO
CREATE PROCEDURE InsertDriverInformation (@Name VARCHAR(50),@DateOfBirth DATE, @EmployeeNumber INT, @DateOfHire DATE, @CommercialDriverLicense BIT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) 
     VALUES (@Name,@DateOfBirth,@EmployeeNumber,@DateOfHire,@CommercialDriverLicense);
COMMIT TRANSACTION;
END;

/* Insert Stored Procedure for TruckInformation */
GO
CREATE PROCEDURE InsertTruckInformation (@TruckType VARCHAR(20),@TruckBodyType VARCHAR(20),@TruckNumber VARCHAR(20),@TruckLicenseNumber VARCHAR(20),@TruckDescription VARCHAR(50),@TruckEngineType VARCHAR(20),@TruckFuelType VARCHAR(20),@TruckCurrentMileage BIGINT, @DriverID INT, @TrailerInformationID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) 
     VALUES (@TruckType,@TruckBodyType,@TruckNumber,@TruckLicenseNumber,@TruckDescription,@TruckEngineType,@TruckFuelType,@TruckCurrentMileage,@DriverID,@TrailerInformationID)
COMMIT TRANSACTION;
END;

/* Insert Stored Procedure for TrailerInformation */
GO
CREATE PROCEDURE InsertTrailerInformation (@TrailerCapacity INT,@TrailerTypeID INT,@TrailerMileage BIGINT,@TrailerDescription VARCHAR(200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) 
     VALUES (@TrailerCapacity,@TrailerTypeID,@TrailerMileage,@TrailerDescription)
COMMIT TRANSACTION;
END;

/* Insert Stored Procedure for TruckMaintenance */
GO
CREATE PROCEDURE InsertTruckMaintenance (@MaintenanceStartDate DATE,@MaintenanceEndDate DATE,@MaintenanceTypeID INT,@MaintenanceCodeID INT,@TruckID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) 
     VALUES (@MaintenanceStartDate,@MaintenanceEndDate,@MaintenanceTypeID,@MaintenanceCodeID,@TruckID)
COMMIT TRANSACTION;
END;

/* Insert Stored Procedure for HaulRecord */
GO
CREATE PROCEDURE InsertHaulRecord (@TruckUsedID INT,@Client VARCHAR (200),@CargoTypeID INT,@DateHaulBegan DATETIME,@DateDelivered DATETIME,@Mileage BIGINT,@HaulNotes VARCHAR(200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO HaulRecord(TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) 
     VALUES (@TruckUsedID,@Client,@CargoTypeID,@DateHaulBegan,@DateDelivered,@Mileage,@HaulNotes)
COMMIT TRANSACTION;
END;

/* Insert Stored Procedure for HaulManifest */
GO
CREATE PROCEDURE InsertHaulManifest (@Item VARCHAR(50),@ItemDescription VARCHAR(200),@ItemWeightPerUnit DECIMAL(10,2),@Quantity INT,@HaulRecordID INT)
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO HaulManifest(Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) 
     VALUES (@Item,@ItemDescription,@ItemWeightPerUnit,@Quantity,@HaulRecordID)
COMMIT TRANSACTION;
END;

/* Delete Stored Procedure for DriverDemographicInformation */
GO
CREATE PROCEDURE DeleteDriverID (@BeginDate DATE, @EndDate DATE)
AS
BEGIN
	DELETE FROM DriverDemographicInformation WHERE DateOfHire BETWEEN @BeginDate AND @EndDate
END;


/* Execution examples on each stored procedure listed above */

EXEC InsertDriverInformation 'Harry Connor','1982-10-06',20160725,'2016-07-25',1;
EXEC InsertDriverInformation 'Greg Sanger','1970-11-15',20160726,'2016-07-26',1;
SELECT * FROM DriverDemographicInformation


EXEC InsertTruckInformation 'Long','Tractor Trailer',0012635,'NEW 043','2014 FREIGHTLINER 053','DD15','Diesel',230126,17,1;
EXEC InsertTruckInformation 'Short','Single',2231528,'VIS 627','2015 FREIGHTLINER 115','DD15','Diesel',230169,18,NULL;
SELECT * FROM TruckInformation


EXEC InsertTrailerInformation 37000,1,90000,'Fuel Tanker';
SELECT * FROM TrailerInformation


EXEC InsertTruckMaintenance '2016-08-10','2016-08-15',4,2,16;
SELECT * FROM TruckMaintenance


EXEC InsertHaulRecord 16,'Michael Edwards',2,'2016-06-10 09:13','2016-06-20 19:10',30,'Signed by M. Edwards';
SELECT * FROM HaulRecord


EXEC InsertHaulManifest 'Oil','Ships Oil',32000,1,16;
SELECT * FROM HaulManifest

EXEC DeleteDriverID '2016-07-22','2016-07-23'
SELECT * FROM DriverDemographicInformation