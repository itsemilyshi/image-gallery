class CartController < ApplicationController

    def add_to_cart
        byebug
        if current_user.cart == nil
            cart = Cart.create(user_id: current_user.id)
        else
            cart = Cart.find_by_user_id(current_user.id)
        end
        photo = Photo.find(params[:photo_id])
        cart.photos << photo
    end

    def remove_from_cart
        cart.photos.delete(@photo)
    end

    def checkout 
        current_user.money = current_user.money - cart.price
    end
end
