class CreateManufacturerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturer_items do |t|
      t.references :item, foreign_key: true
      t.references :manufacturer, foreign_key: true
    end
  end
end
