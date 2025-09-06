-- Consider a table named events with the following columns: event_id, event_name, start_date, and end_date. 

-- Create the events table
CREATE TABLE IF NOT EXISTS events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Insert 100 records with some overlapping dates
INSERT INTO events (event_name, start_date, end_date) VALUES
-- January events (some overlapping)
('New Year Conference', '2024-01-01', '2024-01-05'),
('Winter Workshop', '2024-01-03', '2024-01-07'),
('Tech Summit', '2024-01-06', '2024-01-10'),
('Data Science Meetup', '2024-01-08', '2024-01-12'),
('AI Conference', '2024-01-11', '2024-01-15'),

-- February events (some overlapping)
('Valentine Workshop', '2024-02-10', '2024-02-14'),
('Love Tech Conference', '2024-02-12', '2024-02-16'),
('Winter Hackathon', '2024-02-15', '2024-02-19'),
('Cloud Summit', '2024-02-18', '2024-02-22'),
('Security Workshop', '2024-02-21', '2024-02-25'),

-- March events (some overlapping)
('Spring Conference', '2024-03-01', '2024-03-05'),
('DevOps Workshop', '2024-03-04', '2024-03-08'),
('Mobile Summit', '2024-03-07', '2024-03-11'),
('Web Development Meetup', '2024-03-10', '2024-03-14'),
('Database Workshop', '2024-03-13', '2024-03-17'),

-- April events (some overlapping)
('Easter Tech Fest', '2024-04-01', '2024-04-05'),
('Spring Workshop', '2024-04-04', '2024-04-08'),
('Blockchain Summit', '2024-04-07', '2024-04-11'),
('IoT Conference', '2024-04-10', '2024-04-14'),
('ML Workshop', '2024-04-13', '2024-04-17'),

-- May events (some overlapping)
('Summer Kickoff', '2024-05-01', '2024-05-05'),
('Agile Conference', '2024-05-04', '2024-05-08'),
('Testing Summit', '2024-05-07', '2024-05-11'),
('UX Workshop', '2024-05-10', '2024-05-14'),
('Frontend Conference', '2024-05-13', '2024-05-17'),

-- June events (some overlapping)
('Summer Tech Fest', '2024-06-01', '2024-06-05'),
('Backend Workshop', '2024-06-04', '2024-06-08'),
('API Summit', '2024-06-07', '2024-06-11'),
('Microservices Conference', '2024-06-10', '2024-06-14'),
('DevOps Summit', '2024-06-13', '2024-06-17'),

-- July events (some overlapping)
('Summer Conference', '2024-07-01', '2024-07-05'),
('Cloud Workshop', '2024-07-04', '2024-07-08'),
('Security Summit', '2024-07-07', '2024-07-11'),
('Networking Conference', '2024-07-10', '2024-07-14'),
('System Design Workshop', '2024-07-13', '2024-07-17'),

-- August events (some overlapping)
('Summer Workshop', '2024-08-01', '2024-08-05'),
('Data Engineering Summit', '2024-08-04', '2024-08-08'),
('Big Data Conference', '2024-08-07', '2024-08-11'),
('Analytics Workshop', '2024-08-10', '2024-08-14'),
('ML Summit', '2024-08-13', '2024-08-17'),

-- September events (some overlapping)
('Fall Conference', '2024-09-01', '2024-09-05'),
('AI Workshop', '2024-09-04', '2024-09-08'),
('Deep Learning Summit', '2024-09-07', '2024-09-11'),
('NLP Conference', '2024-09-10', '2024-09-14'),
('Computer Vision Workshop', '2024-09-13', '2024-09-17'),

-- October events (some overlapping)
('Halloween Tech Fest', '2024-10-01', '2024-10-05'),
('Fall Workshop', '2024-10-04', '2024-10-08'),
('Mobile Summit', '2024-10-07', '2024-10-11'),
('App Development Conference', '2024-10-10', '2024-10-14'),
('Game Dev Workshop', '2024-10-13', '2024-10-17'),

-- November events (some overlapping)
('Thanksgiving Tech', '2024-11-01', '2024-11-05'),
('Winter Workshop', '2024-11-04', '2024-11-08'),
('Holiday Summit', '2024-11-07', '2024-11-11'),
('Year-End Conference', '2024-11-10', '2024-11-14'),
('Planning Workshop', '2024-11-13', '2024-11-17'),

-- December events (some overlapping)
('Holiday Tech Fest', '2024-12-01', '2024-12-05'),
('Year-End Workshop', '2024-12-04', '2024-12-08'),
('New Year Summit', '2024-12-07', '2024-12-11'),
('Future Tech Conference', '2024-12-10', '2024-12-14'),
('Planning Summit', '2024-12-13', '2024-12-17'),

-- Additional events with various overlaps
('Quick Workshop 1', '2024-01-15', '2024-01-16'),
('Quick Workshop 2', '2024-01-16', '2024-01-17'),
('Quick Workshop 3', '2024-01-17', '2024-01-18'),
('Quick Workshop 4', '2024-01-18', '2024-01-19'),
('Quick Workshop 5', '2024-01-19', '2024-01-20'),

('Long Event 1', '2024-02-01', '2024-02-28'),
('Long Event 2', '2024-03-01', '2024-03-31'),
('Long Event 3', '2024-04-01', '2024-04-30'),
('Long Event 4', '2024-05-01', '2024-05-31'),
('Long Event 5', '2024-06-01', '2024-06-30'),

('Overlapping Series 1', '2024-07-01', '2024-07-10'),
('Overlapping Series 2', '2024-07-05', '2024-07-15'),
('Overlapping Series 3', '2024-07-10', '2024-07-20'),
('Overlapping Series 4', '2024-07-15', '2024-07-25'),
('Overlapping Series 5', '2024-07-20', '2024-07-30'),

('Back-to-Back 1', '2024-08-01', '2024-08-02'),
('Back-to-Back 2', '2024-08-02', '2024-08-03'),
('Back-to-Back 3', '2024-08-03', '2024-08-04'),
('Back-to-Back 4', '2024-08-04', '2024-08-05'),
('Back-to-Back 5', '2024-08-05', '2024-08-06'),

('Mixed Duration 1', '2024-09-01', '2024-09-03'),
('Mixed Duration 2', '2024-09-02', '2024-09-05'),
('Mixed Duration 3', '2024-09-03', '2024-09-07'),
('Mixed Duration 4', '2024-09-04', '2024-09-09'),
('Mixed Duration 5', '2024-09-05', '2024-09-11');

-- Query to find overlapping events
SELECT 
    e1.event_name as event1,
    e1.start_date as event1_start,
    e1.end_date as event1_end,
    e2.event_name as event2,
    e2.start_date as event2_start,
    e2.end_date as event2_end
FROM events e1
JOIN events e2 ON e1.event_id < e2.event_id
WHERE 
    (e1.start_date <= e2.end_date AND e1.end_date >= e2.start_date)
    OR (e1.start_date >= e2.start_date AND e1.start_date <= e2.end_date)
ORDER BY e1.start_date, e2.start_date;

-- The condition e1.event_id < e2.event_id ensures that we don't compare the same event with itself and avoid duplicate pairs.
-- the where clause checks for overlapping dates between the two events.