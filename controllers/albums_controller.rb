require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/song.rb")


get'/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get'/albums/new' do
  @artists = Artist.all
  @songs = Song.all
  erb(:"albums/new")
end

get'/albums/:id' do
  @album = Album.find(params['id'])
  erb(:"albums/show")
end

get'/albums/:id/edit' do
  @album = Album.find(params['id'])
  erb(:"albums/edit")
end

post'/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end

post'/albums' do
  album = Album.new(params)
  album.save
  redirect to("/albums")
end

post'/albums/:id/delete' do
  Album.destroy(params[:id])
  redirect to("/albums")
end
