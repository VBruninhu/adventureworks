
    
    

select
    shipmethodid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_shipmethod`
where shipmethodid is not null
group by shipmethodid
having count(*) > 1


