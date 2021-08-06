class PlantsController < ApplicationController
  def destroy
    design = Design.where('plot_id = ? and plant_id = ?', params[:plot_id], params[:id])
    Design.destroy(design.ids)
    redirect_to('/plots')
  end
end
