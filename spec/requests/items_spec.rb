require 'rails_helper'

RSpec.describe 'Items API' do
  # initialize test data
  let(:user) { create(:user) }

  let!(:restaurant) { create(:restaurant, created_by: user.id) }
  let!(:items) { create_list(:item, 20, restaurant_id: restaurant.id) }
  let(:restaurant_id) { restaurant.id }
  let(:id) { items.first.id }

  let(:headers) { valid_headers }

  # Test suite for GET /restaurants/:restaurant_id/items
  describe 'GET /restaurants/:restaurant_id/items' do
    before do
      get "/restaurants/#{restaurant_id}/items",
          params: {}, headers: headers
    end

    context 'when restaurant exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all restaurant items' do
        expect(json.size).to eq(20)
      end
    end

    context 'when restaurant does not exist' do
      let(:restaurant_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Restaurant/)
      end
    end
  end

  # Test suite for GET /restaurants/:restaurant_id/items/:id
  describe 'GET /restaurants/:restaurant_id/items/:id' do
    before do
      get "/restaurants/#{restaurant_id}/items/#{id}",
          params: {}, headers: headers
    end

    context 'when restaurant item exists' do
      it 'returns a status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when a restaurant item does not exist' do
      let(:id) { 0 }

      it 'returns a status code 404' do
        expect(response).to have_http_status(404) 
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for POST /restaurants/:restaurant_id/items
  describe 'POST /restaurants/:restaurant_id/items' do
    let(:valid_attributes) do
      { name: 'Caesar Salad', price: 440.50, available: true }.to_json
    end

    context 'when request attributes are valid' do
      before do
        post "/restaurants/#{restaurant_id}/items",
             params: valid_attributes, headers: headers
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before do
        post "/restaurants/#{restaurant_id}/items",
             params: {}, headers: headers
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body)
          .to match(
            /Validation failed: Name can't be blank, Price can't be blank/
          )
      end
    end
  end

  # Test suite for PUT /restaurants/:restaurant_id/items/:id
  describe 'PUT /restaurants/:restaurant_id/items/:id' do
    let(:valid_attributes) { { name: 'Greek Salad' }.to_json }

    before do
      put "/restaurants/#{restaurant_id}/items/#{id}",
          params: valid_attributes, headers: headers
    end

    context 'when item exists' do
      it 'returns a status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.name).to match(/Greek Salad/)
      end
    end

    context 'when item does not exist' do
      let(:id) { 0 }

      it 'returns the status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  # Test suite for DELETE /restaurants/:restaurant_id/items/:id
  describe 'DELETE /restaurants/:restaurant_id/items/:id' do
    before do
      delete "/restaurants/#{restaurant_id}/items/#{id}",
             params: {}, headers: headers
    end

    it 'returns a status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
