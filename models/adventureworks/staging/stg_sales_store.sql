with
    source_data as (
        select
            businessentityid
            , name
            , salespersonid
            -- , demographics
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'sales_store')}}
    )

select * from source_data