

with
    prod_product as (
        select *
        from `woven-passkey-328019`.`dbt_vbruninhu`.`stg_production_product`
    ), 

    prod_productcategory as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_production_productcategory`
    ),

    prod_productsubcategory as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_production_productsubcategory`
    ),

    merged as (
        select 
            row_number() over (order by prod.productid) as production_sk -- auto-incremental surrogate key
            , prod.productid
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

        from prod_product prod
        left join prod_productsubcategory prod_sub_cat on prod.productsubcategoryid = prod_sub_cat.productsubcategoryid
        left join prod_productcategory prod_cat on prod_sub_cat.productcategoryid = prod_cat.productcategoryid
    )

select * from merged