class Ride::RideStateFactory
  def self.create(ride)
    if ride.halted?
      Ride::HaltedRideState.new(ride)
    elsif ride.started?
      Ride::StartedRideState.new(ride)
    elsif ride.ended?
      Ride::EndedRideState.new(ride)
    end
  end
end
