

with
    sales_creditcard as (
        select *
        from `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_creditcard`
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

    sales_salesreason as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesreason`
    ),

    person_address as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_address`
    ),

    person_stateprovince as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_stateprovince`
    ),

    person_countryregion as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_countryregion`
    ),

    purchasing_shipmethod as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_shipmethod`
    ),

    dim_employee as (
        select 
            employee_sk
            , businessentityid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_employee`
    ),

    dim_customer as (
        select
            customer_sk
            , customerid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_customer`
    ),

    dim_production as (
        select
            production_sk
            , productid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_production`
    ),

    dim_purchasing as (
        select
            purchasing_sk
            , productid
        from`woven-passkey-328019`.`dbt_vbruninhu`.`dim_purchasing`
    ),

    merged as (
        select
            sales_ord_head.salesorderid
            , sales_ord_head.revisionnumber
            , sales_ord_head.orderdate
            , sales_ord_head.status
            , sales_ord_head.purchaseordernumber
            , sales_ord_head.customerid
            , sales_ord_head.salespersonid
            , sales_ord_head.territoryid
            , sales_ord_head.taxamt
            , sales_ord_head.freight
            , credit_card.cardtype
            , sales_reas.salesreasonid
            , sales_reas.name as sales_reason_name
            , sales_reas.reasontype
            , sales_ord_det.salesorderdetailid
            , sales_ord_det.orderqty
            , sales_ord_det.productid
            , sales_ord_det.specialofferid
            , sales_ord_det.unitprice
            , sales_ord_det.unitpricediscount
            , per_address.city
            , state_prov.name as state_province_name
            , country_reag.name as country_region_name
            , ship_method.name as ship_method_name
            , dim_employee.employee_sk
            , dim_customer.customer_sk
            , dim_production.production_sk
            , dim_purchasing.purchasing_sk

        from sales_salesorderheader sales_ord_head
        left join sales_creditcard credit_card on sales_ord_head.creditcardid = credit_card.creditcardid
        left join sales_salesorderheadersalesreason sales_ord_head_sales_reas on sales_ord_head.salesorderid = sales_ord_head_sales_reas.salesorderid
        left join sales_salesreason sales_reas on sales_ord_head_sales_reas.salesreasonid = sales_reas.salesreasonid
        left join sales_salesorderdetail sales_ord_det on sales_ord_head.salesorderid = sales_ord_det.salesorderid
        left join person_address per_address on sales_ord_head.shiptoaddressid = per_address.addressid
        left join person_stateprovince state_prov on per_address.stateprovinceid = state_prov.stateprovinceid
        left join person_countryregion country_reag on state_prov.countryregioncode = country_reag.countryregioncode
        left join purchasing_shipmethod ship_method on sales_ord_head.shipmethodid = ship_method.shipmethodid
        left join dim_employee dim_employee on sales_ord_head.salespersonid = dim_employee.businessentityid
        left join dim_customer dim_customer on sales_ord_head.customerid = dim_customer.customerid
        left join dim_production dim_production on sales_ord_det.productid = dim_production.productid
        left join dim_purchasing dim_purchasing on sales_ord_det.productid = dim_purchasing.productid
    )

select * from merged