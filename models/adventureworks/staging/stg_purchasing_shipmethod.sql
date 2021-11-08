with
    source_data as (
        select
            shipmethodid
            , name
            , shipbase
            , shiprate
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'purchasing_shipmethod')}}
    )

select * from source_data