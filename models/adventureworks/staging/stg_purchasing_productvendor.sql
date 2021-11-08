with
    source_data as (
        select
            productid
            , businessentityid
            , averageleadtime
            , standardprice
            , lastreceiptcost
            , lastreceiptdate
            , minorderqty
            , maxorderqty
            , onorderqty
            , unitmeasurecode
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'purchasing_productvendor')}}
    )

select * from source_data