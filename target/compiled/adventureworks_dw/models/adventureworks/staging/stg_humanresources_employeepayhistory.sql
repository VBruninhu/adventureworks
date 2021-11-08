with
    source_data as (
        select
            businessentityid
            , ratechangedate
            , rate
            , payfrequency
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_employeepayhistory`
    )

select * from source_data