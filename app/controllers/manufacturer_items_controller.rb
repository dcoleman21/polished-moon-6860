class ManufacturerItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    manufacturer = Manufacturer.find_by(name: params[:manufacturer_name])
    ManufacturerItem.create!(item_id: item.id, manufacturer_id: manufacturer.id)
    redirect_to "/items/#{item.id}"
  end
end
