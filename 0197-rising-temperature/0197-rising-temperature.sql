with x as (select *, lag(temperature) over(order by recorddate) as prev_temp, lag(recorddate) over (order by recorddate) as prev_date from weather)

select id from x where temperature>prev_temp and datediff(recorddate,prev_date)=1;