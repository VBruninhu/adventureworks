

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_employee`
  OPTIONS()
  as with
    source_data as (
        select
            businessentityid
            , nationalidnumber
            , loginid
            , jobtitle
            -- , birthdate
            -- , maritalstatus
            -- , gender
            , hiredate
            , salariedflag
            , vacationhours
            , sickleavehours
            , currentflag
            -- , rowguid
            -- , modifieddate
            -- , organizationnode
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_employee`
    )

select * from source_data;

