with
    source_data as (
        select
            departmentid
            , name
            , groupname
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_department`
    )

select * from source_data