class Ride::HaltedRideState < Ride::BaseRideState
  def start
    ride = @ride.update_attributes(start_time: DateTime.current, status: 'started')
    if ride
      'Ride Started Successfully'
    end
  end

  def end(destination)
    'Cannot End an Unstarted Ride'
  end

  def payable_amount
    'Cannot calculate Payment Amount for a ride that has not Ended'
  end
end