class CartController < ApplicationController
    before_action :set_cart

    def add_to_cart
        photo = Photo.find(params[:photo_id])
        @cart.photos << photo
    end

    def remove_from_cart
        @cart.photos.delete(photo)
    end

    def checkout 
        current_user.money = current_user.money - @cart.price
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
        if current_user.cart == nil
            @cart = Cart.create(user_id: current_user.id)
        else
            @cart = current_user.cart
        end    
    end
end
