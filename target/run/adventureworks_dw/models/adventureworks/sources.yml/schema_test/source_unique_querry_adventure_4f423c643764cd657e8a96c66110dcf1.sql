select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    salesorderid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderheadersalesreason`
where salesorderid is not null
group by salesorderid
having count(*) > 1



      
    ) dbt_internal_test