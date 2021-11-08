
    
    

select
    creditcardid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_creditcard`
where creditcardid is not null
group by creditcardid
having count(*) > 1


