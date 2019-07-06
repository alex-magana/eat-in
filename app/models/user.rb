class User < ApplicationRecord
  # encrypt password
  # has_secure_password is a ActiveModel model
  # method that defines logic to authenticate against a
  # gem, bcrypt, password
  # password_digest is requied in the bcrypt approach
  has_secure_password

  # Model associations
  has_many :restaurants, foreign_key: :created_by

  # Validations
  validates_presence_of :name, :email, :password_digest
end
