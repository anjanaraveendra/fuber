# == Schema Information
#
# Table name: rides
#
#  id               :integer          not null, primary key
#  source_lat       :float
#  source_long      :float
#  start_time       :string
#  end_time         :string
#  destination_lat  :float
#  destination_long :float
#  status           :integer
#  taxi_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Ride < ApplicationRecord
  belongs_to :taxi

  include Location
  attr_accessor :conditions

  validates :source_long, :source_lat, presence: true
  validates :taxi, presence: true
  validates :destination_lat, presence: true, if: Proc.new { |ride| ride.ended? }
  validates :destination_long, presence: true, if: Proc.new { |ride| ride.ended? }
  before_validation :assign_available_taxi

  enum status: [:halted, :started, :ended]

  after_initialize :set_state

  def start
    @state.start
  end

  def end(destination)
    @state.end(destination)
  end

  def payable_amount
    @state.payable_amount
  end

  private

  def set_state
    @state = RideStateFactory.create(self)
  end

  def assign_available_taxi
    self.taxi = AvailableTaxi.nearest_to(source_lat, source_long, conditions)
    self.taxi.assign if self.taxi
  end
end
