require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/song.rb")

get'/songs' do
  @songs = Song.all
  erb(:"songs/index")
end

get'/songs/new' do
  erb(:"songs/new")
end

post'/songs' do
  song = Song.new
  song.save
  redirect to("/songs")
end

post'/songs/:id/delete' do
  Song.destroy(params[:id])
  redirect to("/songs")
end
