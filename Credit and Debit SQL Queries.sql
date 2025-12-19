use p877;

show tables;
select * from credit_debit_data;
 
 #---------------Total credit amount-----------------#
 
select concat(round(sum(AMount)/1000000,2),"M") 
as Total_Credit_Amount 
from credit_debit_data
where transaction_type = "Credit"
group by transaction_type;

#--------------------Total debit amount--------------------#

select concat(round(sum(AMount)/1000000,2),"M") as Total_Debit_Amount 
from credit_debit_data
where transaction_type = "Debit"
group by transaction_type;

#-----------------------Total Balance-------------------------#

select concat(round(sum(Balance)/1000000,2),"M") as Total_balance 
from credit_debit_data;

#----------------------------Net Amount--------------------#

select concat(round(sum(Net_amount)/1000,2),"K") Net_amount 
from credit_debit_data;

#--------------------Credit to debit ratio--------------------#

with cte as 
(select
 round(sum(AMount),2) as Total_Credit_Amount,
round(sum(AMount),2) as Total_Debit_Amount from credit_debit_data
group by transaction_type)
select (total_credit_amount/total_debit_amount) as credit_to_debit_ratio from cte
limit 1;

#-----------------------Branch wise Amount------------------------#

select Branch, concat(round(sum(AMount)/1000000,2),"M") as amount from credit_debit_data
group by branch
order by amount desc;

#-----------------------customer wise amount------------------#

select Customer_name , concat(round(sum(AMount)/1000,2),"k") total_amount
from credit_debit_data
group by customer_name 
order by Total_amount desc;

#--------------------Top N customer wise amount-------------------#

select customer_name, round(sum(AMount),2) total_amount
from credit_debit_data
group by customer_name 
order by total_amount asc
limit 4;

#-------------------------Bank wise Amount-------------------------------#

select bank_name ,concat(round(sum(AMount)/1000000,2),"M") total_amount from credit_debit_data
group by bank_name
order by total_amount desc;

 update credit_debit_data
 set transaction_date= DATE_FORMAT(STR_TO_DATE(transaction_date, '%d-%m-%Y'), '%Y-%d-%m');
 
 #----------------------Month wise Net_amount--------------------#
 
 select monthname(transaction_date) mname, sum(Net_amount) Net_amount from credit_debit_data
 group by mname
 order by net_amount desc;

select * from credit_debit_data;






