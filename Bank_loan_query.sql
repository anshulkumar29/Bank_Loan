

DROP TABLE IF EXISTS loan_data;


CREATE TABLE loan_data (
    id INTEGER PRIMARY KEY,
    address_state VARCHAR(2),
    application_type VARCHAR(20),
    emp_length VARCHAR(20),
    emp_title TEXT,
    grade VARCHAR(1),
    home_ownership VARCHAR(10),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(20),
    next_payment_date DATE,
    member_id INTEGER,
    purpose VARCHAR(50),
    sub_grade VARCHAR(2),
    term VARCHAR(20),
    verification_status VARCHAR(20),
    annual_income DECIMAL(10,2),
    dti DECIMAL(5,4),
    installment DECIMAL(10,2),
    int_rate DECIMAL(5,4),
    loan_amount INTEGER,
    total_acc INTEGER,
    total_payment DECIMAL(10,2)
);

select * from loan_data


--A.	BANK LOAN REPORT | SUMMARY
--Total Loan Applications
SELECT COUNT(id) AS Total_Applications FROM loan_data


--MTD Loan Applications
SELECT count(*) as MTD_Loan_Applications
FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12;


--PMTD Loan Applications
SELECT COUNT(id) AS PMTD_Loan_Applications FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11;


--Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data

--MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11;

--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM loan_data

--MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11;

--Average Interest Rate
SELECT round(AVG(int_rate), 3)*100 AS Avg_Int_Rate FROM loan_data

--MTD Average Interest
SELECT round(AVG(int_rate), 4)*100 AS MTD_Avg_Int_Rate FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11;

--Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM loan_data

--MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11;


--GOOD LOAN ISSUED
--Good Loan Percentage


SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM loan_data

--Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


--BAD LOAN ISSUED
--Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM loan_data

 
--Bad Loan Applications
SELECT 
COUNT(id) AS Bad_Loan_Applications FROM loan_data
WHERE loan_status = 'Charged Off'
 
--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM loan_data
WHERE loan_status = 'Charged Off'
 
--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM loan_data
WHERE loan_status = 'Charged Off'


--LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        loan_data
    GROUP BY
        loan_status
 

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12
GROUP BY loan_status




--B.	BANK LOAN REPORT | OVERVIEW
--MONTH
SELECT
    EXTRACT(MONTH FROM issue_date) AS month_number,
    TO_CHAR(issue_date, 'Month') AS month_name,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
FROM loan_data
GROUP BY
    month_number,
    month_name
ORDER BY
    month_number;



--STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY address_state
ORDER BY address_state

--TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY term
ORDER BY term


--EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY emp_length
ORDER BY emp_length

--PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY purpose
ORDER BY purpose

--HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
GROUP BY home_ownership
order by count(id)


--Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying the query and comparing the results.
--For e.g
--See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose


--Note: We have applied multiple Filters on all the dashboards. You can check the results for the filters as well by modifying the query and comparing the results.
--For e.g
--See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
