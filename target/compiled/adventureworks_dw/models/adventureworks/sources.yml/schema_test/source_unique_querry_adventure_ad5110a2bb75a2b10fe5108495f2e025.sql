
    
    

select
    salesreasonid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderheadersalesreason`
where salesreasonid is not null
group by salesreasonid
having count(*) > 1


