
    
    

select
    departmentid as unique_field,
    count(*) as n_records

from `woven-passkey-328019`.`querry_adventureworks20211025`.`humanresources_department`
where departmentid is not null
group by departmentid
having count(*) > 1


