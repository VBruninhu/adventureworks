

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_person`
  OPTIONS()
  as with
    source_data as (
        select
            businessentityid
            , persontype
            , namestyle
            , title
            , firstname
            -- , middlename
            , lastname
            -- , suffix
            , emailpromotion
            -- , additionalcontactinfo
            -- , demographics
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_person`
    )

select * from source_data;

