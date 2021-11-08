

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_stateprovince`
  OPTIONS()
  as with
    source_data as (
        select
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_stateprovince`
    )

select * from source_data;

