select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    creditcardid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_creditcard`
where creditcardid is not null
group by creditcardid
having count(*) > 1



      
    ) dbt_internal_test