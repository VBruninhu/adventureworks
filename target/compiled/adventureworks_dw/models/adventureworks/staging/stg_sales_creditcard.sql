with
    source_data as (
        select
            creditcardid
            , cardtype
            -- , cardnumber
            -- , expmonth
            -- , expyear
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_creditcard`
    )

select * from source_data