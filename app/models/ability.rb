class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user_signed_in?

    return unless current_user && user

    can :read, :all
    can :destroy, Food, user: current_user
    can :destroy, Recipe, user: current_user
  end
end
