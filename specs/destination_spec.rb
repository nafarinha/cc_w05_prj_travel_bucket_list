require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/country'
require_relative '../models/city'
require_relative '../models/destination'

class TestDestination < Minitest::Test

  def setup
    @country1 = Country.new({
      "name" => "Spain",
      "continent" => "Europe"
    })
    @country2 = Country.new({
      "name" => "France",
      "continent" => "Europe"
    })
    @country3 = Country.new({
      "name" => "Germany",
      "continent" => "Europe"
    })

    @city1 = City.new({
      "name" => "Madrid",
      "lat" => +40.383333,
      "long" => -3.716667,
      "country_id" => @country1.id
      })
    @city2 = City.new({
      "name" => "Seville",
      "lat" => +37.39,
      "long" => -5.99,
      "country_id" => @country1.id
      })
    @city3 = City.new({
      "name" => "Valencia",
      "lat" => +39.466667,
      "long" => -0.375,
      "country_id" => @country1.id
      })
    @city4 = City.new({
      "name" => "Paris",
      "lat" => +48.8567,
      "long" => +2.3508,
      "country_id" => @country2.id
      })
    @city5 = City.new({
      "name" => "Nice",
      "lat" => +43.7034,
      "long" => +7.2663,
      "country_id" => @country2.id
      })
    @city6 = City.new({
      "name" => "Berlin",
      "lat" => +52.516667,
      "long" => +13.388889,
      "country_id" => @country3.id
      })
    @city7 = City.new({
      "name" => "Munich",
      "lat" => +48.133333,
      "long" => +11.566667,
      "country_id" => @country3.id
      })
    @city8 = City.new({
      "name" => "Nice",
      "lat" => +50.116667,
      "long" => +8.683333,
      "country_id" => @country3.id
      })

    @destination1 = Destination.new({
      "isvisited" => "t",
      "city_id" => @city1.id
      })

    @destination2 = Destination.new({
      "isvisited" => "f",
      "city_id" => @city2.id
      })
  end

  def test_isvisited__true
    assert(@destination1.isvisited())
  end

  def test_isvisited__false
    refute(@destination2.isvisited())
  end




#END OF CLASS
end
