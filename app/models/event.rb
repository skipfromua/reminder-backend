class Event < ApplicationRecord
  belongs_to :user

  scope :by_month, lambda { |month|
    where("extract(month from date) = ?", month)
  }

  has_many :todo_lists, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
