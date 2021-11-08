with
    source_data as (
        select
            shiftid
            , name
            , starttime
            , endtime
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_shift`
    )

select * from source_data