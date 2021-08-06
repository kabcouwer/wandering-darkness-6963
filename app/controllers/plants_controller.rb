class PlantsController < ApplicationController
  def destroy
    design = Design.find(params[:plot_id], params[:id])
    design.delete
    redirect_to('/plots')
  end
end
