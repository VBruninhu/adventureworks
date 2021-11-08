with
    source_data as (
        select
            countryregioncode
            , name
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'person_countryregion')}}
    )

select * from source_data