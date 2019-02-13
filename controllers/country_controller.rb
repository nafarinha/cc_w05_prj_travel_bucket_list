require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/country' )
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.all()
  erb ( :"countries/index" )
end

get '/countries/new' do
  @countries = Country.all()
  erb(  :"countries/new"  )
end

post '/countries' do
  country = Country.new(params)
  country.save()
  redirect to("/countries")
end

post '/countries/:id/delete' do
  Country.delete(params[:id])
  redirect to("/countries")
end

get '/countries/:id' do
  @country = Country.find(params['id'].to_i)
  erb(  :"countries/show"  )
end
