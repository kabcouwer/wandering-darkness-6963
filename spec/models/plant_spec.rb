require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:designs) }
    it { should have_many(:plots).through(:designs) }
  end
end
