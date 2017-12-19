require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/artist.rb")
require_relative("../models/song.rb")
require_relative("../models/album.rb")
require_relative("../models/stock.rb")

get'/stocks' do
  @stocks = Stock.all
  erb(:"stocks/index")
end

get'/stocks/new' do
  erb(:"stocks/new")
end

post'/stocks' do
  song = Stock.new
  song.save
  redirect to("/stocks")
end

post'/stocks/:id/delete' do
  Stock.destroy(params[:id])
  redirect to("/stocks")
end
