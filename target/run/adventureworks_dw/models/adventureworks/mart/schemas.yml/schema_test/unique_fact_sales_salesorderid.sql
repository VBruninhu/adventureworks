select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    salesorderid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`dbt_vbruninhu`.`fact_sales`
where salesorderid is not null
group by salesorderid
having count(*) > 1



      
    ) dbt_internal_test