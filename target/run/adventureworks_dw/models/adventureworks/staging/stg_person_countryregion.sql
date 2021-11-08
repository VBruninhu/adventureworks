

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_countryregion`
  OPTIONS()
  as with
    source_data as (
        select
            countryregioncode
            , name
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_countryregion`
    )

select * from source_data;

