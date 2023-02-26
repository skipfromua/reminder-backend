module Events
  class Build
    attr_accessor :params
    attr_reader :current_user

    def initialize(current_user, params)
      @params = params
      @current_user = current_user
    end

    def perform
      set_datetime_timezone

      current_user.events.new(params)
    end

    private

    def set_datetime_timezone
      params[:date] = DateTime.parse(params[:date]).in_time_zone
    end
  end
end
