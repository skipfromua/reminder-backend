require 'rails_helper'

RSpec.describe Rest::V1::TodoListsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event, user:) }
  let!(:todo_list1) { create(:todo_list, memo: 'test1', event:) }
  let!(:todo_list2) { create(:todo_list, memo: 'test2', event:) }

  before(:each) do
    log_in(user)
  end

  describe '#index' do
    it 'successfully returns todo_lists data' do
      get :index, params: { event_id: event.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: [
          {
            id: todo_list1.id.to_s,
            type: 'todo_list',
            attributes: {
              memo: todo_list1.memo,
              created_at: be_present
            }
          },
          {
            id: todo_list2.id.to_s,
            type: 'todo_list',
            attributes: {
              memo: todo_list2.memo,
              created_at: be_present
            }
          }
        ]
      )
    end
  end

  describe '#show' do
    it 'successfully returns todo_list data' do
      get :show, params: { event_id: event.id, id: todo_list1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: {
          id: todo_list1.id.to_s,
          type: 'todo_list',
          attributes: {
            memo: todo_list1.memo,
            created_at: be_present
          }
        }
      )
    end
  end

  describe '#create' do
    let(:params) do
      {
        event_id: event.id,
        todo_list: {
          memo: 'test test',
          event_id: event.id
        }
      }
    end

    it 'successfully creates todo_list' do
      post :create, params: params

      expect(response).to have_http_status(201)

      expect(JSON.parse(response.body, symbolize_names: true)).to include(
        data: {
          id: be_present,
          type: 'todo_list',
          attributes: {
            memo: 'test test',
            created_at: be_present
          }
        }
      )

      expect(TodoList.count).to eq(3)
    end
  end

  describe '#update' do
    let(:params) do
      {
        id: todo_list1.id,
        event_id: event.id,
        todo_list: {
          memo: 'test test'
        }
      }
    end

    it 'successfully updates todo_list' do
      patch :update, params: params

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'TodoList successfully updated'
      )

      expect(todo_list1.reload.attributes).to include({ 'memo' => 'test test' })
    end
  end

  describe '#destroy' do
    it 'successfully destroy todo_list' do
      delete :destroy, params: { event_id: event.id, id: todo_list1.id }

      expect(response).to have_http_status(200)

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        success: 'TodoList successfully deleted'
      )

      expect(TodoList.count).to eq(1)
    end
  end
end
