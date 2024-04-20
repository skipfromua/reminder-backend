class Notification < ApplicationRecord
  belongs_to :event

  scope :schedueld, -> { where(schedueld: true) }

  has_many :todo_lists, through: :event
end
