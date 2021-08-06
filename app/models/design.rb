class Design < ApplicationRecord
  belongs_to :plant
  belongs_to :plot

  def self.find(plot_id, plant_id)
    Design.where('plot_id = ? and plant_id = ?', plot_id, plant_id).first
  end
end
