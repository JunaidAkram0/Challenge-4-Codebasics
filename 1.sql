					-- Request 1 -- 
Select 
		market 
				from dim_customer

where 
		region = 'APAC' and customer = 'Atliq Exclusive'
Group by Market;