select trip_date, age, count(*) as n_trips 
from( 
select date(t.started_at) as trip_date,u.user_id,u.birth_date, extract(year from age(t.started_at,u.birth_date)) as age from 
scooters_raw.trips as  t
inner join (select id as user_id, birth_date from scooters_raw.users )as u
using(user_id)
)
group by trip_date,age