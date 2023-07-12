class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, author_id: user.id
    can :read, Entity, author_id: user.id
    can :destroy, Category, author_id: user.id
    can :destroy, Entity, author_id: user.id
  end
end
