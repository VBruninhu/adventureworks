

  create or replace view `woven-passkey-328019`.`dbt_vbruninhu`.`stg_production_productsubcategory`
  OPTIONS()
  as with
    source_data as (
        select
            productsubcategoryid
            , productcategoryid
            , name
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_productsubcategory`
    )

select * from source_data;

