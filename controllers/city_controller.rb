require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/city' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/index" )
end
