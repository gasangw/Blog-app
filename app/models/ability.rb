class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
  #   user ||= User.new # guest user (not logged in)
  #   if user.role == 'admin'
  #     can :manage, :all
  #   else
  #     can %i[read create], :all
  #     can %i[update destroy], Post, user_id: user.id
  #     can %i[update destroy], Comment, user_id: user.id
  #   end
  #   #
  #   # See the wiki for details:
  #   # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  # end
end
