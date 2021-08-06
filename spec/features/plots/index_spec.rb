# User Story 1, Plots Index Page
# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants

require 'rails_helper'

RSpec.describe 'plots index page' do
  before :each do
    @garden_1 = Garden.create!(name: 'Community Garden', organic: true)
    @plot_1 = @garden_1.plots.create!(number: 1, size: 'Large', direction: 'East')
    @plot_2 = @garden_1.plots.create!(number: 7, size: 'Small', direction: 'West')
    @plot_3 = @garden_1.plots.create!(number: 21, size: 'Medium', direction: 'South')
  end

  it 'displays all plot numbers and plants associated to each' do
    visit '/plots'

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
  end
end
