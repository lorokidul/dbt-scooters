select 
id,
user_id,
scooter_hw_id,
started_at,
finished_at,
start_lat,
start_lon,
finish_lat,
finish_lon,
distance as distance_m,
(price :: decimal(20,2)) / 100 as price_rub,
extract(epoch from(age(finished_at,started_at))) as duration_s,
(price = 0 and finished_at <> started_at) as is_free,
date(started_at) as "date"
from {{source("scooters_raw","trips")}}