class ManufacturerItemsController < ApplicationController
  def create
    manufacturer = Manufacturer.find(params[:new_manufacturer])
    # item = Item.find(params[:item_id])
    ManufacturerItem.create!(item_id: params[:item_id], manufacturer_id: manufacturer.id)
    redirect_to "/items/#{params[:item_id]}"
  end
end
