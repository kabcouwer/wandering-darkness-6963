class Garden < ApplicationRecord
  has_many :plots

  def low_days_to_harvest_plants
    plots.joins(:plants)
         .select('DISTINCT plants.*')
         .where(plants: {days_to_harvest: 90})
         .order('plants.id')
  end
end
