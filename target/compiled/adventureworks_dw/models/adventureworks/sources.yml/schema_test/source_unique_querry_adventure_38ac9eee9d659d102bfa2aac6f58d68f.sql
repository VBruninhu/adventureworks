
    
    

select
    customerid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_customer`
where customerid is not null
group by customerid
having count(*) > 1


