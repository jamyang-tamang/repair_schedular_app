class Repair < ApplicationRecord
  belongs_to :mechanic
  belongs_to :repair_type
  belongs_to :subscriber
  belongs_to :vehicle

  validates :scheduled_at, presence: true
  validates :duration, inclusion: { in: [1, 2, 3] } # 
end
