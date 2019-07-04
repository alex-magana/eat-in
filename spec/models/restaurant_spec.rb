require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  # Association test
  # ensure Restaurant model has a 1:m relationship with the Item model
  # .dependent(:destroy) is invoked in a has_many association to delete
  # children and grandchildren objects
  it { should have_many(:items).dependent(:destroy) }

  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:opening_time) }
  it { should validate_presence_of(:closing_time) }
  it { should validate_presence_of(:created_by) }
end
