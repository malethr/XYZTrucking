USE [XYZ Trucking];

/* Insert Stored Procedure for LUCargoType*/
GO
CREATE PROCEDURE InsertLUCargoType (@CargoType VARCHAR (20), @CargoTypeDescription VARCHAR (200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO LUCargoType(CargoType, CargoTypeDescription) 
     VALUES (@CargoType, @CargoTypeDescription);
COMMIT TRANSACTION;
END;


/* Insert Stored Procedure for LUTrailerType*/
GO
CREATE PROCEDURE InsertLUTrailerType (@TrailerTypeAbbreviation VARCHAR (20), @TrailerTypeDescription VARCHAR (200))
AS
BEGIN
BEGIN TRANSACTION;
INSERT INTO LUTrailerType(TrailerTypeAbbreviation, TrailerTypeDescription) 
     VALUES (@TrailerTypeAbbreviation, @TrailerTypeDescription);
COMMIT TRANSACTION;
END;


/* Execution Samples for the stored procedure listed above*/

EXEC InsertLUCargoType 'Break Bulk', 'Out of Shape';
SELECT * FROM LUCargoType

EXEC InsertLUTrailerType 'Specialized', 'Very specific class of Trailer';
SELECT * FROM LUTrailerType

