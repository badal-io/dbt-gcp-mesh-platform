with

source as (

    select * from {{ source('ecom', 'raw_products') }}

),

renamed as (

    select

        ---------- ids
        sku as product_id,

        ---------- text
        name as product_name,
        type as product_type,
        description as product_description,

        ---------- numerics
        (price / 100.0) as product_price,
        round(price / 100.0, 2) as product_price_rounded,   -- new field for testing

        ---------- booleans
        case when type = 'jaffle' then true else false end as is_food_item,
        case when type = 'beverage' then true else false end as is_drink_item,

        ---------- new flag for v2
        case when type in ('jaffle','beverage') then true else false end as is_edible_item

    from source

)

select
    product_id,
    product_name,
    product_type,
    product_description,

    ---------- renamed field
    product_price as price_usd,

    product_price_rounded,
    is_food_item,
    is_drink_item,
    is_edible_item
from renamed
