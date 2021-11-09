{{ config(materialized='table') }}

with
    pers_person as (
        select *
        from{{ref('stg_person_person')}}
    ),

    sales_customer as (
        select *
        from{{ref('stg_sales_customer')}}
    ),

    sales_store as (
        select *
        from{{ref('stg_sales_store')}}
    ),

    merged as (
        select 
            row_number() over (order by store.businessentityid) as customer_sk -- auto-incremental surrogate key
            , store.businessentityid
            , store.name as store_name
            , store.salespersonid
            , customer.customerid
            , customer.personid
            , customer.territoryid
            , person.firstname
            , person.lastname

        from sales_store store
        left join sales_customer customer on store.businessentityid = customer.storeid
        left join pers_person person on store.businessentityid = person.businessentityid
    )

select * from merged