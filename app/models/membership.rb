class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, presence: true, uniqueness: true
  validates :gym_id, presence: true
  validates :charge, presence: true

end
