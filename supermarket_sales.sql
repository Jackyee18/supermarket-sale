--- REVIEW DATA
SELECT * FROM supermarket_sales
--- WHAT IS THE DURATION REPORT
SELECT MIN(Date) AS Date_Start, Max(Date) AS Date_End
FROM supermarket_sales
--- WHAT IS THE TOTAL ORDER IN THIS DURATION
SELECT COUNT(Invoice_ID) AS Total_Orders
FROM supermarket_sales
--- WHAT IS THE TOTAL SALES IN THIS DURATION
SELECT SUM(Total) AS Total_Sales
FROM supermarket_sales
--- WHAT IS THE TOTAL INCOME IN THIS DURATION
SELECT SUM(gross_income) AS Total_Income
FROM supermarket_sales
--- WHAT PRODUCT LINES ARE OUR BUSINESS
SELECT DISTINCT(Product_line)
FROM supermarket_sales 
--- WHICH CITIES ARE WE DOING BUSINESS
SELECT DISTINCT(City)
FROM supermarket_sales
--- WHICH PAYMENTS DO WE ACCEPT IN BUSINESS
SELECT DISTINCT(Payment)
FROM supermarket_sales
--- ORDER COUNTS BY BRANCHES
SELECT Branch, COUNT(Branch) as Order_Counts
FROM supermarket_sales
GROUP BY Branch
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY CITIES
SELECT City, COUNT(City) as Order_Counts
FROM supermarket_sales
GROUP BY City
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY CUSTOMER TYPES
SELECT Customer_type, COUNT(Customer_type) as Order_Counts
FROM supermarket_sales
GROUP BY Customer_type
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY GENDER
SELECT Gender, COUNT(Gender) as Order_Counts
FROM supermarket_sales
GROUP BY Gender
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY PRODUCT LINES
SELECT Product_line, COUNT(Product_line) as Order_Counts
FROM supermarket_sales
GROUP BY Product_line
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY DATE
SELECT Date, COUNT(Date) as Order_Counts
FROM supermarket_sales
GROUP BY Date
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY TIME
SELECT Time, COUNT(Time) as Order_Counts
FROM supermarket_sales
GROUP BY Time
ORDER BY Order_Counts DESC
--- ORDER COUNTS BY PAYMENT
SELECT Payment, COUNT(Payment) as Order_Counts
FROM supermarket_sales
GROUP BY Payment
ORDER BY Order_Counts DESC
--- TOTAL SALES BY BRANCHES
SELECT Branch, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Branch
ORDER BY Total_Sales DESC

WITH a(branch,total_sales_per_branch) AS (SELECT Branch, SUM(Total) AS total_sales_per_branch FROM supermarket_sales GROUP BY Branch), 
	b(total_sales) AS (SELECT SUM(total_sales_per_branch) AS total_sales from a)
SELECT a.branch, ROUND(a.total_sales_per_branch,2) AS Total_sales_per_branch, CONCAT(ROUND((a.total_sales_per_branch / b.total_sales *100),2),'%') AS by_percent
FROM a, b
ORDER BY 2 DESC
--- TOTAL SALES BY CITIES
SELECT City, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY City
ORDER BY Total_Sales DESC

WITH a(city,total_sales_per_city) AS (SELECT city, SUM(Total) AS total_sales_per_city FROM supermarket_sales GROUP BY city), 
	b(total_sales) AS (SELECT SUM(total_sales_per_city) AS total_sales from a)
SELECT a.city, ROUND(a.total_sales_per_city,2) AS Total_sales_per_city, CONCAT(ROUND((a.total_sales_per_city / b.total_sales *100),2),'%') AS by_percent
FROM a, b
ORDER BY 2 DESC
--- TOTAL SALES BY CUSTOMER TYPES
SELECT Customer_type, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Customer_type
ORDER BY Total_Sales DESC

WITH a(customer_type,total_sales_per_customer_type) AS (SELECT customer_type, SUM(Total) AS total_sales_per_customer_type FROM supermarket_sales GROUP BY customer_type), 
	b(total_sales) AS (SELECT SUM(total_sales_per_customer_type) AS total_sales from a)
