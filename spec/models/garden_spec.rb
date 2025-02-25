require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  before :each do
    @garden_1 = Garden.create!(name: 'Community Garden', organic: true)

    @plot_1 = @garden_1.plots.create!(number: 1, size: 'Large', direction: 'East')
    @plot_2 = @garden_1.plots.create!(number: 7, size: 'Small', direction: 'West')
    @plot_3 = @garden_1.plots.create!(number: 21, size: 'Medium', direction: 'South')

    @plant_1 = Plant.create!(name: 'Purple Beauty Sweet Bell Pepper', description: 'Prefers rich, well draining soil', days_to_harvest: 90)
    @plant_2 = Plant.create!(name: 'Carrots', description: 'Prefers rich, well draining soil', days_to_harvest: 120)
    @plant_3 = Plant.create!(name: 'Cherry Tomatoes', description: 'Hardy', days_to_harvest: 90)
    @plant_4 = Plant.create!(name: 'Sweet Potato', description: 'Prefers rich, well draining soil', days_to_harvest: 120)

    @design_1 = Design.create!(plant: @plant_1, plot: @plot_1)
    @design_2 = Design.create!(plant: @plant_1, plot: @plot_2)
    @design_2 = Design.create!(plant: @plant_1, plot: @plot_3)
    @design_3 = Design.create!(plant: @plant_2, plot: @plot_2)
    @design_4 = Design.create!(plant: @plant_3, plot: @plot_2)
    @design_5 = Design.create!(plant: @plant_3, plot: @plot_3)
    @design_6 = Design.create!(plant: @plant_4, plot: @plot_3)
  end

  describe 'instance methods' do
    describe '#low_days_to_harvest_plants' do
      it 'finds unique plants with low days to harvest' do
        expect(@garden_1.low_days_to_harvest_plants.length).to eq(2)
        expect(@garden_1.low_days_to_harvest_plants.first.id).to eq(@plant_1.id)
        expect(@garden_1.low_days_to_harvest_plants.last.id).to eq(@plant_3.id)
      end
    end
  end
end
