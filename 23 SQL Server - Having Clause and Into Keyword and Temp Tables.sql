USE IBANK

SELECT TOP 10 * from AMASTER

SELECT TOP 10 PERCENT * from AMASTER

--Latest ten rows
SELECT TOP 10 * from AMASTER ORDER BY DOO desc

--Findout month wise no of accounts open
SELECT DATEPART(mm,DOO) MonthNo,DATENAME(mm,DOO) MonthName, COUNT(*) as NoOfACC
from AMASTER
WHERE DATEPART(YYYY,DOO) = 2011
GROUP BY DATEPART(mm,DOO),DATENAME(mm,DOO)
ORDER BY MonthNo

--Product wise number of customers in BR1
SELECT PID,COUNT(*) as Customers
FROM AMASTER
WHERE BRID = 'BR1'
GROUP BY PID

SELECT PID,COUNT(*) as Customers, SUM(cbal) as Balence
FROM AMASTER
WHERE BRID = 'BR1'
GROUP BY PID

/*  
Product wise number of customers in BR1
Provide details if number of customers exceeds 5
*/
SELECT PID,COUNT(*) as Cnt
FROM AMASTER
WHERE BRID = 'BR1'
GROUP BY PID
HAVING COUNT(*) >5

/*
Branch wise total AMOUNT in the month of January
Provide details if TOTAL AMOUNT exceeds 5000
*/
SELECT BRID,SUM(CBAL)
FROM AMASTER
WHERE DATEPART(MM,DOO) = 1
GROUP BY BRID
HAVING SUM(CBAL)>5000
/* Brach wise total amount in the moth of OCTOBER.
PROVIDE details if BRANCH = BR2
*/
SELECT BRID,SUM(CBAL) as CBL
FROM AMASTER
WHERE  DATEPART(MM,DOO) = 7
GROUP BY BRID
HAVING BRID = 'BR5'
---OR----
--NOT RECOMENDED
SELECT BRID,SUM(CBAL) as CBL
FROM AMASTER
WHERE  DATEPART(MM,DOO) = 7 AND BRID = 'BR5'
GROUP BY BRID


