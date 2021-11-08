with
    source_data as (
        select
            purchaseorderid
            , revisionnumber
            , status
            , employeeid
            , vendorid
            , shipmethodid
            , orderdate
            -- , shipdate
            , subtotal
            , taxamt
            , freight
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'purchasing_purchaseorderheader')}}
    )

select * from source_data