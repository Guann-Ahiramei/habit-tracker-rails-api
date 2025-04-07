require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/api/v1/users/{id}/follow' do
    post 'Follow a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'User ID'

      response '200', 'User followed' do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/unfollow' do
    post 'Unfollow a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'User ID'

      response '200', 'User unfollowed' do
        run_test!
      end
    end
  end
end