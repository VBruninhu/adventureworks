with
    source_data as (
        select
            businessentityid
            , persontype
            , namestyle
            , title
            , firstname
            -- , middlename
            , lastname
            -- , suffix
            , emailpromotion
            -- , additionalcontactinfo
            -- , demographics
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'person_person')}}
    )

select * from source_data