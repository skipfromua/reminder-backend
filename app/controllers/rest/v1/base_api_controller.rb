class Rest::V1::BaseApiController < ApplicationController
  include Pundit::Authorization
  before_action :authorized?

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_error

  def resource
    policy_scope(controller_name.classify.constantize)
  end

  def authorized?
    "#{controller_name.classify}Policy".constantize.new(current_user)
                                       .send("#{action_name}?", params)
  end

  def handle_not_found_error
    head :not_found
  end
end
