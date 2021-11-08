
    
    

select
    transactionid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_transactionhistory`
where transactionid is not null
group by transactionid
having count(*) > 1


