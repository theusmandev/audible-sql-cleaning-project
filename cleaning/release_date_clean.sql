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