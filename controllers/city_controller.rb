require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/city' )
also_reload( '../models/*' )

get '/cities' do
  @cities = City.all()
  erb ( :"cities/index" )
end

get '/cities/new' do
  @cities = City.all()
  @countries = Country.all()
  erb(  :"cities/new"  )
end

post '/cities' do
  city = City.new(params)
  city.save()
  redirect to("/cities")
end

get '/cities/:id' do
  @city = City.find(params['id'].to_i)
  erb( :"cities/show" )
end
