with
    source_data as (
        select
            productcategoryid
            , name
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'production_productcategory')}}
    )

select * from source_data