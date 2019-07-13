module V1
  class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :update, :destroy]
  
    # GET /restaurants
    def index
      # get current user restaurants
      @restaurants = current_user.restaurants
      json_response(@restaurants)
    end
  
    # POST /restaurants
    def create
      # Note
      # ActiveRecord::Persistence::ClassMethods
      # Model.create creates an object and saves it in the database, If validation
      # passes.
      # The resulting object is returned whether or not the object
      # was saved successfully to the db
      # Model.create! creates an object and saves it in the database, If validation
      # passes.
      # Model.create! raises ActiveRecord::RecordInvalid if validation fails.
      # This is why we use create! in lieu of create
  
      # create restaurants belonging to the the current user
      @restaurant = current_user.restaurants.create!(restaurant_params)
      json_response(@restaurant, :created)
    end
  
    # GET /restaurants/:id
    def show
      json_response(@restaurant)
    end
  
    # PUT /restaurants/:id
    def update
      @restaurant.update(restaurant_params)
      # head :no_content indicates that we are returning a response
      # with no content
      head :no_content
    end
  
    # DELETE /restaurant/:id
    def destroy
      @restaurant.destroy
      # head :no_content indicates that we are returning a response
      # with no content
      head :no_content
    end
  
    private
  
    def restaurant_params
      # whitelist params
  
      # remove `created_by` from list of permitted parameters
      # this is because `created_by` is provided via current_user
      params.permit(:name, :opening_time, :closing_time)
    end
  
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
  end
end
