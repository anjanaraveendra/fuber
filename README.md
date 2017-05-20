<b>Setup:</b>

Clone: git clone https://github.com/anjanaraveendra/fuber.git

Run Bundle Install

rake db:create db:migrate db:seed

<b>Api's</b>

/api/v1/rides :   params: { source_lat, source_long & color pink if needed hipster }

/api/v1/rides/:id/start : params: { ride_id }

/api/v1/rides/:id/end : params: { destination_lat, destination_long }

/api/v1/rides/:id/payable_amount : params: { ride_id }

