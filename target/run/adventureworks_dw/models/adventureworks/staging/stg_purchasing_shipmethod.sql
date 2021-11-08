

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_shipmethod`
  OPTIONS()
  as with
    source_data as (
        select
            shipmethodid
            , name
            , shipbase
            , shiprate
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_shipmethod`
    )

select * from source_data;

