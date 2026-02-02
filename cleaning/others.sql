

select * from audible_uncleaned


UPDATE audible_uncleaned
SET author = REPLACE(author, 'Writtenby:', '');









/*
update audible_uncleaned
set stars = trim(left(stars,charindex(' out',stars)))
,
ratings = cast(substring(stars,charindex(stars,stars)+5,len(stars))) as int
where stars like '%out of%'

*/

UPDATE audible_uncleaned
SET 
    stars = TRIM(LEFT(stars, CHARINDEX(' out', stars))),
    ratings = TRY_CAST(SUBSTRING(stars, CHARINDEX('stars', stars) + 5, LEN(stars)) AS INT)
WHERE stars LIKE '%out of%';



alter table audible_uncleaned
add tem_stars varchar(250)


alter table audible_uncleaned
drop column ratings,tem_stars





ALTER TABLE audible_uncleaned
ADD temp_stars varchar(150);  


WITH t1 AS (
    SELECT stars, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM audible_uncleaned_orig
),
t2 AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM audible_uncleaned
)
UPDATE t2
SET t2.temp_stars = t1.stars
FROM t2
JOIN t1 ON t1.rn = t2.rn;




ALTER TABLE audible_uncleaned
ADD temp_stars varchar(150);  


update t2
set t2.temp_stars=t1.stars
from audible_uncleaned t2
join 
audible_uncleaned_orig t1
on
t1.name = t2.name
and
t1.author = t2.name


alter table audible_uncleaned
drop column temp_stars





-- Step 1: Pehle column add karein
ALTER TABLE audible_uncleaned
ADD temp_stars VARCHAR(150);
GO -- GO ka matlab hai ke pehle column ban jaye, phir agli query chale

-- Step 2: Ab data restore karein
UPDATE t2
SET t2.temp_stars = t1.stars
FROM audible_uncleaned t2
JOIN audible_uncleaned_orig t1 ON t1.name = t2.name 



alter table audible_uncleaned
add ratings varchar(150)



UPDATE audible_uncleaned
SET 
    ratings = SUBSTRING(temp_stars, CHARINDEX('stars', temp_stars) + 5, LEN(temp_stars))
WHERE temp_stars LIKE '%out of%';




update audible_uncleaned
set ratings = replace(ratings,'NULL','Not rated yet')


UPDATE audible_uncleaned
SET ratings = 'Not rated yet'
WHERE ratings IS NULL;



update audible_uncleaned
set ratings = replace(ratings,'ratings','')








update audible_uncleaned
set ratings = replace(ratings,'rating','')



update audible_uncleaned
set ratings = replace(ratings,'Not rated yet','0')




ALTER TABLE audible_uncleaned
ADD price_copy NVARCHAR(50);
go

UPDATE audible_uncleaned
SET price_copy = price





update audible_uncleaned
set price = replace(price,',','')


UPDATE audible_uncleaned
SET price = CAST(CAST(price AS DECIMAL(10,2)) AS INT)
WHERE price IS NOT NULL;





UPDATE audible_uncleaned
SET price_copy = CAST(CAST(REPLACE(price_copy, ',', '') AS DECIMAL(10,2)) AS INT)
WHERE price_copy IS NOT NULL AND ISNUMERIC(REPLACE(price_copy, ',', '')) = 1;




alter table audible_uncleaned
drop column price


alter table audible_uncleaned

EXEC sp_rename 'audible_uncleaned.price_copy', 'price', 'COLUMN';




alter table audible_uncleaned
drop column temp_stars



select * into audible_uncleaned_backup_2026_02_02
 from audible_uncleaned


 select * from audible_uncleaned_backup_2026_02_02
 select * from audible_uncleaned



 UPDATE audible_uncleaned
SET time = 
    CASE 
        -- Case 1: Both Hours and Minutes (e.g., '2 hrs and 20 mins')
        WHEN time LIKE '%hr%' AND time LIKE '%min%' THEN 
            (TRY_CAST(TRIM(LEFT(time, CHARINDEX('hr', time) - 1)) AS INT) * 60) + 
             TRY_CAST(TRIM(SUBSTRING(time, CHARINDEX('and', time) + 3, CHARINDEX('min', time) - CHARINDEX('and', time) - 3)) AS INT)
             
        -- Case 2: Only Hours (e.g., '10 hrs')
        WHEN time LIKE '%hr%' AND time NOT LIKE '%min%' THEN 
            TRY_CAST(TRIM(LEFT(time, CHARINDEX('hr', time) - 1)) AS INT) * 60
            
        -- Case 3: Only Minutes (e.g., '20 mins')
        WHEN time LIKE '%min%' AND time NOT LIKE '%hr%' THEN 
            TRY_CAST(TRIM(LEFT(time, CHARINDEX('min', time) - 1)) AS INT)
            
        ELSE 0 
    END;




    alter table audible_uncleaned
    alter column name nvarchar(max)


drop table audible_uncleaned
select * from audible_uncleaned


