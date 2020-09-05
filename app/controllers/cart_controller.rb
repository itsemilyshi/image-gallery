class CartController < ApplicationController
    before_action :set_cart

    def index
        @current_user = current_user
    end

    def show
        respond_to do |format|
            format.html {render :index}
        end
    end

    def add_to_cart
        photo = Photo.find(params[:photo_id])
        @cart.photos << photo
        respond_to do |format|
            format.html {redirect_to @cart}
        end
    end

    def remove_from_cart
        photo = Photo.find(params[:photo_id])
        @cart.photos.delete(photo)
        respond_to do |format|
            format.html {redirect_to @cart}
        end
    end

    def checkout 
        byebug
        current_user.money = current_user.money - @cart.cost
        current_user.save!
        byebug
        respond_to do |format|
            format.html {redirect_to @cart}
        end
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
