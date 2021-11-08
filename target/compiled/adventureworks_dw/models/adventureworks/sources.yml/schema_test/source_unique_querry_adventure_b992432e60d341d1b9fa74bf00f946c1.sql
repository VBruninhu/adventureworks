
    
    

select
    salesorderdetailid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderdetail`
where salesorderdetailid is not null
group by salesorderdetailid
having count(*) > 1


