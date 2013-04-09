class Genre < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.add_bank_genres(bank, genres)
    BankGenre.destroy_all(:bank_id => bank.id)
    g = genres.downcase.split(',')
    g.each do |genre|
      bgenre = Genre.find_or_initialize_by_name(genre)
      bgenre.save
      bank_genre = BankGenre.find_or_initialize_by_bank_id_and_genre_id(bank.id, bgenre.id)
      bank_genre.save
    end
  end
  
  def self.add_project_genres(project, genres)
    ProjectGenre.destroy_all(:project_id => project.id)
    g = genres.downcase.split(',') 
    g.each do |genre|
      pgenre = Genre.find_or_initialize_by_name(genre)
      pgenre.save
      project_genre = ProjectGenre.find_or_initialize_by_project_id_and_genre_id(project.id, pgenre.id)
      project_genre.save
    end
  end
end
