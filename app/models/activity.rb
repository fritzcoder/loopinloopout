class Activity < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.CreatedBank(user, bank)
    activity = Activity.new
    activity.o_id = user.id
    activity.object_type = "User"
    activity.description = "<a href='/#{user.name}'>#{user.name}</a> created a new bank 
    <a href='/#{user.name}/banks/#{bank.id}'>#{bank.name}</a>"
    activity.save
  end
  
  def self.created_project(user, project)
    activity = Activity.new
    activity.o_id = user.id
    activity.object_type = "User"
    activity.description = "<a href='/#{user.name}'>#{user.name}</a> created a new project 
    <a href='/#{user.name}/projects/#{project.id}'>#{project.name}</a>"
    activity.save
  end
  
  def self.AddedFileToProject(user, project, file)
    activity = Activity.new
    activity.o_id = user.id
    activity.object_type = "User"
    activity.description = "<a href='/#{user.name}'>#{user.name}</a> Added file 
    #{file.name} to project <a href='/#{user.name}/projects/#{project.id}'>#{project.name}</a>"
    activity.save
  end
  
  def self.AddedFileToBank(user, bank, file)
    activity = Activity.new
    activity.o_id = user.id
    activity.object_type = "User"
    activity.description = "<a href='/#{user.name}'>#{user.name}</a> Added file 
    #{file.name} to bank <a href='/#{user.name}/banks/#{bank.id}'>#{bank.name}</a>"
    activity.save
  end
  
end
