class Ability
  include CanCan::Ability
   user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can %i[read create], :all
      can %i[update destroy], Post, user_id: user.id
      can %i[update destroy], Comment, user_id: user.id
    end
  end
end
