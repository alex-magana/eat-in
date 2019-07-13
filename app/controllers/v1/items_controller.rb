module V1
  class ItemsController < ApplicationController
    before_action :set_restaurant
    before_action :set_restaurant_item, only: [:show, :update, :destroy]
  
    # GET /restaurants/:restaurant_id/items
    def index
      json_response(@restaurant.items)
    end
  
    # GET /restaurants/:restaurant_id/items/id
    def show
      json_response(@item)
    end
  
    # POST /restaurants/:restaurant_id/items
    def create
      @restaurant.items.create!(item_params)
      json_response(@restaurant, :created)
    end
  
    # PUT /restaurants/:restaurant_id/items/:id
    def update
      @item.update(item_params)
      head :no_content
    end
  
    # DELETE /restaurants/:restaurant_id/items/id
    def destroy
      @item.destroy
      head :no_content
    end
  
    private
  
    def item_params
      params.permit(:name, :price, :available)
    end
  
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  
    def set_restaurant_item
      # We use find_by because it raises an ActiveRecord::RecordNotFound error
      # if no record is found
      @item = @restaurant.items.find_by!(id: params[:id]) if @restaurant
    end
  end
end
