

  create or replace table `woven-passkey-328019`.`dbt_vbruninhu`.`dim_purchasing`
  
  
  OPTIONS()
  as (
    

with
    pur_productvendor as (
        select *
        from `woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_productvendor`
    ), 

    pur_purchaseorderdetail as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_purchaseorderdetail`
    ),

    pur_purchaseorderheader as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_purchaseorderheader`
    ),

    pur_shipmethod as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_shipmethod`
    ),

    pur_vendor as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_vendor`
    ),

    merged as (
        select 
            row_number() over (order by pur_order_det.purchaseorderid) as pur_sk -- auto-incremental surrogate key
            , pur_order_det.purchaseorderid
            , pur_order_det.purchaseorderdetailid
            , pur_order_det.duedate
            , pur_order_det.orderqty
            , pur_order_det.productid
            , pur_order_det.unitprice
            , pur_order_det.receivedqty
            , pur_order_det.rejectedqty
            , pur_order_head.revisionnumber
            , pur_order_head.status
            , pur_order_head.employeeid
            , pur_order_head.vendorid
            , pur_order_head.shipmethodid
            , pur_order_head.orderdate
            , pur_order_head.subtotal
            , pur_order_head.taxamt
            , pur_order_head.freight
            , ship_method.name as ship_method_name
            , ship_method.shipbase
            , ship_method.shiprate
            , vendor.accountnumber
            , vendor.name as vendor_name
            , vendor.creditrating
            , vendor.preferredvendorstatus
            , vendor.activeflag
            , prod_vendor.averageleadtime
            , prod_vendor.standardprice
            , prod_vendor.lastreceiptcost
            , prod_vendor.lastreceiptdate
            , prod_vendor.minorderqty
            , prod_vendor.maxorderqty
            , prod_vendor.onorderqty
            , prod_vendor.unitmeasurecode

        from pur_purchaseorderdetail pur_order_det
        left join pur_purchaseorderheader pur_order_head on pur_order_det.purchaseorderid = pur_order_head.purchaseorderid
        left join pur_shipmethod ship_method on pur_order_head.shipmethodid = ship_method.shipmethodid
        left join pur_vendor vendor on pur_order_head.vendorid = vendor.businessentityid
        left join pur_productvendor prod_vendor on vendor.businessentityid = prod_vendor.businessentityid
    )

select * from merged
  );
    