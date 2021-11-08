with
    source_data as (
        select
            businessentityid
            , addressid
            -- , addresstypeid
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'person_businessentityaddress')}}
    )

select * from source_data