SELECT a.customer_type, ROUND(a.total_sales_per_customer_type,2) AS Total_sales_per_customer_type, CONCAT(ROUND((a.total_sales_per_customer_type / b.total_sales *100),2),'%') AS by_percent
FROM a, b
ORDER BY 2
--- TOTAL SALES BY GENDER
SELECT Gender, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Gender
ORDER BY Total_Sales DESC

WITH a(gender,total_sales_per_gender) AS (SELECT gender, SUM(Total) AS total_sales_per_gender FROM supermarket_sales GROUP BY gender), 
	b(total_sales) AS (SELECT SUM(total_sales_per_gender) AS total_sales from a)
SELECT a.gender, ROUND(a.total_sales_per_gender,2) AS Total_sales_per_gender, CONCAT(ROUND((a.total_sales_per_gender / b.total_sales *100),2),'%') AS by_percent
FROM a, b
ORDER BY 2 DESC
--- TOTAL SALES BY PRODUCT LINES
SELECT Product_line, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Product_line
ORDER BY Total_Sales DESC

WITH a(product_line,total_sales_per_product_line) AS (SELECT Product_line, SUM(Total) AS total_sales_per_product_line FROM supermarket_sales GROUP BY Product_line), 
	b(total_sales) AS (SELECT SUM(total_sales_per_product_line) AS total_sales from a)
SELECT a.product_line, ROUND(a.total_sales_per_product_line,2) AS Total_sales_per_product_line, CONCAT(ROUND((a.total_sales_per_product_line / b.total_sales *100),2),'%') AS by_percent
FROM a, b
ORDER BY 2 DESC
--- TOTAL SALES BY DATE
SELECT Date, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Date
ORDER BY Total_Sales DESC
--- TOTAL SALES BY TIME
SELECT Time, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Time
ORDER BY Total_Sales DESC
--- TOTAL SALES BY PAYMENT
SELECT Payment, SUM(Total) as Total_Sales
FROM supermarket_sales
GROUP BY Payment
ORDER BY Total_Sales DESC
--- TOTAL INCOME BY BRANCHES
SELECT Branch, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY Branch
ORDER BY Total_Gross_Income DESC
--- TOTAL INCOME BY CITIES
SELECT City, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY City
ORDER BY Total_Gross_Income DESC
--- TOTAL INCOME BY CUSTOMER TYPES
SELECT Customer_type, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY Customer_type
ORDER BY Total_Gross_Income DESC
--- TOTAL INCOME BY GENDER
SELECT Gender, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY Gender
ORDER BY Total_Gross_Income DESC

SELECT gender,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY gender
ORDER BY 5
--- TOTAL INCOME BY PRODUCT LINES
SELECT Product_line, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY Product_line
ORDER BY Total_Gross_Income DESC
--- TOTAL INCOME BY PAYMENT
SELECT Payment, SUM(gross_income) as Total_Gross_Income
FROM supermarket_sales
GROUP BY Payment
ORDER BY Total_Gross_Income DESC
--- TOTAL INCOME BY DATE (OVER 3 MONTHS)
WITH cte AS
(SELECT CASE WHEN MONTH(date) = 1 THEN  'Jan'
		WHEN MONTH(date) = 2 THEN  'Feb'
		WHEN MONTH(date) = 3 THEN  'Mar' END as Month, *
FROM supermarket_sales)
SELECT Month, SUM(gross_income) AS Income_of_month
FROM cte
GROUP BY Month
--- TOTAL INCOME BY TIME (NOTE: MORNING, AFTERNOON, EVENING)
WITH cte  AS 
	(SELECT CASE WHEN Time <= '12:00' THEN 'Morning'
			WHEN Time BETWEEN '12:00' AND '18:00' THEN 'Afternoon'
			ELSE 'Evening' END AS times_of_day, 
			gross_income
	FROM supermarket_sales)
SELECT times_of_day, SUM(gross_income) AS Total_income_in_a_day
FROM cte
GROUP BY times_of_day

