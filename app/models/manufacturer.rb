class Manufacturer < ApplicationRecord
  validates_presence_of :name, :location
  has_many :manufacturer_items
  has_many :items, through: :manufacturer_items
end
