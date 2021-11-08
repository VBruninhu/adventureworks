
    
    

select
    addressid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_address`
where addressid is not null
group by addressid
having count(*) > 1


