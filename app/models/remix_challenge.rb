class RemixChallenge < Project
  
  def total_votes
     s_files = ProjectFile.find(:all, :conditions => { :project_id => self.id })
     all_sound_files = s_files.map { |f| f.sound_file }
     remix_files = all_sound_files.reject { |f| f.type != 'SongRemix' }
     total = 0
     remix_files.each do |remix|
       total = total + remix.votes_count
     end
     
     total
  end
end