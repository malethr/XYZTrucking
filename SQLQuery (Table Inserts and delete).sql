USE [XYZ Trucking];

INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Mark Gilbert','1983-08-24',20160307,'2016-03-07',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('David Saville','1967-11-24',20160417,'2016-04-17',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Rick Wenthe','1989-06-04',20160427,'2016-04-27',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Dave Sowards','1968-12-13',20160429,'2016-04-29',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Cleveland Williams','1987-07-29',20160503,'2016-05-03',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Donald Maenle','1979-01-08',20160510,'2016-05-10',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Alex Grant','1980-09-29',20160516,'2016-05-16',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Brian Walker','1984-05-16',20160521,'2016-05-21',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Freddy Morris','1979-09-10',20160528,'2016-05-28',1);
INSERT INTO DriverDemographicInformation (Name, DateOfBirth, EmployeeNumber, DateOfHire, CommercialDriverLicense) VALUES ('Edward Hunt','1986-10-23',20160601,'2016-06-01',1);


INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',1550763,'CAS 018','2012 FREIGHTLINER 125','DD15','Diesel',397031,6,6);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',2315462,'WES 490','2012 WESTERN STAR','DD13','Diesel',390039,7,8);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Short','Single Unit',1599535,'TEN 011','2011 INTERNATIONAL 6200','Maxxforce DT','Diesel',261000,8,NULL);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',2562565,'SCH 565','2014 CAT DT256','CT13','Diesel',230000,9,14);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',3304178,'TUL 178','2009 FREIGHTLINER FL330','MBE800','Diesel',260000,10,9);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',1125195,'OKC 195','2007 FREIGHTLINER M3 106','ISC','Diesel',215000,11,13);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',1027014,'BAL 014','2010 INTERNATIONAL','MaxxforceDT','Diesel',196000,12,7);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',7455016,'CAT 016','2004 FREIGHTLINER FLD160','Series 60','Diesel',222000,13,11);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',9951332,'MRY 332','2003 FREIGHTLINER F60','MBE960','Diesel',189000,14,12);
INSERT INTO TruckInformation (TruckType, TruckBodyType, TruckNumber, TruckLicenseNumber, TruckDescription, TruckEngineType, TruckFuelType, TruckCurrentMileage, DriverID, TrailerInformationID) VALUES ('Long','Tractor Trailer',8899216,'SND 216','2013 WESTERN STAR','DD13','Diesel',201000,15,10);


INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (38000,2,130000,'2008 TRANSCRAFT DTL-2100 RS2');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (37050,2,95000,'2016 Transcraft-HD');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (37060,2,93000,'2014 Transcraft 325');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (3600,1,123200,'Fuel Tanker');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (4100,1,129200,'Fuel Tanker');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (3600,1,111200,'Chemical Tanker');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (52000,3,132000,'Closed Trailer');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (46000,4,110000,'Temperature Controlled Box');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (47000,4,87200,'Frozen Box');
INSERT INTO TrailerInformation (TrailerCapacity,TrailerTypeID,TrailerMileage,TrailerDescription) VALUES (63600,4,150200,'Beverage Trailer');


INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-05-24','2016-06-10',1,2,6);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-05-25','2016-05-29',5,2,7);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-05-29','2016-06-05',6,1,8);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-06-01','2016-06-03',3,1,9);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-06-03','2016-06-12',4,2,10);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-06-24','2016-06-30',2,2,11);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-07-05','2016-07-10',5,1,12);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-07-05','2016-07-30',7,2,13);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-07-11','2016-07-21',1,2,14);
INSERT INTO TruckMaintenance (MaintenanceStartDate,MaintenanceEndDate,MaintenanceTypeID,MaintenanceCodeID,TruckID) VALUES ('2016-07-24','2016-07-28',1,1,15);


INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (6,'Donald Clinton',4,'2016-03-15 08:23','2016-03-20 16:40',27,'Signed by D. Clinton');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (7,'Kevin Ford',2,'2016-04-02 09:13','2016-04-20 22:36',35,'Signed by K. Ford');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (8,'Diane Matheson',4,'2016-04-03 07:36','2016-04-05 21:46',14,'Signed by D. Matheson');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (9,'Jane Simmons',3,'2016-04-10 10:23','2016-04-20 23:55',30,'Signed by J. Simmons');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (10,'Ken Rein',2,'2016-04-21 07:08','2016-04-22 13:07',39,'Signed by K. Rein');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (11,'John Blake',3,'2016-04-28 10:27','2016-05-07 14:49',30,'Signed by J. Blake');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (12,'Michael Edwards',4,'2016-05-01 06:07','2016-05-20 01:12',61,'Signed by M. Edwards');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (13,'Jake Collins',4,'2016-05-15 11:50','2016-05-17 08:40',12,'Signed by J. Collins');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (14,'John Blunt',3,'2016-05-16 10:43','2016-05-23 06:41',33,'Signed by J. Blunt');
INSERT INTO HaulRecord (TruckUsedID,Client,CargoTypeID,DateHaulBegan,DateDelivered,Mileage,HaulNotes) VALUES (15,'Simon Murphy',1,'2016-05-20 12:23','2016-06-05 18:09',56,'Signed by S. Murphy');


INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Toyota','Silver 2013',4130.21,3,6);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Honda','Black 2012',4232.01,3,6);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Oil','Power Plant Oil',16000.00,1,7);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Lamp','Vintage Lamp',123.12,5,8);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Chandelier','Luxury Chandelier',410.12,1,8);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Alcohol Drink','Beer',109.1,60,9);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Soda in can','Cola',60,100,9);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Bottled Juice','Orange Juice',110.90,60,9);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Oil','Plane Oil',35000,1,10);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Chicken meat','Breast and Wing',20,70,11);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Ham','Glazed Ham',2.2,50,11);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Hyundai','Gold SUV',4156.03,3,12);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Toyota','Black 2017',4200.02,2,12);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Marcelo Artwork','1960s Paintings',20,2,13);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Grapes','Spain grapes',50.21,10,14);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Jackfruit','Davao Jackfruit',60.19,8,14);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Banana','Davao Banana',120.99,50,14);
INSERT INTO HaulManifest (Item,ItemDescription,ItemWeightPerUnit,Quantity,HaulRecordID) VALUES ('Nitrogen gas','Use for chemical laboratory',10260.16,1,15);

DELETE FROM DriverDemographicInformation WHERE DateOfHire BETWEEN '2016-07-22' AND '2016-07-23';