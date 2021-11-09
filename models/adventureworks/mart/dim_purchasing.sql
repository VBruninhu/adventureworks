{{ config(materialized='table') }}

with
    pur_productvendor as (
        select *
        from {{ref('stg_purchasing_productvendor')}}
    ), 

    pur_vendor as (
        select *
        from{{ref('stg_purchasing_vendor')}}
    ),

    prod_product as (
        select *
        from {{ref('stg_production_product')}}
    ),

    merged as (
        select 
            row_number() over (order by vendor.businessentityid) as purchasing_sk -- auto-incremental surrogate key
            , vendor.businessentityid
            , vendor.accountnumber
            , vendor.name as vendor_name
            , vendor.creditrating
            , vendor.preferredvendorstatus
            , vendor.activeflag
            , prod_vendor.productid
            , prod_vendor.averageleadtime
            , prod_vendor.standardprice
            , prod_vendor.minorderqty
            , prod_vendor.maxorderqty
            , prod_vendor.onorderqty
            , prod_vendor.unitmeasurecode
            , product.name as product_name

        from pur_vendor vendor
        left join pur_productvendor prod_vendor on prod_vendor.businessentityid = vendor.businessentityid
        left join prod_product product on product.productid = prod_vendor.productid
    )

select * from merged