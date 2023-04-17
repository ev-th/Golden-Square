class MusicLibrary
  def initialize
    @tracks = []
  end

  def add(track)
    @tracks << track
  end

  def all
    @tracks
  end
  
  def search(keyword) # keyword is a string
    @tracks.select { |track| track.matches?(keyword) }
  end
end