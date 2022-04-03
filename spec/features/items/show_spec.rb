require 'rails_helper'

RSpec.describe 'Items show page' do
  before(:each) do
    @project_1 = Project.create!(name: 'Project One', manager: 'Zebulin Hampsterdash')
    @project_2 = Project.create!(name: 'Project Two', manager: 'Ursula Spinner')
    @hammer = @project_1.items.create!(name: 'Hammer', cost: 15)
    @wood = @project_1.items.create!(name: 'Wood', cost: 200)
    @screws = @project_1.items.create!(name: 'Screws', cost: 30)
    @tools = @project_1.items.create!(name: 'Tools', cost: 400)
    @rfp = Manufacturer.create!(name: 'Resolute Forest Products Inc.', location: 'Montreal, Quebec')
    ManufacturerItem.create!(item_id: @wood.id, manufacturer_id: @rfp.id)
  end

  context 'User Story 1' do
    it "can see that item's name and cost" do
      visit "/items/#{@hammer.id}"

      expect(page).to have_content('Hammer')
      expect(page).to have_content(15)
      expect(page).to_not have_content('Wood')
      expect(page).to have_content('Item Details')
    end

    it "can see the name of the project that it belongs to" do
      visit "/items/#{@hammer.id}"

      expect(page).to have_content('Project One')
      expect(page).to_not have_content('Project Two')
      expect(page).to have_content('Item Details')
    end
  end

  context 'User Story 3' do
    it "can see a count of the number of manufacturers for this item" do
      visit "/items/#{@hammer.id}"

      expect(page).to have_content('Number of manufacturers for this item:')
      expect(page).to have_content(1)
    end
  end

  context 'Extension 2' do
    it "can see a form to add a manufacturer" do
      visit "/items/#{@hammer.id}"

      expect(page).to have_content('Add a manufacturer to this project')

      within(".add_manufacturer") do
        fill_in :manufacturer_name, with: 'Resolute Forest Products Inc.'

        click_on "Add manufacturer to item"
      end
      expect(current_path).to eq("/items/#{@hammer.id}")
      # expect(page).to have_content(2)
    end
  end
end
