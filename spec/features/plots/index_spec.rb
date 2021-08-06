require 'rails_helper'

RSpec.describe 'plots index page' do
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
    @design_2 = Design.create!(plant: @plant_2, plot: @plot_1)
    @design_3 = Design.create!(plant: @plant_3, plot: @plot_2)
  end

  it 'displays all plot numbers and plants associated to each' do
    # User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots')
    # I see a list of all plot numbers
    # And under each plot number I see names of all that plot's plants
    visit '/plots'

    within "#plot-#{@plot_1.id}" do
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
    end

    within "#plot-#{@plot_2.id}" do
      expect(page).to have_content(@plot_2.number)
      expect(page).to have_content(@plant_3.name)
    end

    within "#plot-#{@plot_3.id}" do
      expect(page).to have_content(@plot_3.number)
    end
  end

  it 'has a link to remove a plant from that plot' do
    # User Story 2, Remove a Plant from a Plot
    # As a visitor
    # When I visit a plot's index page
    # Next to each plant's name
    # I see a link to remove that plant from that plot
    # When I click on that link
    # I'm returned to the plots index page
    # And I no longer see that plant listed under that plot
    # (Note: you should not destroy the plant record entirely)
    visit '/plots'

    within "#plant-#{@plant_1.id}" do
      expect(page).to have_link('Remove')
    end

    within "#plant-#{@plant_2.id}" do
      expect(page).to have_link('Remove')
    end

    within "#plant-#{@plant_3.id}" do
      expect(page).to have_link('Remove')
    end
  end

  it 'has a working link that removes the plant from the plot' do
    visit '/plots'

    within "#plant-#{@plant_1.id}" do
      click_link('Remove')
    end

    expect(current_path).to eq('/plots')

    within "#plot-#{@plot_1.id}" do
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_no_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
    end

    # it does not delete the plant record completely
    expect(@plot_1.plants.length).to eq(1)
    expect(Plant.all.length).to eq(4)
  end
end
