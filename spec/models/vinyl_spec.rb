require 'spec_helper'
require 'rails_helper'

describe Vinyl do
	before :each do
		@vinyl = Vinyl.new(artist: "George Strait", album: "Greatest Hits", 
							year: 2004, genre: "Country", 
							cover: "http://music-news.redigi.com/wp-content/uploads/2012/10/George-Strait.jpg")
	end

	subject { @vinyl }

	it { should be_instance_of Vinyl }

	describe "with valid attributes" do
		it { should be_valid }
	end

	describe "with an album that" do
		describe "is missing" do
			before { @vinyl.album = "" }
			it { should_not be_valid }
		end

		describe "is longer than 100 characters" do
			before { @vinyl.album = "a" * 101 }
			it { should_not be_valid }
		end
	end

	describe "with an artist that" do
		describe "is missing" do
			before { @vinyl.artist = "" }
			it { should_not be_valid }
		end

		describe "is longer than 100 characters" do
			before { @vinyl.artist = "a" * 101 }
			it { should_not be_valid }
		end
	end

	describe "with a year that" do
		describe "is missing" do
			before { @vinyl.year = "" }
			it { should be_valid }
		end

		describe "is a string" do
			before { @vinyl.year = "John" }
			it { should_not be_valid }
		end
	end

	describe "with a genre that" do
		describe "is missing" do
			before { @vinyl.genre = "" }
			it { should be_valid }
		end
	end
end