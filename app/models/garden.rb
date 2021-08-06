class Garden < ApplicationRecord
  has_many :plots

  def low_days_to_harvest_plants
    wip = plots.joins(:plants)
         .select('DISTINCT plants.*')
         .where('plants.days_to_harvest < ?', 100)
         .order('plants.id')
  end
end
