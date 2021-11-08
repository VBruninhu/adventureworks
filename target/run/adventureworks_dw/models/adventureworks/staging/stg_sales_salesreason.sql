

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesreason`
  OPTIONS()
  as with
    source_data as (
        select
            salesreasonid
            , name
            , reasontype
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesreason`
    )

select * from source_data;

