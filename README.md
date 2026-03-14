📊 Bank Loan Analysis Dashboard (Tableau)
📌 Project Overview

This project focuses on analyzing bank loan data to monitor lending performance, evaluate loan quality, and identify trends that help banks make data-driven lending decisions. The dashboard provides insights into loan applications, funding amounts, repayment trends, and borrower characteristics.

The analysis helps financial institutions:

1)Evaluate loan portfolio performance

2)Identify good vs bad loans

3)Understand customer borrowing behavior

4)Track regional and temporal lending trends

Banks analyze loan data to assess risk, detect fraud, improve customer insights, and optimize profitability.

🗂 Dataset

File Used: financial_loan.csv

The dataset includes important loan attributes such as:

1)Loan ID

2)Loan Amount

3)Interest Rate

4)Loan Status

5)Annual Income

6)Debt-to-Income Ratio (DTI)

7)Loan Term

8)Employment Length

9)Loan Purpose

10)Home Ownership

11)Issue Date

12)Address State

These fields help analyze borrower financial health, repayment capacity, and loan performance.

⚙️ Tools & Technologies

1)Tableau – Data visualization and dashboard creation

2)Excel / CSV – Dataset storage

3)SQL / Data Cleaning – Data preparation (optional step if used)

🧹 Step 1: Data Preparation

Imported the financial_loan.csv dataset into Tableau.

Checked for:

a)Missing values

b)Incorrect data types

c)Duplicate records

d)Converted columns like:

e)Issue Date → Date format

f)Interest Rate → Percentage

Created calculated fields:

a)Good Loan

b)Bad Loan

c)MTD Metrics

d)MoM Growth

📈 Step 2: KPI Metrics Creation

Key performance indicators used in the dashboard:

1️⃣ Loan Performance KPIs

a)Total Loan Applications

b)Total Funded Amount

c)Total Amount Received

d)Average Interest Rate

e)Average Debt-to-Income Ratio

2️⃣ Good vs Bad Loan Analysis

a)Good Loans

1)Loan Status = Fully Paid or Current

2)Metrics:

Good Loan %

Good Loan Applications

Good Loan Funded Amount

Good Loan Received Amount

 b)Bad Loans

1)Loan Status = Charged Off

2)Metrics:

Bad Loan %

Bad Loan Applications

Bad Loan Funded Amount

Bad Loan Received Amount

These metrics help measure the health of the bank’s loan portfolio.

📊 Step 3: Dashboard Development
📍 Dashboard 1 – Loan Summary

a)Displays high-level performance metrics.

1)Visuals:

KPI cards

Loan status grid

MTD & MoM trends

2)Insights:

Overall loan portfolio performance

Loan repayment vs disbursement

Borrower financial stability indicators

📍 Dashboard 2 – Loan Overview
1️⃣ Monthly Trends (Line Chart)

Shows trends in:

Loan Applications

Funded Amount

Amount Received

Helps identify seasonality and lending patterns.

2️⃣ Regional Loan Analysis (Filled Map)

Shows loan metrics by state.

Purpose:

Identify regions with high lending activity.

3️⃣ Loan Term Distribution (Donut Chart)

Compares:

36 month loans

60 month loans

Helps understand borrower loan preferences.

4️⃣ Employment Length Analysis (Bar Chart)

Shows how employment stability affects loan approvals.

5️⃣ Loan Purpose Breakdown (Bar Chart)

Common purposes include:

Debt consolidation

Credit card refinancing

Home improvement

6️⃣ Home Ownership Analysis (Tree Map)

Compares loan distribution across:

Rent

Own

Mortgage

📍 Dashboard 3 – Loan Details

Provides detailed loan-level information including:

Borrower profile

Loan amount

Interest rate

Loan status

Payment history

This dashboard acts as a comprehensive loan monitoring panel.

🔍 Key Insights

1)Most loans were issued for debt consolidation.

2)Borrowers with longer employment history had higher loan approvals.

3)Certain states showed higher loan demand and funding amounts.

4)Majority of loans fall into the good loan category, indicating a healthy portfolio.

🚀 Business Impact

This dashboard helps banks:

1)Monitor loan portfolio health

2)Reduce credit risk

3)Improve lending decisions

4)Identify profitable customer segments

5)Track repayment performance
