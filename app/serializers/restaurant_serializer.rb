class RestaurantSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :name, :opening_time, :closing_time,
             :created_by, :created_at, :updated_at

  # model association
  has_many :items
end
