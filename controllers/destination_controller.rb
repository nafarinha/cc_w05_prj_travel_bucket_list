require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/destination' )
also_reload( '../models/*' )

get '/destinations' do
  @destinations = Destination.all()
  erb ( :"destinations/index" )
end

get '/destinations/new' do
  @destinations = Destination.all()
  @cities = City.all()
  @countries = Country.all()
  erb(  :"destinations/new"  )
end

post '/destinations' do
  destination = Destination.new(params)
  destination.save()
  redirect to("/destinations")
end

post '/destinations/:id/delete' do
  Destination.delete(params[:id])
  redirect to("/destinations")
end

get '/destinations/:id/edit' do
  @destination = Destination.find( params[:id] )
  @cities = City.all()
  erb( :"destinations/edit" )
end

post '/destinations/:id' do
  Destination.new( params ).update
  redirect to '/destinations'
end
