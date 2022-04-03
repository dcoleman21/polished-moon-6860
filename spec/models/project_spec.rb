require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
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
    end

    it "can get average cost for an item" do
      expect(@project_1.average_item_cost).to eq(161.25)
      expect(@project_2.average_item_cost).to eq(256.25)
    end

    it "can get the total count of items for a project" do
      expect(@project_1.total_items).to eq(4)
      expect(@project_2.total_items).to eq(4)
    end
  end
end
