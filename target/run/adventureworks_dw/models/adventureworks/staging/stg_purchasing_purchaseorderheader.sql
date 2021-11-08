

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_purchaseorderheader`
  OPTIONS()
  as with
    source_data as (
        select
            purchaseorderid
            , revisionnumber
            , status
            , employeeid
            , vendorid
            , shipmethodid
            , orderdate
            -- , shipdate
            , subtotal
            , taxamt
            , freight
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_purchaseorderheader`
    )

select * from source_data;

