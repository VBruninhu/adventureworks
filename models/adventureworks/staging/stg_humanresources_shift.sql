with
    source_data as (
        select
            shiftid
            , name
            , starttime
            , endtime
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'humanresources_shift')}}
    )

select * from source_data