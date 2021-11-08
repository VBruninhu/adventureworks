

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_sales_salesperson`
  OPTIONS()
  as with
    source_data as (
        select
            businessentityid
            , territoryid
            , salesquota
            , bonus
            , commissionpct
            , salesytd
            , saleslastyear
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesperson`
    )

select * from source_data;

