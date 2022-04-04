require 'rails_helper'

RSpec.describe 'Manufacturers Index Page' do
  before(:each) do
    @project_1 = Project.create!(name: 'Project One', manager: 'Zebulin Hampsterdash')
    @project_2 = Project.create!(name: 'Project Two', manager: 'Ursula Spinner')
    @project_3 = Project.create!(name: 'Project Three', manager: 'Hank Boingner')
    #items
    @hammer = @project_1.items.create!(name: 'Hammer', cost: 15)
    @wood = @project_1.items.create!(name: 'Wood', cost: 200)
    @screws = @project_1.items.create!(name: 'Screws', cost: 30)
    @tools = @project_1.items.create!(name: 'Tools', cost: 400)
    @steel = @project_2.items.create!(name: 'Steel', cost: 300)
    @torch = @project_2.items.create!(name: 'Acetylene', cost: 200)
    @concrete = @project_2.items.create!(name: 'Concrete', cost: 125)
    @tools = @project_2.items.create!(name: 'Tools', cost: 400)
    #manufacturers
    @abc = Manufacturer.create!(name: 'ABC Hammers', location: 'Manatee County, FL')
    @rfp = Manufacturer.create!(name: 'Resolute Forest Products Inc.', location: 'Montreal, Quebec')
    @sfs = Manufacturer.create!(name: 'Southern Fasteners & Supply, Inc.', location: 'Winston-Salem, NC')
    @bosch = Manufacturer.create!(name: 'Bosch', location: 'Gerlingen, Germany')
    @ussc = Manufacturer.create!(name: 'United States Steel Corp.', location: 'Pittsburgh, PA')
    @ck = Manufacturer.create!(name: 'CK Worldwide', location: 'Auburn, WA')
    @cem = Manufacturer.create!(name: 'Cemex', location: 'San Pedro Garza García, Mexico')
    #manufacturer_items
    ManufacturerItem.create!(item_id: @hammer.id, manufacturer_id: @abc.id)
    ManufacturerItem.create!(item_id: @wood.id, manufacturer_id: @rfp.id)
    ManufacturerItem.create!(item_id: @screws.id, manufacturer_id: @sfs.id)
    ManufacturerItem.create!(item_id: @tools.id, manufacturer_id: @bosch.id)
    ManufacturerItem.create!(item_id: @steel.id, manufacturer_id: @ussc.id)
    ManufacturerItem.create!(item_id: @torch.id, manufacturer_id: @ck.id)
    ManufacturerItem.create!(item_id: @concrete.id, manufacturer_id: @cem.id)
  end

  context 'User Story 2' do
    it "can see a list of names of all manufacturers and all of the items they belong to" do
      visit '/manufacturers'

      expect(page).to have_content('All Manufacturers and Their Items')

      within("#manufacturer-#{@abc.id}") do
        expect(page).to have_content('ABC Hammers')
        expect(page).to have_content('Hammer')
        expect(page).to_not have_content('Resolute Forest Products Inc.')
        expect(page).to_not have_content('Wood')
      end

      within("#manufacturer-#{@rfp.id}") do
        expect(page).to have_content('Resolute Forest Products Inc.')
        expect(page).to have_content('Wood')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end

      within("#manufacturer-#{@sfs.id}") do
        expect(page).to have_content('Southern Fasteners & Supply, Inc.')
        expect(page).to have_content('Screws')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end

      within("#manufacturer-#{@bosch.id}") do
        expect(page).to have_content('Bosch')
        expect(page).to have_content('Tools')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end

      within("#manufacturer-#{@ussc.id}") do
        expect(page).to have_content('United States Steel Corp.')
        expect(page).to have_content('Steel')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end

      within("#manufacturer-#{@ck.id}") do
        expect(page).to have_content('CK Worldwide')
        expect(page).to have_content('Acetylene')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end
      within("#manufacturer-#{@cem.id}") do
        expect(page).to have_content('Cemex')
        expect(page).to have_content('Concrete')
        expect(page).to_not have_content('ABC Hammers')
        expect(page).to_not have_content('Hammer')
      end
    end
  end
end
