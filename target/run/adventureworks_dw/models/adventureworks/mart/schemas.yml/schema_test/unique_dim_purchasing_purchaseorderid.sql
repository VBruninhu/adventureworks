select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    purchaseorderid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`dbt_vbruninhu`.`dim_purchasing`
where purchaseorderid is not null
group by purchaseorderid
having count(*) > 1



      
    ) dbt_internal_test