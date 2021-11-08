with
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
        from {{source('querry_adventureworks20211025', 'person_stateprovince')}}
    )

select * from source_data