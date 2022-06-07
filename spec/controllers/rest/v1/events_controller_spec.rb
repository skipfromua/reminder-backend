require 'rails_helper'

RSpec.describe Rest::V1::EventsController, type: :controller do
  let(:user) { create(:user) }
  let!(:event1) { create(:event, name: 'test1', date: Date.current, user:) }
  let!(:event2) { create(:event, name: 'test2', date: Date.current, user:) }

  before(:each) do
    log_in(user)
  end

  describe '#index' do
    it 'successfully returns events data' do
      get :index

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        data: [
          {
            id: event1.id.to_s,
            type: 'event',
            attributes: {
              name: event1.name,
              date: event1.date.to_s
            }
          },
          {
            id: event2.id.to_s,
            type: 'event',
            attributes: {
              name: event2.name,
              date: event2.date.to_s
            }
          }
        ]
      )
    end
  end

  describe '#show' do
    it 'successfully returns event data' do
      get :show, params: { id: event1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        data: {
          id: event1.id.to_s,
          type: 'event',
          attributes: {
            name: event1.name,
            date: event1.date.to_s
          }
        }
      )
    end
  end

  describe '#create' do
    let(:params) do
      {
        event: {
          name: 'test_name',
          repeatable: 'yearly',
          date: Date.current.to_s,
          user_id: user.id
        }
      }
    end

    it 'successfully creates event' do
      post :create, params: params

      expect(response).to have_http_status(201)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: {
          id: be_present,
          type: 'event',
          attributes: {
            name: 'test_name',
            date: Date.current.to_s
          }
        }
      )

      expect(Event.count).to eq(3)
    end
  end

  describe '#update' do
    let(:params) do
      {
        id: event1.id,
        event: {
          name: 'test_name',
          repeatable: 'yearly',
          date: Date.current.to_s
        }
      }
    end

    it 'successfully updates event' do
      patch :update, params: params

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'Event successfully updated'
      )

      expect(event1.reload.attributes).to include({
                                                    'name' => 'test_name',
                                                    'repeatable' => 'yearly',
                                                    'date' => Date.current
                                                  })
    end
  end

  describe '#destroy' do
    it 'successfully destroy event' do
      delete :destroy, params: { id: event1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'Event successfully deleted'
      )

      expect(Event.count).to eq(1)
    end
  end
end
