

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_shift`
  OPTIONS()
  as with
    source_data as (
        select
            shiftid
            , name
            , starttime
            , endtime
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_shift`
    )

select * from source_data;

