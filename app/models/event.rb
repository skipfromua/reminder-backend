class Event < ApplicationRecord
  belongs_to :user

  has_many :todo_lists, dependent: :destroy
  has_one :notification, dependent: :destroy
end
