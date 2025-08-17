use Airline
create table Airline(AirlineID int primary key 
,AirlineName varchar(30),
HeadQuarter varchar(30),
ContactNumber bigint)
--insert the values

insert into Airline values(1,'SkyJet Airways','New York,USA',+1-800-555-1234),
(2,'BlueHorizon Airlines','London,UK',+44-20-7946-1234),
(3,'PacificWings','Tokyo,Japan',+81-3-1234-5678),
(4,'AirNova','Toronto,Canada',+49-30-12345678),
(5,'EuroFlyer','Berlin,Germany',+49-30-12345678)

create table Aircraft(AircraftID int primary key,
AircraftType varchar(50),
RegistrationNumber varchar(50),
Capicity int ,
CurrentStatus varchar(20),
AirlineID int,
Foreign key (AirlineID)references Airline(AirlineID))

insert into Aircraft values(101,'Boeing 737','N737SJ',180,'Active',2),
(102,'Airbus A320','G-BHAZ',160,'Active',2),
(103,'Boeing 787','JA787PW',250,'Maintenance',3),(104,'Bombardier Q400','C-FQBN',80,'Active',4),
(105,'Airbus A350','D-AEFL',300,'Inactive',5),(106,'Boeing 777','N777SK',280,'Active',1),
(107,'Airbus A330','G-BHAE',270,'Maintenance',2)


create table Flight(FlightID int primary key ,FlightNumber varchar(20)
,DepartureAirport varchar(50),ArrivalAirport varchar(50),
DepartureTime Date,
AirlineID int,
AircraftID int ,
foreign key (AirlineID) references Airline(AirlineID),
foreign key (AircraftID) references Aircraft(AircraftID)
);
insert into Flight values(201,'SJ101','JFK','LAX','2025-06-10 08:00:00','2025-06-10 11:00:00',1,101),
(202,'BH220','LHR','CDG','2025-06-12 09:30:00','2025-06-11 11:00:00',2,102),
(203,'PW330','HND','SIN','2025-06-12 13:45:00','2025-06-12 19:30:00',3,103),
(204,'AN440','YYZ','YVR','2025-06-13 07:15:00','2025-06-13 10:00:00',4,104),
(205,'EF550','BER','FCO','2025-06-14 06:30-00','2025-06-14 08:45:00',5,105);

create table Passenger (PassengerID int primary key,
FirstName Varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(20))

insert into Passenger values(1,'John','Doe','john.doe@example.com',123-456-7890),
(2,'Jane','Smith','Jane.smith@example.com',987-654-321),
(3,'Alice','Johnson','alice.Johnsondoe@example.com',555-123-567),
(4,'Bob','Brown','bob.brown@example.com',444-222-111),
(5,'Charlie','Davis','charlie.davis@example.com',333-444-777)
select *from Passenger;
create table Reservation(
ReservationID int primary key ,
SeatNumber varchar(10),
ReservationTime DATETIME,
PessengerID int ,
FlightID int,
foreign key (PessengerID) references Passenger(PassengerID))

insert into Reservation values (101,'12A','2025-06-09 10:00:00',1,1),
(102,'14C','2025-06-09 12:30:00',1,2)
,(103,'10B','2025-06-10 08:45:00',2,3),(104,'9D','2025-06-10 8:45:00',3,1),
(105,'22F','2025-06-12 18:00:00',4,2),(106,'1A','2025-06-13 07:15:00',5,4)


select *from Aircraft
select *from Airline;
select *from Flight
select *from Passenger
select *from Reservation
drop table Flight;
create table Flight(FlightID int primary key ,FlightNumber varchar(20)
,DepartureAirport varchar(50),ArrivalAirport varchar(50),
DepartureTime Date,
AirlineID int,
AircraftID int ,
foreign key (AirlineID) references Airline(AirlineID),
foreign key (AircraftID) references Aircraft(AircraftID)
);
alter table Flight
alter column DepartureTime varchar(100);


insert into Flight values
(201,'SJ101','JFK','LAX','2025-06-10 08:00:00' ,1,101),
(202,'BH220','LHR','CDG','2025-06-12 09:30:00 ',2,102),
(203,'PW330','HND','SIN','2025-06-12 13:45:00 ',3,103),
(204,'AN440','YYZ','YVR','2025-06-13 07:15:00 ',4,104),
(205,'EF550','BER','FCO','2025-06-14 06:30-00 ',5,105);

--Retrive information about all airlines 
select *from Airline

--Retrive information about all aircraft
select *from Aircraft

--Retrive a list of passengers for specific flight 

Select Passenger.*from Passenger 
join Reservation on Passenger.PassengerID =Reservation.PessengerID
where Reservation.FlightID=[FlightID]

--Retrieve a list of flight for a specific airline 
  select *from flight where AirlineID=[AirlineID]

--Retrieve available seats for a specific airline
  select  *from flight 
  join Aircraft on flight.AircraftID=Aircraft.AircraftID
  left join Reservation on Flight.FlightID=Reservation.FlightID
  where flight.FlightID=Reservation.[FlightID] and (Reservation.ReservationID is null or
  Reservation.ReservationTime <getdate());
--Retrieve the total number of reservation for a specific flight 
  
  select Passenger.FirstName,Passenger.LastName,Flight.FlightNumber,Flight.DepartureTime,Flight.ArrivalAirport
  from Passenger
  join Reservation on Passenger.PassengerID=Reservation.PessengerID
  join Flight on Reservation.FlightID=Flight.FlightID
  where Flight.AircraftID=1;
 

 