class Rest::V1::BaseApiController < ApplicationController
  include Pundit::Authorization
  before_action :authorized?

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_error

  def resource
    policy_class::Scope.new(current_user, controller_name.classify.constantize, params:).resolve
  end

  def authorized?
    policy_class.new(current_user).send("#{action_name}?", params)
  end

  def handle_not_found_error
    head :not_found
  end

  def policy_class
    "#{controller_name.classify}Policy".constantize
  end
end
