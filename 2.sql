							-- Request 2 --

with 
	2020Data as(
    
Select 
                Count(distinct Product_code) as 'Unique_Products_of_2020' 
from 
				fact_sales_monthly
Where 
				fiscal_year = '2020'
),

2021Data as( 
	Select 
			Count(distinct Product_code) as 'Unique_Products_of_2021' 
from 
			fact_sales_monthly
Where 
			fiscal_year = '2021'
) 
Select 
		d20.Unique_Products_of_2020 , 
        d21.Unique_Products_of_2021 , 
Round((d21.Unique_Products_of_2021 - d20.Unique_Products_of_2020) * 100.0 / d20.Unique_Products_of_2020 ,2)  as 'Change Percentage' 
from 
		2020Data d20, 2021Data d21;