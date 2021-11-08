{{ config(materialized='table') }}

with
    prod_product as (
        select *
        from {{ref('stg_production_product')}}
    ), 

    prod_productcategory as (
        select *
        from{{ref('stg_production_productcategory')}}
    ),

    prod_productsubcategory as (
        select *
        from{{ref('stg_production_productsubcategory')}}
    ),

    prod_transactionhistory as (
        select *
        from{{ref('stg_production_transactionhistory')}}
    ),

    merged as (
        select 
            row_number() over (order by trans_hist.transactionid) as prod_sk -- auto-incremental surrogate key
            , trans_hist.transactionid
            , trans_hist.productid
            , trans_hist.referenceorderid
            , trans_hist.referenceorderlineid
            , trans_hist.transactiondate
            , trans_hist.transactiontype
            , trans_hist.quantity
            , trans_hist.actualcost
            , prod.name as product_name
            , prod.makeflag
            , prod.finishedgoodsflag
            , prod.safetystocklevel
            , prod.reorderpoint
            , prod.standardcost
            , prod.listprice
            , prod.daystomanufacture
            , prod.productline
            , prod.class
            , prod.productsubcategoryid
            , prod.productmodelid
            , prod.sellstartdate
            , prod.sellenddate
            , prod.discontinueddate
            , prod_sub_cat.productcategoryid
            , prod_sub_cat.name as product_subcategory_name
            , prod_cat.name as product_category_name

        from prod_transactionhistory trans_hist
        left join prod_product prod on trans_hist.productid = prod.productid
        left join prod_productsubcategory prod_sub_cat on prod.productsubcategoryid = prod_sub_cat.productsubcategoryid
        left join prod_productcategory prod_cat on prod_sub_cat.productcategoryid = prod_cat.productcategoryid
    )

select * from merged