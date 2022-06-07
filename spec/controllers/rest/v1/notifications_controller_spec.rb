require 'rails_helper'

RSpec.describe Rest::V1::NotificationsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, user:) }
  let!(:notification1) { create(:notification, enabled: true, start_notifying_days_before: 1, event:) }
  let!(:notification2) { create(:notification, enabled: false, start_notifying_days_before: 4, event:) }

  before(:each) do
    log_in(user)
  end

  describe '#index' do
    it 'successfully returns notifications data' do
      get :index, params: { event_id: event.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: [
          {
            id: notification1.id.to_s,
            type: 'notification',
            attributes: {
              enabled: notification1.enabled,
              start_notifying_days_before: notification1.start_notifying_days_before,
              notifying_at: notification1.notifying_at
            }
          },
          {
            id: notification2.id.to_s,
            type: 'notification',
            attributes: {
              enabled: notification2.enabled,
              start_notifying_days_before: notification2.start_notifying_days_before,
              notifying_at: notification1.notifying_at
            }
          }
        ]
      )
    end
  end

  describe '#show' do
    it 'successfully returns notification data' do
      get :show, params: { event_id: event.id, id: notification1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: {
          id: notification1.id.to_s,
          type: 'notification',
          attributes: {
            enabled: notification1.enabled,
            start_notifying_days_before: notification1.start_notifying_days_before,
            notifying_at: notification1.notifying_at
          }
        }
      )
    end
  end

  describe '#create' do
    let(:params) do
      {
        event_id: event.id,
        notification: {
          event_id: event.id,
          enabled: false,
          start_notifying_days_before: 3,
          notifying_at: ['11:00', '12:00']
        }
      }
    end

    it 'successfully creates notification' do
      post :create, params: params

      expect(response).to have_http_status(201)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: {
          id: be_present,
          type: 'notification',
          attributes: {
            enabled: false,
            start_notifying_days_before: 3,
            notifying_at: ['11:00', '12:00']
          }
        }
      )

      expect(Notification.count).to eq(3)
    end
  end

  describe '#update' do
    let(:params) do
      {
        id: notification1.id,
        event_id: event.id,
        notification: {
          enabled: false,
          start_notifying_days_before: 3,
          notifying_at: ['11:00', '12:00']
        }
      }
    end

    it 'successfully updates notification' do
      patch :update, params: params

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'Notification successfully updated'
      )

      expect(notification1.reload.attributes).to include({
                                                           'enabled' => false,
                                                           'start_notifying_days_before' => 3,
                                                           'notifying_at' => ['11:00', '12:00']
                                                         })
    end
  end

  describe '#destroy' do
    it 'successfully destroy notification' do
      delete :destroy, params: { event_id: event.id, id: notification1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'Notification successfully deleted'
      )

      expect(Notification.count).to eq(1)
    end
  end
end
