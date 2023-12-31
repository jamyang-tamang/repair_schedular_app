class Subscriber < ApplicationRecord
  has_secure_password
  belongs_to :vehicle, optional: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
end