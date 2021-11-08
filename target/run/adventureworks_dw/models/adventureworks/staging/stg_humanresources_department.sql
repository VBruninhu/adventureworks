

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_department`
  OPTIONS()
  as with
    source_data as (
        select
            departmentid
            , name
            , groupname
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_department`
    )

select * from source_data;

