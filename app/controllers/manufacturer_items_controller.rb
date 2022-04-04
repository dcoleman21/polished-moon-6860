class ManufacturerItemsController < ApplicationController
  def create
    manufacturer = Manufacturer.find(params[:new_manufacturer])
    item = Item.find(params[:item_id])
    ManufacturerItem.create!(item_id: item.id, manufacturer_id: manufacturer.id)
    redirect_to "/items/#{item.id}"
  end
end
