

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderdetail`
  OPTIONS()
  as with
    source_data as (
        select
            salesorderid
            , salesorderdetailid
            -- , carriertrackingnumber
            , orderqty
            , productid
            , specialofferid
            , unitprice
            , unitpricediscount
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderdetail`
    )

select * from source_data;

