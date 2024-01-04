--Identify the total loan amount disbursed by each branch in the current year, along with the average
--transaction value for each of these customers
SELECT DATE_PART('year', CURRENT_TIMESTAMP) AS CurrentYear;
SELECT branch.branchid,customer.customerid, SUM(loan.loanamount) over(partition by branch.branchid) AS total_loan_amount_by_cus, AVG(transaction.amount) over(partition by customer.customerid) AS avg_transaction_value
FROM loan
JOIN customer ON loan.customer_customerid = customer.customerid
JOIN customer_account ON customer_account.customer_customerid = customer.customerID
JOIN account ON customer_account.account_accountid = account.accountid
JOIN branch ON account.branch_branchid = branch.branchid
join transaction on transaction.account_accountid = account.accountid
WHERE extract(YEAR from loan.startdate) = DATE_PART('year', CURRENT_TIMESTAMP)
order by branch.branchid,customer.customerid;

--A List customer who have a loan and a checking account, where the loan amount is at least 50%
--higher than their checking account balance.
SELECT DISTINCT customer.customerid, customer.customertype
FROM loan
JOIN customer ON loan.customer_customerid = customer.customerid
JOIN customer_account ON customer_account.customer_customerid = customer.customerID
JOIN account ON customer_account.account_accountid = account.accountid
WHERE loan.loanamount >= 1.5 * account.currentbalance AND account.accounttype = 'checking';

--Display each branch's total number of loans, total loan amount, and the number of unique customers
--served, for loans issued in the last two year
SELECT branch.branchname, COUNT(DISTINCT loan.customer_customerid) AS unique_customers, COUNT(loan.loanid) AS total_loans, SUM(loan.loanamount) AS total_loan_amount
FROM loan
JOIN customer ON loan.customer_customerid = customer.customerid
JOIN customer_account ON customer_account.customer_customerid = customer.customerID
JOIN account ON customer_account.account_accountid = account.accountid
JOIN branch ON account.branch_branchid = branch.branchid
WHERE extract(YEAR from loan.startdate) >= DATE_PART('year', CURRENT_TIMESTAMP) - 2
GROUP BY branch.branchname;