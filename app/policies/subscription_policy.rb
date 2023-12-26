class SubscriptionPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope, params: {})
      @user  = user
      @scope = scope
      @params = params
    end

    def resolve
      scope.where(user:)
    end

    private

    attr_reader :user, :scope, :params
  end

  def index?(params)
    params[:user_id] == user.id
  end

  def create?(params)
    params[:user_id] == user.id
  end

  def destroy?(params)
    params[:user_id] == user.id
  end
end
