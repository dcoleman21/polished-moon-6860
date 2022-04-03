require 'rails_helper'

RSpec.describe 'Projects show page' do
  before(:each) do
    @project_1 = Project.create!(name: 'Project One', manager: 'Zebulin Hampsterdash')
    @project_2 = Project.create!(name: 'Project Two', manager: 'Ursula Spinner')
    @project_3 = Project.create!(name: 'Project Three', manager: 'Hank Boingner')

    @hammer = @project_1.items.create!(name: 'Hammer', cost: 15)
    @wood = @project_1.items.create!(name: 'Wood', cost: 200)
    @screws = @project_1.items.create!(name: 'Screws', cost: 30)
    @tools = @project_1.items.create!(name: 'Tools', cost: 400)
    @steel = @project_2.items.create!(name: 'Steel', cost: 300)
    @torch = @project_2.items.create!(name: 'Acetylene', cost: 200)
    @concrete = @project_2.items.create!(name: 'Concrete', cost: 125)
    @tools = @project_2.items.create!(name: 'Tools', cost: 400)
  end

  context 'Extension 1' do
    it "can see the average cost per item for this projects items; round two decimal places" do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("#{@project_1.name} Details")
      expect(page).to have_content('Total count of items for this project and the items average cost.')

      expect(page).to have_content('Item Count:')
      expect(page).to have_content(4)
      expect(page).to have_content('Average Cost: $')
      expect(page).to have_content(161.25)
    end
  end
end
