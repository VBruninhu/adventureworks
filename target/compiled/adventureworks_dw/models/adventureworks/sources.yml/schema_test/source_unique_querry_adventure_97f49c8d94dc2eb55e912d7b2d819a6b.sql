
    
    

select
    purchaseorderid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_purchaseorderheader`
where purchaseorderid is not null
group by purchaseorderid
having count(*) > 1


