require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/destination' )
also_reload( '../models/*' )

get '/destinations' do
  @destinations = Destination.all()
  erb ( :"destinations/index" )
end
