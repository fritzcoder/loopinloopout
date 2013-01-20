class Ability
  include CanCan::Ability

  def initialize(user)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    user ||= User.new
    
    #can :read, Project, Project.public do |project|
    #      project.access ? true
    #end
    #if user.luser.name != nil
    #  can :create, Project
    #end
    ActiveRecord::Base.logger.info("Checking access ....................")
    
    can :update, Project do |p|
      #ActiveRecord::Base.logger.info("Access: " + p.user_access(user))
      p.user_access(user) == "Contributor"
    end
    
    can :read, Project do |p|
      p.access == "Public"
    end
    
    can :create, Project
    
    can :manage, Project do |p|
      #ActiveRecord::Base.logger.info(p.created_by)
      p.created_by == user.luser.name
    end
    
   
    
    #can :read, Project
    #can :contibutor, Project do |p|
    #  p.lusers.each do |u|
    #    if u.name == user.luser.name
    #      return true
    #    end
    #  end
      #false
    #end
    
  
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
