select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_productvendor`
where businessentityid is null



      
    ) dbt_internal_test