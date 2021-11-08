with
    source_data as (
        select
            departmentid
            , name
            , groupname
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'humanresources_department')}}
    )

select * from source_data