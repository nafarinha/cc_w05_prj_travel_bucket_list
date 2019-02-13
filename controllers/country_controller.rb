require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/country' )
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.all()
  erb ( :"countries/index" )
end
