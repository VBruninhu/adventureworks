
    
    

select
    transactionid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`dbt_vbruninhu`.`dim_production`
where transactionid is not null
group by transactionid
having count(*) > 1


