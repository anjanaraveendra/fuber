class Api::V1::RidesController < Api::V1::BaseController

	before_action :set_ride, only: [:start, :end, :payable_amount]

  def create
    ride = Ride.new(source_lat: ride_params[:source_lat],
                       source_long: ride_params[:source_long],
                       conditions: { color: ride_params[:color] })
    if ride.save
      render json: { ride_id: ride.id, message: 'Taxi Assigned Successfully' }
    else
      render json: 'No Taxi Available'
    end
  end

  def start
    message = @ride.start
    render json: { message: message }
  end

  def end
    message = @ride.end(destination_lat: ride_params[:destination_lat], destination_long: ride_params[:destination_lat])
    render json: { message: message }
  end

  def payable_amount
    amount = @ride.payable_amount
    render json: { payable_amount: amount }
  end

  private

  def set_ride
  	@ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(:source_lat, :source_long, :destination_lat, :destination_long)
  end
end
