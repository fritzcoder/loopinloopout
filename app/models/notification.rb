class Notification < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.add(source_object, related_object, action, recieving_user, source_user)
    case action
    when "project_subscription"
      notification = Notification.new 
      notification.luser_id = recieving_user.id
      notification.type = "Project"
      notification.entity_id = source_object.id
      notification.action = "Subscribed"
      notification.message = "<a href='/#{source_user.name}'>#{source_user.name}</a> subscribed to project <a href="">#{source_object.name}</a>"
      notification.save
      
    when "follow"
      notification = Notification.new 
      notification.luser_id = recieving_user.id
      notification.type = "Follow"
      notification.entity_id = source_object.id
      notification.action = "Followed"
      notification.message = "<a href='/#{source_user.name}'>#{source_user.name}</a> is now following you."
      notification.save
      
    when "bookmark"
      notification = Notification.new 
      notification.luser_id = recieving_user.id
      notification.type = "Bank"
      notification.entity_id = source_object.id
      notification.action = "Bookmarked"
      notification.message = "<a href='/#{source_user.name}'>#{source_user.name}</a> bookmarked bank <a href="">#{source_object.name}</a>"
      notification.save
    end
  end
end
