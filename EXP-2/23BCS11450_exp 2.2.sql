-- Create main data table
CREATE TABLE SalesData (
    sale_id INT,
    sale_year INT,
    revenue INT
);

-- Create query table
CREATE TABLE ReportQueries (
    sale_id INT,
    sale_year INT
);

-- Insert records into SalesData
INSERT INTO SalesData (sale_id, sale_year, revenue)
VALUES
(101, 2021, 500),
(105, 2022, 320),
(110, 2020, 450),
(101, 2020, 480),
(102, 2019, 150),
(103, 2018, 90),
(109, 2022, 700),
(105, 2021, 0);

-- Insert records into ReportQueries
INSERT INTO ReportQueries (sale_id, sale_year)
VALUES
(101, 2020),
(102, 2019),
(103, 2018),
(105, 2019),
(105, 2021),
(105, 2022),
(110, 2020);

-- Perform LEFT JOIN to get revenues or default to 0
SELECT 
    rq.sale_id,
    rq.sale_year,
    ISNULL(sd.revenue, 0) AS Revenue
FROM 
    ReportQueries rq
LEFT OUTER JOIN 
    SalesData sd
ON 
    rq.sale_id = sd.sale_id AND rq.sale_year = sd.sale_year;
