

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_purchasing_vendor`
  OPTIONS()
  as with
    source_data as (
        select
            businessentityid
            , accountnumber
            , name
            , creditrating
            , preferredvendorstatus
            , activeflag
            -- , purchasingwebserviceurl
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_vendor`
    )

select * from source_data;

