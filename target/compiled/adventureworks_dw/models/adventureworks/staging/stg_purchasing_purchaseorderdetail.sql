with
    source_data as (
        select
            purchaseorderid
            , purchaseorderdetailid
            , duedate
            , orderqty
            , productid
            , unitprice
            , receivedqty
            , rejectedqty
            -- , modifieddate
        from `woven-passkey-328019`.`querry_adventureworks20211025`.`purchasing_purchaseorderdetail`
    )

select * from source_data