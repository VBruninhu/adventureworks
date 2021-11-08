

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_productvendor`
  OPTIONS()
  as with
    source_data as (
        select
            productid
            , businessentityid
            , averageleadtime
            , standardprice
            , lastreceiptcost
            , lastreceiptdate
            , minorderqty
            , maxorderqty
            , onorderqty
            , unitmeasurecode
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_productvendor`
    )

select * from source_data;

