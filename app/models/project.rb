class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_item_cost
    items.average(:cost).to_f
  end

  def total_items
    items.count
  end
end
