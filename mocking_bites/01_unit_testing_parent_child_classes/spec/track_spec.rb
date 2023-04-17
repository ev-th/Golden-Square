require 'track'

RSpec.describe Track do
  context "when initialized" do
    it "has a title" do
      track = Track.new("title1", "artist1")
      expect(track.title).to eq "title1"
    end
    
    it "has an artist" do
      track = Track.new("title1", "artist1")
      expect(track.artist).to eq "artist1"
    end
  end
  
  describe "#matches?" do
    context "when artist matches keyword exactly" do
      it "returns true" do
        track = Track.new("title1", "artist1")
        result = track.matches?("artist1")
        expect(result).to eq true
      end
    end
    
    context "when artist matches keyword partially" do
      it "returns true" do
        track = Track.new("title1", "artist1")
        result = track.matches?("tist")
        expect(result).to eq true
      end
    end
    
    context "when title matches keyword exactly" do
      it "returns true" do
        track = Track.new("title1", "artist1")
        result = track.matches?("title1")
        expect(result).to eq true
      end
    end
    
    context "when title matches keyword partially" do
      it "returns true" do
        track = Track.new("title1", "artist1")
        result = track.matches?("itle")
        expect(result).to eq true
      end
    end

    context "when neither artist or title match keyword" do
      it "returns true" do
        track = Track.new("title1", "artist1")
        result = track.matches?("foobar")
        expect(result).to eq false
      end
    end
  end
end