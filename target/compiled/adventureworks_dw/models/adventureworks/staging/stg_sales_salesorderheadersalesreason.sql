with
    source_data as (
        select
            salesorderid
            , salesreasonid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesorderheadersalesreason`
    )

select * from source_data