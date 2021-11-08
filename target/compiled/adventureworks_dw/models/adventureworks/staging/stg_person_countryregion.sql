with
    source_data as (
        select
            countryregioncode
            , name
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_countryregion`
    )

select * from source_data