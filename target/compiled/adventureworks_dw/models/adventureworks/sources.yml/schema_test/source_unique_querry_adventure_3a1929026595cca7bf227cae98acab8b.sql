
    
    

select
    purchaseorderdetailid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_purchaseorderdetail`
where purchaseorderdetailid is not null
group by purchaseorderdetailid
having count(*) > 1


