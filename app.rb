require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('controllers/country_controller')
require_relative('controllers/city_controller')
require_relative('controllers/destination_controller')

get '/' do
  erb( :index )
end
