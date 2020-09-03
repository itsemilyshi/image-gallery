class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|

      t.belongs_to :cart

      t.timestamps
    end
  end
end
