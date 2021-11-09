

with
    hr_department as (
        select *
        from `woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_department`
    ), 

    hr_employee as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_employee`
    ),

    hr_employeedepartmenthistory as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_employeedepartmenthistory`
    ),

    hr_employeepayhistory as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_employeepayhistory`
    ),

    hr_shift as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_humanresources_shift`
    ),

    pers_person as (
        select *
        from`woven-passkey-328019`.`dbt_vbruninhu`.`stg_person_person`
    ),

    merged as (
        select 
            row_number() over (order by empl.businessentityid) as employee_sk -- auto-incremental surrogate key
            , empl.businessentityid
            , empl.nationalidnumber
            , empl.loginid
            , empl.jobtitle
            , empl.hiredate
            , empl.salariedflag
            , empl.vacationhours
            , empl.sickleavehours
            , empl.currentflag
            , empl_pay_hist.ratechangedate
            , empl_pay_hist.rate
            , empl_pay_hist.payfrequency
            , empl_dep_hist.departmentid
            , empl_dep_hist.shiftid
            , empl_dep_hist.startdate
            , empl_dep_hist.enddate
            , shift.name as shift_name
            , shift.starttime
            , shift.endtime
            , dep.name as department_name
            , dep.groupname
            , person.firstname
            , person.lastname

        from hr_employee empl
        left join hr_employeepayhistory empl_pay_hist on empl.businessentityid = empl_pay_hist.businessentityid
        left join hr_employeedepartmenthistory empl_dep_hist on empl.businessentityid = empl_dep_hist.businessentityid
        left join hr_shift shift on empl_dep_hist.shiftid = shift.shiftid
        left join hr_department dep on empl_dep_hist.departmentid = dep.departmentid
        left join pers_person person on empl.businessentityid = person.businessentityid
    )

select * from merged