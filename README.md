Setup:

Clone: git clone https://github.com/anjanaraveendra/fuber.git
Run Bundle Install
rake db:create db:migrate db:seed

Api's

/api/v1/rides:

params: { source_lat, source_long & color pink if needed hipster }

/api/v1/rides/:id/start

params: { ride_id }

/api/v1/rides/:id/end

params: { destination_lat, destination_long }

/api/v1/rides/:id/payable_amount

params: { ride_id }

