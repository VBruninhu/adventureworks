

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_address`
  OPTIONS()
  as with
    source_data as (
        select
            addressid
            -- , addressline1
            -- , addressline2
            , city
            , stateprovinceid
            -- , postalcode
            -- , spatiallocation
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_address`
    )

select * from source_data;

