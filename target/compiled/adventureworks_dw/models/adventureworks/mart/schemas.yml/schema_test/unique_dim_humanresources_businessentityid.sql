
    
    

select
    businessentityid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`dbt_vbruninhu`.`dim_humanresources`
where businessentityid is not null
group by businessentityid
having count(*) > 1


