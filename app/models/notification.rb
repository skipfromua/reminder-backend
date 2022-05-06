class Notification < ApplicationRecord
  belongs_to :event

  has_many :todo_lists, through: :event
end
