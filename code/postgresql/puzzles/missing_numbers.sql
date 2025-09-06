-- From a table with only value
-- find the missing numbers in the range from 1 to 100

-- Create a table with 100 numbers
CREATE TABLE numbers (
    value INT
);

-- Insert 100 numbers into the table
INSERT INTO numbers (value) VALUES 
(2), (3), (5), (7), (8), (11), (12), (14), (15), (17),
(19), (21), (23), (25), (27), (29), (31), (32), (33), (35),
(37), (39), (41), (42), (44), (46), (48), (50), (51), (53),
(55), (57), (59), (60), (62), (64), (65), (67), (69), (70),
(72), (74), (75), (77), (78), (80), (82), (83), (85), (86),
(88), (89), (90), (91), (92), (93), (94), (95), (96), (97),
(98), (99), (100), (4), (6), (9), (10), (13), (16), (18),
(20);

-- Find the missing numbers in the range from 1 to 100
select distinct n1.value + 1 as missing_number 
	from numbers n1
	left join numbers n2
	  on n1.value + 1 = n2.value
	 where n2.value IS NULL
	 and n1.value < 100

--- need to compare consecutive numbers using the self join. The left join will generate a null value for the missing numbers.
--- n1.value exists as it is the left part of the joinbut may be not n1.value + 1 
-- LEFT JOIN numbers n2 ON n1.value + 1 = n2.value: finds matching pairs of consecutive numbers.
-- SELECT DISTINCT: ensures that each missing number is only listed once.
-- WHERE n2.value IS NULL AND n1.value < 100: filters out the rows where there is no match 
-- (i.e., the next number is missing) and ensures that we only consider values less than 100.