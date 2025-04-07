require 'swagger_helper'

RSpec.describe 'Habits API', type: :request do
  path '/api/v1/habits/{habit_id}/reminders' do
    get 'List reminders for a habit' do
      tags 'Habits'
      produces 'application/json'
      parameter name: :habit_id, in: :path, type: :string, description: 'Habit ID'

      response '200', 'Reminders listed' do
        run_test!
      end
    end

    post 'Create a reminder for a habit' do
      tags 'Habits'
      consumes 'application/json'
      parameter name: :habit_id, in: :path, type: :string, description: 'Habit ID'
      parameter name: :reminder, in: :body, schema: {
        type: :object,
        properties: {
          time: { type: :string, format: :time, example: '08:00' }
        },
        required: ['time']
      }

      response '201', 'Reminder created' do
        run_test!
      end
    end
  end

  path '/api/v1/habits/{habit_id}/reminders/{id}' do
    delete 'Delete a reminder' do
      tags 'Habits'
      parameter name: :habit_id, in: :path, type: :string, description: 'Habit ID'
      parameter name: :id, in: :path, type: :string, description: 'Reminder ID'

      response '204', 'Reminder deleted' do
        run_test!
      end
    end
  end

  path '/api/v1/habits/{habit_id}/time_blocks/{id}/start' do
    patch 'Start a time block' do
      tags 'Habits'
      parameter name: :habit_id, in: :path, type: :string, description: 'Habit ID'
      parameter name: :id, in: :path, type: :string, description: 'Time Block ID'

      response '200', 'Time block started' do
        run_test!
      end
    end
  end

  path '/api/v1/habits/{habit_id}/time_blocks/{id}/finish' do
    patch 'Finish a time block' do
      tags 'Habits'
      parameter name: :habit_id, in: :path, type: :string, description: 'Habit ID'
      parameter name: :id, in: :path, type: :string, description: 'Time Block ID'

      response '200', 'Time block finished' do
        run_test!
      end
    end
  end
end