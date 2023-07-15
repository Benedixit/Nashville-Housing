SELECT * FROM dbo.[Nashville Housing];

--show all columns on the table	
SELECT name FROM sys.columns WHERE object_id = OBJECT_ID('Nashville Housing');


--remove constraint on table
ALTER TABLE dbo.[Nashville Housing] DROP CONSTRAINT [PK_Nashville Housing];


--remove UniqueID column
ALTER TABLE dbo.[Nashville Housing]
DROP COLUMN UniqueID;


--remove rows that is null with certain info
DELETE FROM dbo.[Nashville Housing] 
WHERE OwnerName IS NULL AND OwnerAddress IS NULL
OR YearBuilt IS NULL OR TotalValue IS NULL;

--SELECT * FROM sys.columns;



--find the data type for a column
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH AS MAX_LENGTH, 
    CHARACTER_OCTET_LENGTH AS OCTET_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Nashville Housing' 
AND COLUMN_NAME = 'TotalValue';

--Find the total value of building in each tax district
SELECT SUM(CONVERT(BIGINT, TotalValue)) AS Total_Value_Per_District, TaxDistrict FROM dbo.[Nashville Housing]
GROUP BY TaxDistrict
ORDER BY Total_Value_Per_District DESC;


--Find the number of houses built in each year
SELECT TOP 10 COUNT(DISTINCT(ParcelID)) AS [Number of Houses Built], YearBuilt FROM dbo.[Nashville Housing]
GROUP BY YearBuilt
ORDER BY [Number of Houses Built];
