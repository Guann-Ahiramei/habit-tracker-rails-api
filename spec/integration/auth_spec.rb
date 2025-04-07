require 'swagger_helper'

RSpec.describe 'Auth API', type: :request do
  path '/api/v1/auth' do
    post 'User authentication' do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'user@example.com' },
          password: { type: :string, example: 'password123' }
        },
        required: ['email', 'password']
      }

      response '200', 'Authenticated successfully' do
        run_test!
      end
    end
  end
end