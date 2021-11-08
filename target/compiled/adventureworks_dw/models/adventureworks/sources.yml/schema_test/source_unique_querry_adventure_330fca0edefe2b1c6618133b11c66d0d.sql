
    
    

select
    shiftid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_employeedepartmenthistory`
where shiftid is not null
group by shiftid
having count(*) > 1


