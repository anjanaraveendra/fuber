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

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
