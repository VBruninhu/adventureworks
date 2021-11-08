with
    source_data as (
        select
            businessentityid
            , ratechangedate
            , rate
            , payfrequency
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'humanresources_employeepayhistory')}}
    )

select * from source_data