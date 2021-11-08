
    
    

select
    businessentityid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_store`
where businessentityid is not null
group by businessentityid
having count(*) > 1


