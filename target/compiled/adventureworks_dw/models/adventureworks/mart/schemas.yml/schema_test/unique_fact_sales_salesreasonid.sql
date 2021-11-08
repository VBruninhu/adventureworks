
    
    

select
    salesreasonid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`dbt_vbruninhu`.`fact_sales`
where salesreasonid is not null
group by salesreasonid
having count(*) > 1


