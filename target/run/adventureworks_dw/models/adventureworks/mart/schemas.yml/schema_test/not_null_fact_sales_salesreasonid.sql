select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `woven-passkey-328019`.`dbt_vbruninhu`.`fact_sales`
where salesreasonid is null



      
    ) dbt_internal_test