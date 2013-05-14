class SongRemix < SoundFile
  def score
    total = 0.0
    self.sound_file_scores.each do |score|
      total = total + score.score
    end
    total
  end  
  
  def score_with_votes(total_votes, vote_weight)
    total = 0.0
    self.sound_file_scores.each do |score|
      total = total + score.score
    end
    
    popularity = 0.0
    if total_votes > 0 and vote_weight > 0
      popularity = self.votes_count / total_votes.to_f * vote_weight
    end
    
    total + popularity
  end
end