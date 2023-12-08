class Mechanic < ApplicationRecord
  belongs_to :repair_type
  belongs_to :market
  has_many :availabilities
  has_many :repairs

  validates :name, presence: true
end
