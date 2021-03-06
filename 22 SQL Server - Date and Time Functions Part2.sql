USE IBANK
--Year wise, Qtr wise, Month wise Total Balance 

select 	datepart(yy, doo) as YNo, 
	'Q'+cast (datepart(QQ, doo) as varchar) as QtrNo, 
	datename(mm, doo) as MonthNm, Sum(Cbal) as TotalBalance 
FROM AMASTER 
WHERE BRID = 'BR1' and datepart(yy,doo) = 2014
group by datepart(yy, doo), datepart(QQ, doo), datename(mm, doo) 
/*
5) DateAdd()
It adds/sub days (OR) monts (OR) years
to the given date and returns the future/past date.

The DATEADD() function adds a time/date interval to a date and then returns the date.
Syntax
DATEADD(interval, number, date)
interval	Required. The time/date interval to add. Can be one of the following values:
year, yyyy, yy = Year
quarter, qq, q = Quarter
month, mm, m = month
dayofyear, dy, y = Day of the year
day, dd, d = Day
week, ww, wk = Week
weekday, dw, w = Weekday
hour, hh = hour
minute, mi, n = Minute
second, ss, s = Second
millisecond, ms = Millisecond
number	Required. The number of interval to add to date. Can be positive (to get dates in the future) or negative (to get dates in the past)
date	Required. The date that will be modified
*/

select DATEADD(DD, -40,GETDATE())
select DATEADD(MM, -50,GETDATE())
select DATEADD(YY, -180,2020/3/22)

SELECT acid, name, cbal,doo as PaidOn, dateadd(mm,1,doo) as DueDate
from AMASTER


SELECT acid, name, cbal,doo as PaidOn, EOMONTH(DOO) as DueDate
from AMASTER

/*
EOMONTH(starting_date , months_to_add );  

Exercise 
Week-wise no. of accounts opened in last month 
List the names of account holders who have opened accounts in the last 5 days 
List Branch-wise, Product-wise TOTAL amount as on last Friday 
List the Customers, who opened accounts in the first week of last month. 
How many customers opened accounts in last date of previous Month? 

*/

--Week-wise no. of accounts opened in last month 
SELECT * from AMASTER

SELECT DATEPART(ww,DOO) as weeks,COUNT(*) as NoOfAcc
from AMASTER
WHERE DATEPART(MM,DOO) = DATEPART(MM,DATEADD(MM,-1,GETDATE())) 
GROUP BY DATEPART(ww,DOO)

SELECT DATEPART(MM,DOO) as ddd  
from AMASTER
WHERE DATEPART(MM,DOO) = DATEPART(MM,DATEADD(MM,-1,GETDATE()))

select DATEADD(MM,-1,GETDATE())

INSERT INTO AMASTER Values(164,'Bhargav','asdf','BR5','SB',DATEADD(MM,-1,GETDATE()),25000,30000,'O')

/*
1) Find out the Last month Name? 
2) Find out the last day of the Current month 
3) Find out the First day Name of the Current month 
4) Week-wise no. of accounts opened in last month 
5) List the names of account holders who have opened accounts in the last 5 days 
6) List Branch-wise, Product-wise TOTAL amount as on last Friday 
7) List the Customers, who opened accounts in the first week of last month. 
8) How many customers opened accounts in last date of previous Month? 

*/
