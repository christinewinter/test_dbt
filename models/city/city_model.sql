select
city_id,
city,
country_id
from {{ source("public", "city") }}