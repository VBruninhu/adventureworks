
    
    

select
    countryregioncode as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_countryregion`
where countryregioncode is not null
group by countryregioncode
having count(*) > 1


