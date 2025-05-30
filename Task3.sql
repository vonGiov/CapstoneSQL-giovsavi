/*Task 3
Project: Event Management System using PostgreSQL.
Objective: To develop the application that allows users to create and manage events, track
attendees, and handle event registrations efficiently. The project will include the following
tasks:


1. Database Creation


Create a database named "EventsManagement."
*/

CREATE DATABASE EventsManagement;



/*Create tables for Events, Attendees, and Registrations.
Events- Event_Id, Event_Name, Event_Date, Event_Location, Event_Description
Attendees- Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City
Registrations-Registration_id, Event_Id, Attendee_Id,Registration_Date,Registration_Amount.
The FOREIGN KEY constraint in the Registrations table references the Event_Id column in the
Events table and the Attendee_Id column in the Attendees table.
*/


CREATE TABLE Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name TEXT NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location TEXT,
    Event_Description TEXT
);

CREATE TABLE Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name TEXT NOT NULL,
    Attendee_Phone TEXT,
    Attendee_Email TEXT,
    Attendee_City TEXT
);

CREATE TABLE Registrations (
    Registration_Id SERIAL PRIMARY KEY,
    Event_Id INTEGER NOT NULL,
    Attendee_Id INTEGER NOT NULL,
    Registration_Date DATE NOT NULL,
    Registration_Amount NUMERIC(8, 2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);


-- 2. Data Creation


-- Insert some sample data for Events, Attendees, and Registrations tables with respective fields.



INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES
('Tech Conference 2025', '2025-07-15', 'New York', 'Annual technology trends and innovation showcase.'),
('Music Fest', '2025-08-10', 'Los Angeles', 'Live performances by various artists.'),
('Startup Pitch Night', '2025-06-20', 'San Francisco', 'Startup founders pitch their ideas to investors.'),
('Art Expo', '2025-09-05', 'Chicago', 'An exhibition of modern and contemporary art.'),
('Health & Wellness Fair', '2025-07-30', 'Boston', 'A fair promoting healthy living and wellness products.');


INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES
('Alice Johnson', '1234567890', 'alice@example.com', 'New York'),
('Bob Smith', '2345678901', 'bob@example.com', 'Los Angeles'),
('Charlie Lee', '3456789012', 'charlie@example.com', 'San Francisco'),
('Diana Ross', '4567890123', 'diana@example.com', 'Chicago'),
('Ethan Brown', '5678901234', 'ethan@example.com', 'Boston');

INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES
(1, 1, '2025-06-01', 150.00),
(1, 2, '2025-06-02', 150.00),
(2, 3, '2025-07-01', 120.00),
(3, 4, '2025-05-15', 0.00),
(4, 5, '2025-08-01', 75.00),
(5, 1, '2025-06-10', 50.00);




-- 3. Manage Event Details




-- a) Inserting a new event
INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES 
('Green Energy Summit', '2025-10-12', 'Seattle', 'A summit focused on renewable energy solutions and sustainability.');



-- b) Updating an event's information (e.g., changing the location of Event_Id 2)
UPDATE Events
SET 
    Event_Location = 'San Diego',
    Event_Description = 'Updated location for Music Fest due to venue change.'
WHERE 
    Event_Id = 2;


-- c) Deleting an event (e.g., Event_Id 4)

-- Deleteing Registrations which reference the event, to prevent foreign key constraing violation
DELETE FROM Registrations
WHERE Event_Id = 4;

-- Deleteing the event
DELETE FROM Events
WHERE Event_Id = 4;



--4) Manage Track Attendees & Handle Events
-- a) Inserting a new attendee
INSERT INTO Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES 
('Nina Evans', '6677889900', 'nina.evans@example.com', 'Seattle');


-- b) Registering an attendee for an event
INSERT INTO Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES 
(1, 6, CURRENT_DATE, 100.00);

-- Checking the previous 2 commands' results
SELECT * FROM Registrations;
SELECT * FROM Attendees;


--5.Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.

-- Retrieve all event information
SELECT *
FROM Events;


-- Generate attendee list for a specific event
SELECT 
    E.Event_Name,
    A.Attendee_Name,
    A.Attendee_Email,
    A.Attendee_City,
    R.Registration_Date,
    R.Registration_Amount
FROM 
    Registrations R
JOIN Events E ON R.Event_Id = E.Event_Id
JOIN Attendees A ON R.Attendee_Id = A.Attendee_Id
WHERE 
    R.Event_Id = 1;
    
  
-- List of events with number of attendees registered
SELECT 
    E.Event_Name,
    COUNT(R.Attendee_Id) AS Total_Attendees
FROM 
    Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY 
    E.Event_Name
ORDER BY 
    Total_Attendees DESC;


-- Total income from registrations per event
SELECT 
    E.Event_Name,
    SUM(R.Registration_Amount) AS Total_Income
FROM 
    Events E
JOIN Registrations R ON E.Event_Id = R.Event_Id
GROUP BY 
    E.Event_Name
ORDER BY 
    Total_Income DESC;
    
    
-- Events that have no registrations
SELECT 
    E.Event_Name
FROM 
    Events E
LEFT JOIN Registrations R ON E.Event_Id = R.Event_Id
WHERE 
    R.Registration_Id IS NULL;





