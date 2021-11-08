with
    source_data as (
        select
            territoryid
            , name
            , countryregioncode
            , group
            , salesytd
            , saleslastyear
            , costytd
            , costlastyear
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'sales_salesterritory')}}
    )

select * from source_data