class Restaurant < ApplicationRecord
  # model association
  has_many :items, dependent: :destroy

  # validations
  validates_presence_of :name, :opening_time, :closing_time, :created_by
end
