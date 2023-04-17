require 'music_library'

describe MusicLibrary do
  context "initially" do
    it "has an empty list of tracks" do
      library = MusicLibrary.new
      expect(library.all).to eq []
    end
    
    it "returns an empty list with #search" do
      library = MusicLibrary.new
      result = library.search("new_keyword")
      expect(result).to eq []
    end
  end

  context "when tracks are added" do
    it "has a list of tracks" do
      library = MusicLibrary.new
      track1 = double(:fake_track, matches?: true)
      track2 = double(:fake_track, matches?: false)
      track3 = double(:fake_track, matches?: true)
      library.add(track1)
      library.add(track2)
      library.add(track3)
      result = library.all
      expect(result).to eq [track1, track2, track3]
    end
  end

  describe "#search" do
    context "when no tracks match the keyword" do
      it "returns an empty list" do
        library = MusicLibrary.new
        track1 = double(:fake_track, matches?: false)
        track2 = double(:fake_track, matches?: false)
        track3 = double(:fake_track, matches?: false)
        library.add(track1)
        library.add(track2)
        library.add(track3)
        result = library.search("foo")
        expect(result).to eq []
      end
    end

    context "when one track matches the keyword" do
      it "returns a list containing that track" do
        library = MusicLibrary.new
        track1 = double(:fake_track, matches?: false)
        track2 = double(:fake_track, matches?: true)
        track3 = double(:fake_track, matches?: false)
        library.add(track1)
        library.add(track2)
        library.add(track3)
        result = library.search("foo")
        expect(result).to eq [track2]
      end
    end

    context "when multiple tracks match the keyword" do
      it "returns a list of the tracks" do
        library = MusicLibrary.new
        track1 = double(:fake_track, matches?: true)
        track2 = double(:fake_track, matches?: false)
        track3 = double(:fake_track, matches?: true)
        library.add(track1)
        library.add(track2)
        library.add(track3)
        result = library.search("foo")
        expect(result).to eq [track1, track3]
      end
    end
  end
end