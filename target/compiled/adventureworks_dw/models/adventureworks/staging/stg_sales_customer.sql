with
    source_data as (
        select
            customerid
            , personid
            , storeid
            , territoryid
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_customer`
    )

select * from source_data