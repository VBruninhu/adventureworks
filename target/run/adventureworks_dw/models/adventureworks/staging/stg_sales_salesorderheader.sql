

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderheader`
  OPTIONS()
  as with
    source_data as (
        select
            salesorderid
            , revisionnumber
            , orderdate
            -- , duedate
            -- , shipdate
            , status
            -- , onlineorderflag
            , purchaseordernumber
            -- , accountnumber
            , customerid
            , salespersonid
            , territoryid
            -- , billtoaddressid
            , shiptoaddressid
            , shipmethodid
            , creditcardid
            -- , creditcardapprovalcode
            -- , currencyrateid
            , subtotal
            , taxamt
            , freight
            , totaldue
            -- , comment
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderheader`
    )

select * from source_data;

