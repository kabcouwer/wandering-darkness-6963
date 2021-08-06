require 'rails_helper'

RSpec.describe 'garden show page' do
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

  it 'displays the gardens plants' do
    # User Story 3, Garden's Plants
    # As a visitor
    # When I visit an garden's show page
    # Then I see a list of plants that are included in that garden's plots
    # And I see that this list is unique (no duplicate plants)
    # And I see that this list only includes plants that take less than 100 days to harvest

    visit ("/gardens/#{@garden_1.id}")

    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_no_content(@plant_2.name)
    expect(page).to have_no_content(@plant_4.name)
  end

end
