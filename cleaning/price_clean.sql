UPDATE audible_uncleaned
SET price = CAST(CAST(REPLACE(price, ',', '') AS DECIMAL(10,2)) AS INT)
WHERE price IS NOT NULL AND ISNUMERIC(REPLACE(price, ',', '')) = 1;