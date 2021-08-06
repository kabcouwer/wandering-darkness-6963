require 'rails_helper'

RSpec.describe Design do
  describe 'relationships' do
    it { should belong_to(:plant) }
    it { should belong_to(:plot) }
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
  end

  describe 'class methods' do
    describe '.find' do
      it 'finds a design by plot id and plant id' do
        expect(Design.find(@plot_1.id, @plant_1.id)).to eq(@design_1)
      end
    end
  end
end
