class EventPolicy < ApplicationPolicy
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

  def index?(_params)
    true
  end

  def by_month?(_params)
    true
  end

  def show?(_params)
    true
  end

  def create?(params)
    params[:user_id] == user.id
  end

  def update?(_params)
    true
  end

  def destroy?(_params)
    true
  end
end
