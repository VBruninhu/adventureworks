with
    source_data as (
        select
            businessentityid
            , accountnumber
            , name
            , creditrating
            , preferredvendorstatus
            , activeflag
            -- , purchasingwebserviceurl
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'purchasing_vendor')}}
    )

select * from source_data