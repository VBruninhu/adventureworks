

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_employeedepartmenthistory`
  OPTIONS()
  as with
    source_data as (
        select
            businessentityid
            , departmentid
            , shiftid
            , startdate
            , enddate
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_employeedepartmenthistory`
    )

select * from source_data;

