require 'rails_helper'

RSpec.describe Item, type: :model do
  # Association test
  # ensure an Item record belongs to a single restaurant record
  it { should belong_to(:restaurant) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end
