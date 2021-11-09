

  create or replace table `woven-passkey-328019`.`dbt_vbruninhu`.`fact_sales`
  
  
  OPTIONS()
  as (
    

with
    sales_creditcard as (
        select *
        from `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_creditcard`
    ), 

    sales_customer as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_customer`
    ),

    sales_salesorderdetail as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderdetail`
    ),

    sales_salesorderheader as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderheader`
    ),

    sales_salesorderheadersalesreason as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderheadersalesreason`
    ),

    sales_salesperson as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesperson`
    ),

    sales_salesreason as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesreason`
    ),

    sales_store as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_store`
    ),

    human_resources as (
        select 
            hr_sk
            , businessentityid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_humanresources`
    ),

    person as (
        select
            pers_sk
            , businessentityid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_person`
    ),

    production as (
        select
            prod_sk
            , transactionid
            , productid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_production`
    ),

    purchasing as (
        select
            pur_sk
            , purchaseorderid
            , productid
            , vendorid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_purchasing`
    ),

    merged as (
        select 
            row_number() over (order by sales_ord_head.salesorderid) as sales_sk -- auto-incremental surrogate key
            , sales_ord_head.salesorderid
            , sales_ord_head_sales_reas.salesreasonid
            , sales_reas.name as sales_reason_name
            , sales_reas.reasontype
            , sales_ord_head.revisionnumber
            , sales_ord_head.orderdate
            , sales_ord_head.status
            , sales_ord_head.purchaseordernumber
            , sales_ord_head.customerid
            , sales_ord_head.salespersonid as sales_ord_head_salespersonid
            , sales_ord_head.territoryid as sales_ord_head_territoryid
            , sales_ord_head.billtoaddressid
            , sales_ord_head.shiptoaddressid
            , sales_ord_head.shipmethodid
            , sales_ord_head.creditcardid
            , sales_ord_head.subtotal
            , sales_ord_head.taxamt
            , sales_ord_head.freight
            , sales_ord_head.totaldue
            , cred_card.cardtype
            , sales_pers.territoryid as sales_pers_territoryid
            , sales_pers.salesquota
            , sales_pers.bonus
            , sales_pers.commissionpct
            , sales_pers.salesytd
            , sales_pers.saleslastyear
            , customer.personid
            , customer.storeid
            , store.name as sales_store_name
            , store.salespersonid as store_salespersonid
            , sales_ord_det.salesorderdetailid
            , sales_ord_det.orderqty
            , sales_ord_det.productid
            , sales_ord_det.specialofferid
            , sales_ord_det.unitprice
            , sales_ord_det.unitpricediscount
            , hr.businessentityid
            , hr.hr_sk
            , pers.pers_sk
            , pur.pur_sk
            , pur.purchaseorderid
            , prod.prod_sk
            , prod.transactionid


        from sales_salesorderheader sales_ord_head
        left join sales_salesorderheadersalesreason sales_ord_head_sales_reas on sales_ord_head.salesorderid = sales_ord_head_sales_reas.salesorderid
        left join sales_salesreason sales_reas on sales_ord_head_sales_reas.salesreasonid = sales_reas.salesreasonid
        left join sales_creditcard cred_card on sales_ord_head.creditcardid = cred_card.creditcardid
        left join sales_salesperson sales_pers on sales_ord_head.customerid = sales_pers.businessentityid
        left join sales_customer customer on sales_ord_head.customerid = customer.customerid
        left join sales_store store on sales_pers.businessentityid = store.businessentityid
        left join sales_salesorderdetail sales_ord_det on sales_ord_head.salesorderid = sales_ord_det.salesorderid
        left join human_resources hr on sales_pers.businessentityid = hr.businessentityid
        left join person pers on customer.customerid = pers.businessentityid
        left join purchasing pur on pers.businessentityid = pur.vendorid
        left join production prod on pur.productid = prod.productid
    )

select * from merged
  );
    