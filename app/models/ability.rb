class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    can :read, Article, status: 'published'
    can :read, CommunityPost, status: 'visible'
    can :read, Meetup

    if user.persisted?
      can :create, CommunityPost
      can :create, Comment
      can :create, Vote
      can :manage, CommunityPost, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :manage, PortfolioItem, user_id: user.id
    end

    if user.admin?
      can :manage, :all
    end
  end
end