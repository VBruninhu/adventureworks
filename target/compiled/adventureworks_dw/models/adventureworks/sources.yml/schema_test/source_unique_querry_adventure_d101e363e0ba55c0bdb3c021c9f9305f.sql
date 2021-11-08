
    
    

select
    territoryid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesterritory`
where territoryid is not null
group by territoryid
having count(*) > 1


