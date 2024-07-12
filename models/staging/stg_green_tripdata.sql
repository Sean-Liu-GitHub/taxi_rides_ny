with 
source as (
    select * from {{ source("staging", "green_tripdata")}}
),

renamed as (
    select 
        vendorid,
        lpep_pickup_datetime
    from source
)

select * from renamed