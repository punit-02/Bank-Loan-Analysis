use bank_db;
create table loan(
id	int,
address_state varchar(100),
application_type varchar(100),
emp_length	varchar(100),
emp_title	varchar(100),
grade	varchar(100),
home_ownership	varchar(100),
issue_date Date,	
last_credit_pull_date	date,
last_payment_date	date,
loan_status	varchar(100),
next_payment_date	date,
member_id	int ,
purpose	varchar(100),
sub_grade	varchar(100),
term	varchar(100),
verification_status	varchar(100),
annual_income	double,
dti int,
installment	int,
int_rate	int,
loan_amount	int,
total_acc	int,
total_payment int);

load data infile "D:/Power BI/Project - Bank Loan Report(SQL,BI)/financial_loan 1.csv"
into table loan_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from loan_data;

# creating stored procedure 
delimiter $$
create procedure select_loan_data()
begin
     select * from loan_data;
end $$
delimiter ;

-- Total Loan Applications
select count(id) as Total_loan_application from loan_data;
-- MTD Total Loan Applications
select count(id) as MTD_Total_loan_application from loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;
-- PMTD Total Loan Applications
select count(id) as PMTD_Total_loan_application from loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Funded Amount
select sum(loan_amount) as Total_funded_amount from loan_data;
-- MTD Total Funded Amount
select sum(loan_amount) as MTD_Total_funded_amount from loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;
-- PMTD Total Funded Amount
select sum(loan_amount) as PMTD_Total_funded_amount from loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Amount Received
select sum(total_payment) as Total_amount_received from loan_data;
-- MTD Total Amount Received
select sum(total_payment) as MTD_total_amount_received from loan_data
where month(issue_date)=12 and year(issue_date)=2021;
-- PMTD Total Amount Received
select sum(total_payment) as PMTD_otal_amount_received from loan_data
where month(issue_date) = 11 and year(issue_date) =2021;

-- Average Interest Rate
select round((avg(int_rate)*100),2) as Aveerage_interest_rate from loan_data;
-- MTD Average Interest Rate
select round(avg(int_rate)*100,2) as MTD_average_interest_rate from loan_data
where month(issue_date)=12 and year(issue_date)=2021;
-- PMTD Average Interest Rate
select round(avg(int_rate)*100,2) as PMTD_average_interest_rate from loan_data
where month(issue_date)=11 and year(issue_date)=2021;

-- Average Debit to Income
select truncate(avg(dti)*100,2) as Average_DTI from loan_data;
-- MTD Average Debit to Income
select truncate(avg(dti)*100,2) as MTD_Average_DTI from loan_data
where month(issue_date) =12 and year(issue_date)=2021;
-- PMTD Average Debit to Income
select truncate(avg(dti)*100,2) as PMTD_Average_DTI from loan_data
where month(issue_date) =11 and  year(issue_date) =2021;

# GOOD LOAN ISSUED
-- Good Loan Percentage
select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100)/
count(id) as Good_loan_percentage from loan_data;
-- Good Loan Application
select count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) 
as Good_loan_application from loan_data;
-- Good Loan Funded Amount
select sum(loan_amount) as Good_loan_funded_amount  from loan_data 
where loan_status in('Fully Paid','Current');
-- Good Loan Amount Received
select sum(total_payment) as Good_loan_amount_recived from loan_data 
where loan_status = 'Fully Paid' or loan_status = 'Current';

# BAD LOAN ISSUED
-- Bad Loan Percentage
select (select count(id) from loan_data where loan_status = 'Charged Off') / count(id)*100 as 
Bad_loan_percentage from loan_data;
-- Bad Loan Application
select count(id) as Bad_loan_appliaction from loan_data
where loan_status = 'Charged Off';
-- Bad Loan Funded Amount
select sum(loan_amount) as Bad_loan_funded_amount from loan_data
where loan_status = 'Charged Off';
-- Bad Loan Amount Received
select sum(total_payment) as Bad_loan_amount_received from loan_data
where loan_status = 'Charged Off';

# LOAN STATUS
SELECT 
IFNULL(loan_status,'TOTAL') AS Loan_status,
COUNT(id) AS Loan_count,
SUM(total_payment) AS Total_amount_received,
SUM(loan_amount) AS Total_loan_amount,
AVG(int_rate*100) AS Interest_rate,
AVG(dti*100) AS DTI FROM loan_data 
GROUP BY loan_status WITH ROLLUP;

SELECT 
IFNULL(loan_status,'Total') AS Loan_status,
SUM(total_payment) AS MTD_amount_received,
SUM(loan_amount) AS MTD_toatal_funded_amount 
FROM loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 
GROUP BY loan_status WITH ROLLUP;

# BANK LOAN REPORT | OVERVIEW
-- Month Wise
SELECT 
	MONTH(issue_date) AS Month_Number, 
	MONTHNAME(issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY  MONTH(issue_date),MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- STATE WISE 
SELECT 
    ROW_NUMBER() OVER(order by address_state) AS Sr_No,
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY address_state
ORDER BY address_state;

-- TERM-WISE
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY term
ORDER BY term;

-- Employment Length
SELECT 
	emp_length AS Employment_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- PURPOSE 
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY purpose
ORDER BY purpose;

-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY home_ownership
ORDER BY home_ownership;











