class Plant < ApplicationRecord
  has_many :designs
  has_many :plots, through: :designs
end
