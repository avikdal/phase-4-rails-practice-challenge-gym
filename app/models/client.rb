class Client < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships

    validates :age, numericality: { greater_than_or_equal_to: 18 }
end
