class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all << self.new
    self.all.last  
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song  
  end 

  def self.create_by_name(name)
    song = self.create
    song.name = name 
    self.all.last  
  end 

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name) 
  self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end 

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(file)
    song = self.new 
    data = file.split(/\s-\s|\./)
    song.artist_name = data[0]
    song.name = data[1]
    song 
  end 

  def self.create_from_filename(file)
    song = self.new 
    data = file.split(/\s-\s|\./)
    song.artist_name = data[0]
    song.name = data[1]
    song.save 
  end 

  def self.destroy_all 
    self.all.clear 
  end 
  
end
