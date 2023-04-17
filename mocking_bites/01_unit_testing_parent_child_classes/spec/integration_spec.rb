require 'music_library'
require 'track'

describe "MusicLibrary integration" do
  context "when tracks are added" do
    it "has a list of tracks" do
      music_library = MusicLibrary.new
      track1 = Track.new("title1", "artist1")
      track2 = Track.new("title2", "artist2")
      track3 = Track.new("title3", "artist3")
      music_library.add(track1)
      music_library.add(track2)
      music_library.add(track3)
      result = music_library.all
      expect(result).to eq [track1, track2, track3]
    end
    
    describe "#search" do
      context "when multiple tracks match a keyword" do
        it "returns an array of all tracks that match the keyword" do
          music_library = MusicLibrary.new
          track1 = Track.new("foo", "artist1")
          track2 = Track.new("title2", "foobar")
          track3 = Track.new("title3", "artist3")
          music_library.add(track1)
          music_library.add(track2)
          music_library.add(track3)
          result = music_library.search("foo")
          expect(result).to eq [track1, track2]
        end
      end
      
      context "when one track matches a keyword" do
        it "returns an array with that track" do
          music_library = MusicLibrary.new
          track1 = Track.new("title1", "artist1")
          track2 = Track.new("title2", "foobar")
          track3 = Track.new("title3", "artist3")
          music_library.add(track1)
          music_library.add(track2)
          music_library.add(track3)
          result = music_library.search("foo")
          expect(result).to eq [track2]
        end
      end
      
      context "when no tracks match a keyword" do
        it "returns an empty array" do
          music_library = MusicLibrary.new
          track1 = Track.new("title1", "artist1")
          track2 = Track.new("title2", "artist2")
          track3 = Track.new("title3", "artist3")
          music_library.add(track1)
          music_library.add(track2)
          music_library.add(track3)
          result = music_library.search("foo")
          expect(result).to eq []
        end
      end
    end
  end
end