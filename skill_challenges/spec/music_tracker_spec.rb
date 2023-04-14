require 'music_tracker'

describe MusicTracker do
  context "when no tracks are added" do
    it "has an empty list of tracks" do
      music_tracker = MusicTracker.new
      result = music_tracker.list
      expect(result).to eq []
    end
  end

  context "when one track is added" do
    it "has a list containing that track" do
      music_tracker = MusicTracker.new
      music_tracker.add("Track 1")
      result = music_tracker.list
      expect(result).to eq ["Track 1"]
    end
  end

  context "when two tracks are added" do
    it "has a list containing both tracks" do
      music_tracker = MusicTracker.new
      music_tracker.add("Track 1")
      music_tracker.add("Track 2")
      result = music_tracker.list
      expect(result).to eq ["Track 1", "Track 2"]
    end
  end
  
  context "when the same track is added twice" do
    it "fails 'This track is already in the list.'" do
      music_tracker = MusicTracker.new
      music_tracker.add("Track 1")
      expect {
        music_tracker.add("Track 1")
      }.to raise_error "This track is already in the list."
    end
  end
end
