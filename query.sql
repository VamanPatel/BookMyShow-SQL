CREATE TABLE Theatre (
    Theatre_ID INT PRIMARY KEY,
    Theatre_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Movie (
    Movie_ID INT PRIMARY KEY,
    Movie_Name VARCHAR(100),
    Genre VARCHAR(50),
    Director VARCHAR(100),
    Release_Year INT
);

CREATE TABLE Show (
    Show_ID INT PRIMARY KEY,
    Theatre_ID INT,
    Movie_ID INT,
    Show_Date DATE,
    Show_Time TIME,
    FOREIGN KEY (Theatre_ID) REFERENCES Theatre(Theatre_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

INSERT INTO Theatre (Theatre_ID, Theatre_Name, Location)
VALUES (1, 'ABC Cinemas', 'New York');

INSERT INTO Movie (Movie_ID, Movie_Name, Genre, Director, Release_Year)
VALUES (1, 'Inception', 'Science Fiction', 'Christopher Nolan', 2010);


INSERT INTO Show (Show_ID, Theatre_ID, Movie_ID, Show_Date, Show_Time)
VALUES (2, 1, 1, '2024-05-02', '19:30:00'),
       (3, 1, 1, '2024-05-03', '20:00:00'),
       (4, 1, 1, '2024-05-04', '18:45:00'),
       (5, 1, 1, '2024-05-05', '21:15:00'),
       (6, 1, 1, '2024-05-06', '17:30:00'),
       (7, 1, 1, '2024-05-07', '19:00:00'),
       (8, 1, 1, '2024-05-08', '20:30:00');

-- Shows for May 2nd, 2024
SELECT m.Movie_Name, s.Show_Time
FROM Show s
JOIN Movie m ON s.Movie_ID = m.Movie_ID
WHERE s.Theatre_ID = 1
AND s.Show_Date = '2024-05-02';

