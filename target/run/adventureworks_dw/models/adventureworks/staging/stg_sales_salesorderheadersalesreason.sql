

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesorderheadersalesreason`
  OPTIONS()
  as with
    source_data as (
        select
            salesorderid
            , salesreasonid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderheadersalesreason`
    )

select * from source_data;

