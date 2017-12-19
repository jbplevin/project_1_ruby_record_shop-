# Album : total_songs, running_time, artist, songs, find
# Artist:
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/songs_controller')
require_relative('controllers/artists_controller')
require_relative('controllers/albums_controller')
require_relative('controllers/stocks_controller')

get '/' do
  erb( :index )
end
