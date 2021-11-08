

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_production_transactionhistory`
  OPTIONS()
  as with
    source_data as (
        select
            transactionid
            , productid
            , referenceorderid
            , referenceorderlineid
            , transactiondate
            , transactiontype
            , quantity
            , actualcost
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_transactionhistory`
    )

select * from source_data;

