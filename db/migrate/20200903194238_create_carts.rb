class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|

      t.belongs_to :user

      t.timestamps
    end
    create_table :carts_photos do |t|
      t.belongs_to :photo
      t.belongs_to :cart
    end
  end
end
