class Plot < ApplicationRecord
  belongs_to :garden
  has_many :designs
  has_many :plants, through: :designs
end
