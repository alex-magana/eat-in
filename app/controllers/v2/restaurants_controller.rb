# V2::RestaurantsController is shorthand for defining a class within a namespace

class V2::RestaurantsController < ApplicationController
  def index
    json_response({ message: 'Hello from version, v2' })
  end
end
