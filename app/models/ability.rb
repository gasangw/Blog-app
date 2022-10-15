class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can %i[read create], :all
      can %i[update destroy], Post, user_id: user.id
      can %i[update destroy], Comment, user_id: user.id

    end
  end
end
