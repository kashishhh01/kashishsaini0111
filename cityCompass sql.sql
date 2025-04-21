
CREATE DATABASE IF NOT EXISTS TravelData;
USE TravelData;

CREATE TABLE IF NOT EXISTS Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    StartLocation VARCHAR(255),
    EndLocation VARCHAR(255),
    DistanceKM DECIMAL(5, 1)
);

CREATE TABLE IF NOT EXISTS RapidoPrices (
    RouteID INT,
    BikeFare INT,
    AutoFare INT,
    CabFare INT,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

CREATE TABLE IF NOT EXISTS RapidoTimes (
    RouteID INT,
    BikeTime INT,
    AutoTime INT,
    CabTime INT,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

CREATE TABLE IF NOT EXISTS UberPrices (
    RouteID INT,
    BikeFare INT,
    AutoFare INT,
    CabFare INT,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

CREATE TABLE IF NOT EXISTS UberTimes (
    RouteID INT,
    BikeTime INT,
    AutoTime INT,
    CabTime INT,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- Insert data into the Routes table
INSERT INTO Routes (StartLocation, EndLocation, DistanceKM) VALUES
('Bennett University', 'Grand Venice Mall', 10.1),
('Omaxe Mall', 'Bennett University', 12.7),
('Sharda University', 'Knowledge Part 2', 3.8),
('Migsun Ultimo', 'Bennett University', 6),
('Sharda University', 'Galgotia University', 15.2), 
('Knowledge Park 2', 'Migsun Ultimo', 10),
('Alpha 2', 'Knowledge Park 2', 5.3),
('Dabra', 'Knowledge Park 2', 11.4),
('Pari Chowk', 'Akshardham', 32),
('Bennett University', 'DLF Mall of India, Noida', 37);

INSERT INTO RapidoPrices (RouteID, BikeFare, AutoFare, CabFare) VALUES
(1, 70, 110, 190),
(2, 100, 130, 210),
(3, 30, 50, 100),  -- NULL for missing data
(4, 60, 70, 150),
(5, 120, 150, 250),
(6, 90, 120, 200),
(7, 60, 70, 140),
(8, 100, 120, 200),
(9, 270, NULL, 540),
(10, 300, 350, 490);

INSERT INTO RapidoTimes (RouteID, BikeTime, AutoTime, CabTime) VALUES
(1, 20, 22, 22),
(2, 24, 25, 25),
(3, 6, 7, 7),
(4, 16, 15, 15),
(5, 25, 24, 23),
(6, 21, 20, 20),
(7, 16, 15, 15), 
(8, 24, 23, 23), 
(9, 42, NULL, 40), 
(10, 50, 52, 52);


INSERT INTO UberPrices (RouteID, BikeFare, AutoFare, CabFare) VALUES
(1, 80, 120, 200),
(2, 105, 120, 220),
(3, 30, 60, 110),  
(4, 60, 80, 150),
(5, 130, 170, 260),
(6, 90, 120, 200),
(7, 60, 80, 150),  
(8, 100, 140, 200),
(9, 300, NULL, 600),
(10, 300, 350, 520);

INSERT INTO UberTimes (RouteID, BikeTime, AutoTime, CabTime) VALUES
(1, 20, 22, 22),
(2, 24, 25, 25),
(3, 6, 7, 7),
(4, 16, 15, 15),
(5, 25, 24, 23),
(6, 21, 20, 20),
(7, 16, 15, 15), 
(8, 24, 23, 23), 
(9, 42, NULL, 40), 
(10, 50, 52, 52);