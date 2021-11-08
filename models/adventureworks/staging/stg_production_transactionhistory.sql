with
    source_data as (
        select
            transactionid
            , productid
            , referenceorderid
            , referenceorderlineid
            , transactiondate
            , transactiontype
            , quantity
            , actualcost
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'production_transactionhistory')}}
    )

select * from source_data