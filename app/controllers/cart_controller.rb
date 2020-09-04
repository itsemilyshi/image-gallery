class CartController < ApplicationController

    def add_to_cart
        if current_user.cart == nil
            cart = Cart.create(user_id: current_user.id)
        else
            cart = Cart.find(user_id: current_user.id)
        end

        cart.photos << photo
        cart.save #not needed?? 
    end

    def remove_from_cart
        cart.photos.delete(photo)
    end

    def checkout 
        current_user.money = current_user.money - cart.price
    end
end
