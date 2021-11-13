

with
    pers_person as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_person`
    ),

    sales_customer as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_customer`
    ),

    sales_store as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_store`
    ),

    merged as (
        select 
            row_number() over (order by customer.customerid) as customer_sk -- auto-incremental surrogate key
            , store.businessentityid
            , store.name as store_name
            , store.salespersonid
            , customer.customerid
            , customer.personid
            , customer.territoryid
            , person.firstname
            , person.lastname

        from sales_customer customer
        left join pers_person person on customer.personid = person.businessentityid
        left join sales_store store on store.businessentityid = customer.storeid
    )

select * from merged