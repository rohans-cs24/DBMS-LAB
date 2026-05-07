use diksha_bank;
SELECT branch_name
FROM Branch
WHERE assets > (
    SELECT MAX(assets)
    FROM Branch
    WHERE branch_city = 'Bangalore'
);