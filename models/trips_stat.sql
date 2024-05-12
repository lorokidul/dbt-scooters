select 
count(*) as trips,
count(distinct user_id) as users,
avg(duration_s) / 60 as avg_duration_min,
sum(price_rub) as revenue_rub,
(count(*) FILTER (WHERE is_free=True) :: decimal)/ count(*) AS free_trips_pct,
sum(distance_m)/1000 as sum_distance_km
from {{ref("trips_prep")}}