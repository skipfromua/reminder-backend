class NotificationPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.left_outer_joins(event: :user).where(event: { user: })
    end

    private

    attr_reader :user, :scope
  end

  def index?(_params)
    true
  end

  def show?(_params)
    true
  end

  def create?(params)
    user.events.exists?(params[:event_id])
  end

  def update?(_params)
    true
  end

  def destroy?(_params)
    true
  end
end
