{{ config(materialized='table') }}

with
    pers_address as (
        select *
        from {{ref('stg_person_address')}}
    ), 

    pers_businessentityaddress as (
        select *
        from{{ref('stg_person_businessentityaddress')}}
    ),

    pers_countryregion as (
        select *
        from{{ref('stg_person_countryregion')}}
    ),

    pers_person as (
        select *
        from{{ref('stg_person_person')}}
    ),

    pers_stateprovince as (
        select *
        from{{ref('stg_person_stateprovince')}}
    ),

    merged as (
        select 
            row_number() over (order by pers.businessentityid) as pers_sk -- auto-incremental surrogate key
            , pers.businessentityid
            , pers.persontype
            , pers.namestyle
            , pers.title
            , pers.firstname
            , pers.lastname
            , pers.emailpromotion
            , addr.addressid
            , addr.city
            , addr.stateprovinceid
            , state_prov.stateprovincecode
            , state_prov.countryregioncode
            , state_prov.isonlystateprovinceflag
            , state_prov.name as state_province_name
            , state_prov.territoryid
            , country_region.name as country_region_name

        from pers_person pers
        left join pers_businessentityaddress bus_ent_addr on pers.businessentityid = bus_ent_addr.businessentityid
        left join pers_address addr on bus_ent_addr.addressid = addr.addressid
        left join pers_stateprovince state_prov on addr.stateprovinceid = state_prov.stateprovinceid
        left join pers_countryregion country_region on state_prov.countryregioncode = country_region.countryregioncode
    )

select * from merged