----- TOTAL ORDERS OVER 3 MONTHS
---- BY BRANCH
SELECT Branch,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY Branch
ORDER BY 5
---- BY CITIES
SELECT city,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY city
ORDER BY 5
---- BY CUSTOMER TYPES
SELECT customer_type,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY customer_type
ORDER BY 5
---- BY GENDERS
SELECT Gender,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY Gender
ORDER BY 5
---- BY PRODUCT LINES
SELECT product_line,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY product_line
ORDER BY 5
---- BY PAYMENTS
SELECT Payment,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) AS Orders_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) AS Orders_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Orders_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  1 ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  1 ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  1 ELSE 0 END) AS Total_orders
FROM supermarket_sales
GROUP BY Payment
ORDER BY 5
--- TOTAL SALES OVER 3 MONTHS
---- BY BRANCH
SELECT Branch,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY Branch
ORDER BY 5
---- BY CITIES
SELECT city,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY city
ORDER BY 5
---- BY CUSTOMER TYPES
SELECT customer_type,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY customer_type
ORDER BY 5
---- BY GENDERS
SELECT Gender,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY Gender
ORDER BY 5
---- BY PRODUCT LINES
SELECT product_line,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY product_line
ORDER BY 5
---- BY PAYMENTS
SELECT Payment,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) AS Sales_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) AS Sales_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Sales_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  Total ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  Total ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  Total ELSE 0 END) AS Total_Total
FROM supermarket_sales
GROUP BY Payment
ORDER BY 5
--- TOTAL INCOME OVER 3 MONTHS
---- BY BRANCH
SELECT Branch,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY Branch
ORDER BY 5
---- BY CITIES
SELECT city,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY city
ORDER BY 5
---- BY CUSTOMER TYPES
SELECT customer_type,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY customer_type
ORDER BY 5
---- BY GENDERS
SELECT Gender,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY Gender
ORDER BY 5
---- BY PRODUCT LINES
SELECT product_line,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY product_line
ORDER BY 5
---- BY PAYMENTS
SELECT Payment,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
		SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
		SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
		SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
FROM supermarket_sales
GROUP BY Payment
ORDER BY 5
--- WHICH PRODUCT LINE IS BETTER THAN THE AVERAGE INCOME PER PRODUCT LINE
WITH income_per_product_line(Product_line,income_per_product_line) AS
		(SELECT Product_line, SUM(gross_income) AS income_per_product_line
		FROM supermarket_sales
		GROUP BY Product_line),
	avg_income_per_product_line(avg_income_per_product_line) AS
		(SELECT AVG(income_per_product_line)
		FROM income_per_product_line)
	SELECT Product_line, income_per_product_line
	FROM income_per_product_line x
	JOIN  avg_income_per_product_line y
	ON x.income_per_product_line > y.avg_income_per_product_line
--- WHICH BRANCH IS BETTER THAN THE AVERAGE INCOME ACROSS ALL STORES
WITH income_per_branch (Branch,income_per_branch) AS
		(SELECT Branch, sum(gross_income) AS income_per_branch
		FROM supermarket_sales
		GROUP BY Branch), 
	avg_income_per_branch (avg_income) AS
		(SELECT avg(income_per_branch) AS avg_income
		FROM income_per_branch)
SELECT x.Branch, x.income_per_branch, y.avg_income
FROM income_per_branch x
JOIN avg_income_per_branch y
ON x.income_per_branch  > y.avg_income
--- WHICH SESSION OF THE THE DAY IS MORE PROFITABLE
WITH income_during_day(income,times_of_day) AS 
		(SELECT gross_income,
		CASE WHEN Time <= '12:00' THEN 'Morning'
		WHEN Time BETWEEN '12:00' AND '18:00' THEN 'Afternoon'
		ELSE 'Evening'
		END AS times_of_day
		FROM supermarket_sales),
	total_income_during_day(total_income,times_of_day) AS
		(SELECT SUM(income), times_of_day
		FROM income_during_day
		GROUP BY times_of_day),
	avg_income_during_day(avg_income_during_day) AS
		(SELECT AVG(total_income) AS avg_income_during_day
		FROM total_income_during_day)
