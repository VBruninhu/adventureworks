with
    source_data as (
        select
            businessentityid
            , nationalidnumber
            , loginid
            , jobtitle
            -- , birthdate
            -- , maritalstatus
            -- , gender
            , hiredate
            , salariedflag
            , vacationhours
            , sickleavehours
            , currentflag
            -- , rowguid
            -- , modifieddate
            -- , organizationnode
        from {{source('querry_adventureworks20211025', 'humanresources_employee')}}
    )

select * from source_data