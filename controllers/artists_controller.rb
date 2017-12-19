require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/artist.rb")

get'/artists' do
  @artists = Artist.all
  erb(:"artists/index")
end

get'/artists/new' do
  @songs = Song.all
  erb(:"artists/new")
end

post'/artists' do
  artist = Artist.new
  artist.save
  redirect to("/artists")
end

post'/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect to("/artists")
end