SELECT x.times_of_day, x.total_income, y.avg_income_during_day
FROM total_income_during_day x
JOIN avg_income_during_day y
ON x.total_income > y.avg_income_during_day
--- WHICH SESSION OF THE THE DAY IS MORE PROFITABLE (ALL SESSION OF THE DAY)
WITH income_during_day(income,times_of_day) AS 
		(SELECT gross_income,
		CASE WHEN Time <= '12:00' THEN 'Morning'
		WHEN Time BETWEEN '12:00' AND '18:00' THEN 'Afternoon'
		ELSE 'Evening'
		END AS times_of_day
		FROM supermarket_sales),
	total_income_during_day(total_income,times_of_day) AS
		(SELECT sum(income), times_of_day
		FROM income_during_day
		GROUP BY times_of_day),
	avg_income_during_day(avg_income_during_day) AS
		(SELECT AVG(total_income) AS avg_income_during_day
		FROM total_income_during_day)
SELECT x.times_of_day, x.total_income, y.avg_income_during_day,
	CASE WHEN x.total_income > y.avg_income_during_day THEN 'good'
	ELSE 'bad'
	END AS note
FROM total_income_during_day x, avg_income_during_day y
--- WHICH MONTH IS BETTER THAN THE AVERAGE INCOMES OVER 3 MONTHS
WITH income_per_month (income,month) AS 
		(SELECT gross_income,
		CASE WHEN MONTH(Date) = 1 THEN 'Jan'
		WHEN MONTH(Date) = 2 THEN 'Feb'
		ELSE 'Mar'
		END AS month_of_date
		FROM supermarket_sales),
	total_income_per_month(month,total_income) AS
		(SELECT month, sum(income)
		FROM income_per_month
		GROUP BY month),
	avg_total_income_per_month(avg_total_income_per_month) AS
		(SELECT cast(avg(total_income) AS int) 
		FROM total_income_per_month)
SELECT x.month, x.total_income, avg_total_income_per_month
FROM total_income_per_month x
JOIN avg_total_income_per_month y
ON x.total_income > y.avg_total_income_per_month
--- WHICH MONTH IS BETTER THAN THE AVERAGE INCOMES OVER 3 MONTHS
WITH income_per_month (income,month) as 
		(SELECT gross_income,
		CASE WHEN MONTH(Date) = 1 THEN 'Jan'
		WHEN MONTH(Date) = 2 THEN 'Feb'
		ELSE 'Mar'
		END AS month_of_date
		FROM supermarket_sales),
	total_income_per_month(month,total_income) AS
		(SELECT month, sum(income)
		FROM income_per_month
		GROUP BY month),
	avg_total_income_per_month(avg_total_income_per_month) AS
		(SELECT CAST(AVG(total_income) AS int) 
		FROM total_income_per_month)
SELECT x.month, x.total_income, y.avg_total_income_per_month,
	CASE WHEN x.total_income > y.avg_total_income_per_month THEN 'good'
	ELSE 'bad'
	END AS note
FROM total_income_per_month x, avg_total_income_per_month y
--- TOTAL SALES PER MONTHS BY PERCENT
WITH a(month,total_sales_per_month) AS 
		(SELECT FORMAT(Date,'MMM'), SUM(total) FROM supermarket_sales GROUP BY FORMAT(Date,'MMM')),
	b(total_sales) AS 
		(SELECT SUM(total_sales_per_month) FROM a)
SELECT a.month, a.total_sales_per_month, CONCAT(CAST((ROUND((a.total_sales_per_month / b.total_sales *100),2)) AS decimal(5,2)),'%') AS By_percent
FROM a, b
ORDER BY 2 DESC
--- A TREND IN TOTAL INCOME OVER 3 MONTHS
WITH a(month,gross_income_per_month) AS 
		(SELECT MONTH(Date), SUM(gross_income) FROM supermarket_sales GROUP BY MONTH(Date)),
	b(month,current_month_income,last_month_income) AS 
		(SELECT month,gross_income_per_month, LAG(gross_income_per_month) OVER(ORDER BY MONTH) FROM a)
SELECT month, current_month_income, ISNULL(last_month_income,0) AS last_month_income,
	CONCAT((ISNULL((CAST(ROUND(((current_month_income - last_month_income) / last_month_income),2) AS decimal (5,2))),0)),'%') AS growth_rate
FROM b
--- A TREND IN TOTAL SALES OVER 3 MONTHS
WITH a(month,total_sales_per_month) AS 
		(SELECT MONTH(Date), SUM(total) FROM supermarket_sales GROUP BY MONTH(Date)),
	b(month,current_month_sales,last_month_sales) AS 
		(SELECT month,total_sales_per_month, LAG(total_sales_per_month) OVER(ORDER BY MONTH) FROM a)
