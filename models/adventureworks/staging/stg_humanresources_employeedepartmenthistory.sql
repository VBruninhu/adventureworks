with
    source_data as (
        select
            businessentityid
            , departmentid
            , shiftid
            , startdate
            , enddate
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'humanresources_employeedepartmenthistory')}}
    )

select * from source_data