SELECT *
INTO audible_uncleaned
FROM audible_uncleaned_backup_2026_02_02;

select * from audible_uncleaned


UPDATE audible_uncleaned
SET time = 
    CASE 
        -- Case 1: Both Hours and Minutes (e.g., '2 hrs and 20 mins')
        WHEN time LIKE '%hr%' AND time LIKE '%min%' THEN 
            (TRY_CAST(TRIM(LEFT(time, CHARINDEX('hr', time) - 1)) AS INT) * 60) + 
             TRY_CAST(TRIM(SUBSTRING(time, CHARINDEX('and', time) + 3, CHARINDEX('min', time) - CHARINDEX('and', time) - 3)) AS INT)
             
        -- Case 2: Only Hours (e.g., '10 hrs')
        WHEN time LIKE '%hr%' AND time NOT LIKE '%min%' THEN 
            TRY_CAST(TRIM(LEFT(time, CHARINDEX('hr', time) - 1)) AS INT) * 60
            
        -- Case 3: Only Minutes (e.g., '20 mins')
        WHEN time LIKE '%min%' AND time NOT LIKE '%hr%' THEN 
            TRY_CAST(TRIM(LEFT(time, CHARINDEX('min', time) - 1)) AS INT)
            
        ELSE 0 
    END;






    UPDATE audible_uncleaned
SET releasedate = 
    CASE 
        -- Agar format '2008-04-08' (Standard) hai to waisa hi rehne dein
        WHEN releasedate LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]' THEN releasedate
        
        -- Agar format '13-01-10' (DD-MM-YY) hai
        WHEN releasedate LIKE '[0-9][0-9]-[0-9][0-9]-[0-9][0-9]' THEN 
            CONVERT(VARCHAR, CONVERT(DATE, releasedate, 3), 23)
            
        -- Agar format '30-10-2018' (DD-MM-YYYY) hai
        WHEN releasedate LIKE '[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]' THEN 
            CONVERT(VARCHAR, CONVERT(DATE, releasedate, 105), 23)
            
        -- Baqi formats ke liye TRY_CONVERT use karein
        ELSE CONVERT(VARCHAR, TRY_CONVERT(DATE, releasedate), 23)
    END;






update audible_uncleaned
set releasedate=
case 
when releasedate like '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]' then releasedate

when releasedate like '[0-9][0-9]-[0-9][0-9]-[0-9][0-9]' then
convert(varchar,convert(Date,releasedate,3),23)

when releasedate like '[0-9][0-9]'



BACKUP DATABASE Data_cleaning_projects
TO DISK = 'E:\git-workstation\Audiable-Data-Cleaning\Backup\Data_cleaning_projects.bak';


























EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;


create database Data_cleaning_projects
use Data_cleaning_projects


SELECT * INTO New_SQL_Table
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0; Database=E:\git-workstation\Audiable-Data-Cleaning\audible_uncleaned.csv', [Sheet1$]);



BULK INSERT dbo.audiable_cleaning
FROM 'E:\git-workstation\Audiable-Data-Cleaning\audible_uncleaned.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001'
);

BULK INSERT dbo.audiable_cleaning
FROM 'E:\git-workstation\Audiable-Data-Cleaning\audible_uncleaned.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FORMAT = 'CSV',              -- Lazmi hai ke ye pehle likha ho
    FIELDQUOTE = '"',            -- 'QUOTE' ki jagah 'FIELDQUOTE' try karein
    CODEPAGE = '65001',
    MAXERRORS = 100
);



TRUNCATE TABLE dbo.audiable_cleaning;

BULK INSERT dbo.audiable_cleaning
FROM 'E:\git-workstation\Audiable-Data-Cleaning\audible_uncleaned.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '0x0a', -- Windows ke liye '\n' bhi try kar sakte hain
    CODEPAGE = '65001',
    ERRORFILE = 'E:\git-workstation\Audiable-Data-Cleaning\import_errors.txt' -- Errors yahan save honge
);






DROP TABLE IF EXISTS dbo.audiable_cleaning;

CREATE TABLE dbo.audiable_cleaning
(
    name VARCHAR(500),        -- Book names lambay ho sakte hain
    author VARCHAR(500),
    narrator VARCHAR(500),
    time VARCHAR(100),
    releasedate VARCHAR(100),
    language VARCHAR(100),
    stars VARCHAR(100),
    price VARCHAR(100),       -- Price ko pehle varchar rakhein kyunki usme symbols ho sakte hain
    ratings VARCHAR(500)      -- Column 9: Isay bada rakha hai taake error na aaye
);


select * from dbo.audiable_cleaning


IF OBJECT_ID('dbo.audiable_cleaning', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.audiable_cleaning;
END;







EXEC sp_help 'audible_uncleaned';


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'audible_uncleaned';





SELECT c.name AS ColumnName, t.Name AS DataType, c.max_length, c.is_nullable
FROM sys.columns c
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE c.object_id = OBJECT_ID('audible_uncleaned');
