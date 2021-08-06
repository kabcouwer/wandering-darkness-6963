class PlantsController < ApplicationController
  def destroy
    design = Design.where('plot_id = ? and plant_id = ?', params[:plot_id], params[:id])
    design.first.delete
    redirect_to('/plots')
  end
end
