
    
    

select
    productsubcategoryid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_productsubcategory`
where productsubcategoryid is not null
group by productsubcategoryid
having count(*) > 1


