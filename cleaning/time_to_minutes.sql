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