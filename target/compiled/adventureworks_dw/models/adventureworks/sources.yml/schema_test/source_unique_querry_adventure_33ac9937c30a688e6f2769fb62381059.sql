
    
    

select
    stateprovinceid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_stateprovince`
where stateprovinceid is not null
group by stateprovinceid
having count(*) > 1


