class Availability < ApplicationRecord
  belongs_to :mechanic

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
