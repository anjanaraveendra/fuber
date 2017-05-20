# == Schema Information
#
# Table name: taxis
#
#  id         :integer          not null, primary key
#  latitude   :float
#  longitude  :float
#  color      :string
#  assigned   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Taxi < ApplicationRecord
  include Location
  validates :latitude, :longitude, presence: true

  def distance_to(latitude, longitude)
    distance_between(self.latitude, self.longitude, latitude, longitude)
  end

  def assigned?
    assigned
  end

  def hipster?
    color == 'pink'
  end

  def unassign
    update_attributes(assigned: false)
  end
end
