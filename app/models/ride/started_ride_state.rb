class Ride::StartedRideState < Ride::BaseRideState
  def start
    'Cannot Start a Started Ride'
  end

  def end(destination)
    ride = @ride.update_attributes(end_time: DateTime.current,
                                   destination_lat: destination[:destination_lat],
                                   destination_long: destination[:destination_long],
                                   status: 'ended')
    if ride
      @ride.taxi.unassign
      'Ride Ended Successfully'
    else
      "Unable to end ride because: #{@ride.errors.full_messages.join(' ')}"
    end
  end

  def payable_amount
    'Cannot calculate Payment Amount for a ride that has not Ended'
  end
end