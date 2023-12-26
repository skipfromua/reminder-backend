# frozen_string_literal: true

task update_events_date: :environment do
  current_date = Date.current
  events = Event.where(date: current_date)
  events.update(date: current_date + 1.year)
end
