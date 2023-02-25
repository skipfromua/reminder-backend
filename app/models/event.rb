class Event < ApplicationRecord
  belongs_to :user

  scope :by_month, ->(month) do
    where("extract(month from date) = ?", month)
  end

  has_many :todo_lists, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