SELECT month, current_month_sales, ISNULL(last_month_sales,0) AS last_month_sales,
	CONCAT((ISNULL((CAST(ROUND(((current_month_sales- last_month_sales) / last_month_sales),2) AS decimal (5,2))),0)),'%') AS growth_rate
FROM b
--- TOTAL INCOME PER MONTHS BY PERCENT
WITH a(month,total_income_per_month) AS 
		(SELECT FORMAT(Date,'MMM'), SUM(gross_income) FROM supermarket_sales GROUP BY FORMAT(Date,'MMM')),
	b(total_income) AS 
		(SELECT SUM(total_income_per_month) FROM a)
SELECT a.month, a.total_income_per_month, CONCAT(CAST((ROUND((a.total_income_per_month / b.total_income *100),2)) AS decimal(5,2)),'%') AS By_percent
FROM a, b
--- TOTAL SALES AND TOTAL INCOME OVER THREE MONTH (BY VALUE AND BY PERCENT)
WITH a(month,total_sales_per_month) AS 
		(SELECT FORMAT(Date,'MMM'), SUM(total) FROM supermarket_sales GROUP BY FORMAT(Date,'MMM')),
	b(total_sales) AS 
		(SELECT SUM(total_sales_per_month) FROM a),
	c(month,total_sales_per_month,by_percent) AS 
		(SELECT a.month, a.total_sales_per_month, CONCAT(CAST((ROUND((a.total_sales_per_month / b.total_sales *100),2)) AS decimal(5,2)),'%') FROM a, b),
	d(month,total_income_per_month) AS 
		(SELECT FORMAT(Date,'MMM'), SUM(gross_income) FROM supermarket_sales GROUP BY FORMAT(Date,'MMM')),
	e(total_income) AS 
		(SELECT SUM(total_income_per_month) FROM d),
	f(month,total_income_per_month,by_percent) AS 
		(SELECT d.month, d.total_income_per_month, CONCAT(CAST((ROUND((d.total_income_per_month / e.total_income *100),2)) AS decimal(5,2)),'%') FROM d, e)
SELECT c.month, c.total_sales_per_month, c.by_percent, f.total_income_per_month, f.by_percent
FROM c
JOIN f
ON c.month = f.month
ORDER BY 4 DESC







WITH CTE AS(SELECT Payment,
			SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) AS Income_of_Jan,
			SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) AS Income_of_Feb,
			SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Income_of_Mar,
			SUM(CASE WHEN MONTH(date) = 1 THEN  gross_income ELSE 0 END) + SUM(CASE WHEN MONTH(date) = 2 THEN  gross_income ELSE 0 END) +SUM(CASE WHEN MONTH(date) = 3 THEN  gross_income ELSE 0 END) AS Total_gross_income
		FROM supermarket_sales
		GROUP BY Payment),
	Total AS (SELECT Income_of_Jan + SUMIncome_of_Feb) + SUM(Income_of_Mar) AS Total_income
			FROM CTE)
SELECT Income_of_Jan, Income_of_Feb, Income_of_Mar FROM CTE
UNION
SELECT Total_income_of_Jan, Total_income_of_Feb, Total_income_of_Mar FROM Total



--- HOW TO FIND A TREND IN DATE AND TIME 
--- A.WHICH TIMES OF DAY HAS THE MOST ORDERS? 
--- 1. DEFINING A CONDITION ABOUT TIMES OF DAY
SELECT Invoice_ID, Time, Total, gross_income,
	CASE WHEN Time <= '12:00' THEN 'Morning'
    WHEN Time BETWEEN '12:00' AND '18:00' THEN 'Afternoon'
    ELSE 'Evening'
	END AS times_of_day
FROM supermarket_sales

--- 2. CREATE A TEMP TABLE
DROP TABLE IF EXISTS #temp_table
CREATE TABLE #temp_table(
InvoiceID nvarchar(50),
Time time,
Total float,
gross_income float,
Times_of_day varchar(50))

--- 3.INSERT VALUES INTO TEMP TABLE
INSERT INTO #temp_table 
SELECT Invoice_ID, Time, Total, gross_income,
	CASE WHEN Time <= '12:00' THEN 'Morning'
    WHEN Time BETWEEN '12:00' AND '18:00' THEN 'Afternoon'
    ELSE 'Evening'
	END AS times_of_day
