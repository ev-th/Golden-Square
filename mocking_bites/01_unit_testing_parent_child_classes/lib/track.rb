class Track
  attr_reader :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    regexp = Regexp.new(keyword)
    @artist.match(regexp) || @title.match(regexp) ? true : false
  end
end