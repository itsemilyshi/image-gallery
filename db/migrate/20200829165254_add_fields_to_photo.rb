class AddFieldsToPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :price, :decimal, :precision => 8, :scale => 2 
    add_column :photos, :discount, :integer
    add_column :photos, :private, :boolean, default: true
    add_column :photos, :tags, :string
  end
end
