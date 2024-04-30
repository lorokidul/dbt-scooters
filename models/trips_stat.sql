select 
count(*) as trips,
count(distinct user_id) as users,
avg(extract(minute from age(finished_at,started_at))) as avg_duration_m,
sum(price)/100 as revenue_rub,
(count(*) FILTER (WHERE price = 0) :: decimal)/ count(*) AS free_trips_percent
from scooters_raw.trips