if Taxi.count == 0
	10.times do |index|
	  Taxi.create(latitude: index + 1, longitude: index + 1)
	end
end