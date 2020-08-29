class AddFieldsToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_reference :photos, :user, foreign_key: true

    add_column :photos, :description, :string
  end
end
