select
language_id,
name
from {{ source("public", "language") }}