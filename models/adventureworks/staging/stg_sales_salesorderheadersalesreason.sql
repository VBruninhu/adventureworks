with
    source_data as (
        select
            salesorderid
            , salesreasonid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'sales_salesorderheadersalesreason')}}
    )

select * from source_data