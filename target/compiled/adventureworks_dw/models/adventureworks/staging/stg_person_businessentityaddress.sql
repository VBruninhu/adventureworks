with
    source_data as (
        select
            businessentityid
            , addressid
            -- , addresstypeid
            -- , rowguid
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`person_businessentityaddress`
    )

select * from source_data