select  date(started_at) ,
count(*) as n_trips, 
max(price/100) as max_price_rub, avg(distance/1000) as avg_distance_km from scooters_raw.trips 
group by date(started_at)  