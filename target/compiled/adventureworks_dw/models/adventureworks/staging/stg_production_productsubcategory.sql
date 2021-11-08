with
    source_data as (
        select
            productsubcategoryid
            , productcategoryid
            , name
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`production_productsubcategory`
    )

select * from source_data