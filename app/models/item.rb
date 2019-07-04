class Item < ApplicationRecord
  # model association
  belongs_to :restaurant

  # validations
  validates_presence_of :name, :price
end
