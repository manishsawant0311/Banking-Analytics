use p877;
show tables;
select * from bank_loan;

#-----------total loan amount funded--------------#

select concat(round(sum(funded_amount)/1000000,2),"M") as total_loan_amount_funded from bank_loan;

#-----------------total loan ------------------------#

select concat(round(sum(loan_amount)/1000000,2),"M") total_loan from bank_loan;

select * from bank_loan;

#---------------total_collection---------------------#

select concat(round(sum(total_collection)/1000000,2),"M") total_collection from bank_loan;

#-----------------average_interest-----------------#

select round(avg(int_rate),2) total_interest from bank_loan;

#------------------Branch wise performance-----------------#

select * from bank_loan;

select branch_name, concat(round(sum(loan_amount)/100000,2),"M") total_amount from bank_loan
group by branch_name
order by total_amount desc;

#----------------------state wise loan amount-------------------#

select state_name,concat(round(sum(loan_amount)/1000000,2),"M") as total_loan from bank_loan
group by state_name
order by total_loan desc;

#------------Religion wise loan---------------#

select religion,concat(round(sum(loan_amount)/1000000,2),"M") total_amount from bank_loan
group by religion ;

#---------------grade wise loan----------------#

select grade,concat(round(sum(loan_amount)/1000000,2),"M") from bank_loan
group by grade;

#-----------------------default count loan---------------#

select * from bank_loan;
#-------------------count of dafault loan-----------------#

select is_default_loan,count(is_default_loan) from bank_loan
group by is_default_loan;

#---------------------loan status wise loan---------------------#

select loan_status , sum(loan_amount) total_loan from bank_loan
group by loan_status;

#-----------------------disbursementyear wise loan-------------------------#

select disbursement_dy, concat(round(sum(loan_amount)/1000000,2),"M") total_loan from bank_loan
group by disbursement_dy 
order by total_loan ;

#-----------------loan status wise loan-------------------#


select loan_status, concat(round(sum(loan_amount)/1000000,2),"M") total_loan from bank_loan
group by loan_status
order by total_loan desc;

#--------------------verification_status wise loan------------------------#

select verification_status, concat(round(sum(loan_amount)/1000000,2),"M") total_loan from bank_loan
group by verification_status
order by total_loan desc;

#-----------------Age wie loan amount-----------------#

select * from bank_loan;
select age, concat(round(sum(loan_amount)/1000000,2),"M") total_loan from bank_loan
group by age;























