
    
    

select
    productcategoryid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_productcategory`
where productcategoryid is not null
group by productcategoryid
having count(*) > 1


