class Event < ApplicationRecord
  belongs_to :user

  has_many :todo_lists
  has_one :notification
end
