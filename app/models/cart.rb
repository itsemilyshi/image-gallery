class Cart < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :photos

    def cost
        price = 0
        self.photos.each do |photo|
            price = price + (photo.price * (1-(photo.discount / 100.0)))
        end
        return price
    end
end
