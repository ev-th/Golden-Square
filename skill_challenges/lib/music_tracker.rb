class MusicTracker
  def initialize
    @track_list = []
  end

  def add(track)
    if @track_list.include?(track)
      fail "This track is already in the list."
    end
    
    @track_list << track
  end

  def list
    @track_list
  end
end