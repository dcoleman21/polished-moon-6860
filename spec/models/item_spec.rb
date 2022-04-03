require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through(:manufacturer_items) }
  end

  describe 'instance methods' do
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

    it "can get the count of manufacturers for an item" do
      expect(@hammer.manufacturer_count).to eq(1)
      expect(@wood.manufacturer_count).to eq(1)
      expect(@screws.manufacturer_count).to eq(1)
      expect(@hammer.manufacturer_count).to_not be(nil)
    end
  end
end
