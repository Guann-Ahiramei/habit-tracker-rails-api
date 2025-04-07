require 'swagger_helper'

RSpec.describe 'Categories API', type: :request do
  path '/api/v1/categories' do
    get 'List all categories' do
      tags 'Categories'
      produces 'application/json'

      response '200', 'Categories listed' do
        run_test!
      end
    end
  end

  path '/api/v1/categories/{category_id}/habits' do
    post 'Create a habit in a category' do
      tags 'Categories'
      consumes 'application/json'
      parameter name: :category_id, in: :path, type: :string, description: 'Category ID'
      parameter name: :habit, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Exercise' },
          description: { type: :string, example: 'Daily workout' }
        },
        required: ['name']
      }

      response '201', 'Habit created' do
        run_test!
      end
    end
  end
end