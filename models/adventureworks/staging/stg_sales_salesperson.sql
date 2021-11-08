with
    source_data as (
        select
            businessentityid
            , territoryid
            , salesquota
            , bonus
            , commissionpct
            , salesytd
            , saleslastyear
            -- , rowguid
            -- , modifieddate
        from {{source('querry_adventureworks20211025', 'sales_salesperson')}}
    )

select * from source_data