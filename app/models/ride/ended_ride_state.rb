class Ride::EndedRideState < Ride::BaseRideState
  def start
    'Cannot Start an Ended Ride'
  end

  def end(_destination)
    'Cannot End an Ended Ride'
  end

  def payable_amount
    (travelled_time * Prices::PERMIN + travelled_distance * Prices::PERKM + extras.to_f).ceil
  end

  private

  def travelled_time
    (@ride.end_time - @ride.start_time) / 60
  end

  def travelled_distance
    @ride.distance_between(@ride.source_lat, @ride.source_long,
                           @ride.destination_lat, @ride.destination_long)
  end

  def extras
    Prices::HIPSTERCAR if @ride.taxi.hipster?
  end
end
