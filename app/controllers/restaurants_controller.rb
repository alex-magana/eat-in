class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
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
    # This is why we use create! in liue of create
    @restaurant = Restaurant.create!(restaurant_params)
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
    params.permit(:name, :opening_time, :closing_time, :created_by)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