FROM supermarket_sales

--- 4. ORDERS BY TIMES OF A DAY 
SELECT Times_of_day, COUNT(Times_of_day) AS Order_During_A_Day
FROM #temp_table
GROUP BY Times_of_day
ORDER BY Order_During_A_Day DESC

--- 5. TOTAL SALES BY TIMES OF A DAY 
SELECT Times_of_day, SUM(Total) AS Total_Sales_During_A_Day
FROM #temp_table
GROUP BY Times_of_day
ORDER BY Total_Sales_During_A_Day DESC

--- 6. TOTAL INCOME BY TIMES OF A DAY 
SELECT Times_of_day, SUM(gross_income) AS Gross_Income_During_A_Day
FROM #temp_table
GROUP BY Times_of_day
ORDER BY Gross_Income_During_A_Day DESC

--- B.WHICH MONTHS OF THE DURATION HAS THE MOST ORDERS? 
--- 1. DEFINING A CONDITION ABOUT MONTH OF THE DATE
SELECT Invoice_ID, Date, Total, gross_income,
	CASE WHEN Date <= '2019-01-31' THEN 'Jan'
    WHEN Date <= '2019-02-28' THEN 'Feb'
    ELSE 'Mar'
	END AS month_of_date
FROM supermarket_sales

--- 2. CREATE A TEMP TABLE
DROP TABLE IF EXISTS #temp_table1
CREATE TABLE #temp_table1(
InvoiceID nvarchar(50),
Date date,
Total float,
gross_income float,
month_of_date varchar(50))

--- 3.INSERT VALUES INTO TEMP TABLE
INSERT INTO #temp_table1
SELECT Invoice_ID, Date, Total, gross_income,
	CASE WHEN Date <= '2019-01-31' THEN 'Jan'
    WHEN Date <= '2019-02-28' THEN 'Feb'
    ELSE 'Mar'
	END AS month_of_date
FROM supermarket_sales

--- 4. ORDERS BY TIMES OF A DAY 
SELECT month_of_date, COUNT(month_of_date) AS Orders_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Orders_Of_Month DESC

--- 5. TOTAL SALES BY TIMES OF A DAY 
SELECT month_of_date, SUM(Total) AS Total_Sales_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Total_Sales_Of_Month DESC

--- 6. TOTAL INCOME BY TIMES OF A DAY 
SELECT month_of_date, SUM(gross_income) AS Gross_Income_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Gross_Income_Of_Month DESC

--- B.WHICH MONTHS OF THE DURATION HAS THE MOST ORDERS? 
--- 1. DEFINING A CONDITION ABOUT MONTH OF THE DATE
SELECT Invoice_ID, Date, Total, gross_income,
	CASE WHEN Date <= '2019-01-31' THEN 'Jan'
    WHEN Date <= '2019-02-28' THEN 'Feb'
    ELSE 'Mar'
	END AS month_of_date
FROM supermarket_sales

--- 2. CREATE A TEMP TABLE
DROP TABLE IF EXISTS #temp_table1
CREATE TABLE #temp_table1(
InvoiceID nvarchar(50),
Date date,
Total float,
gross_income float,
month_of_date varchar(50))

--- 3.INSERT VALUES INTO TEMP TABLE
INSERT INTO #temp_table1
SELECT Invoice_ID, Date, Total, gross_income,
	CASE WHEN Date <= '2019-01-31' THEN 'Jan'
    WHEN Date <= '2019-02-28' THEN 'Feb'
    ELSE 'Mar'
	END AS month_of_date
FROM supermarket_sales

--- 4. ORDERS BY TIMES OF A DAY 
SELECT month_of_date, COUNT(month_of_date) AS Orders_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Orders_Of_Month DESC

--- 5. TOTAL SALES BY TIMES OF A DAY 
SELECT month_of_date, SUM(Total) AS Total_Sales_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Total_Sales_Of_Month DESC

--- 6. TOTAL INCOME BY TIMES OF A DAY 
SELECT month_of_date, SUM(gross_income) AS Gross_Income_Of_Month
FROM #temp_table1
GROUP BY month_of_date
ORDER BY Gross_Income_Of_Month DESC
