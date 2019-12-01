class Company < ApplicationRecord
  has_many :users
  has_many :repositories, dependent: :destroy
end
