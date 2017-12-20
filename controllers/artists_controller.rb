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

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:"artists/edit")
end

post'/artists' do
  artist = Artist.new
  artist.save
  redirect to("/artists")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to("/artists/#{params['id']}")
end

post'/artists/:id/delete' do
  Artist.destroy(params[:id])
  redirect to("/artists")
end
