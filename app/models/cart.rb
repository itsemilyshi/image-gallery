class Cart < ApplicationRecord
    belongs_to :user
    has_many :photos

    def cost
        price = 0
        cart.photos.each do |photo|
            price = price + (photo.price * (photo.discount / 100))
        end
        return cost
    end
end
