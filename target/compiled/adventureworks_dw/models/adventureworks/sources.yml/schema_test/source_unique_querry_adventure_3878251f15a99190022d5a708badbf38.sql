
    
    

select
    productid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_product`
where productid is not null
group by productid
having count(*) > 1


