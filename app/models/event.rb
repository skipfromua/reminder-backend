class Event < ApplicationRecord
  belongs_to :user

  has_many :todo_lists, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
