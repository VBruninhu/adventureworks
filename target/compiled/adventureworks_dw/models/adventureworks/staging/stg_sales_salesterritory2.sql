with
    source_data as (
        select
            territoryid
            , name
            , countryregioncode
            , group as gp
            , salesytd
            , saleslastyear
            , costytd
            , costlastyear
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`sales_salesterritory`
    )

select * from source_data