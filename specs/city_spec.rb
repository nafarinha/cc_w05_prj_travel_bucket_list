require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/country'
require_relative '../models/city'

class TestCity < Minitest::Test

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
  end

  def test_get_name
    assert_equal("Madrid", @city1.name())
  end

  def test_get_lat
    assert_equal(37.39, @city2.lat())
  end

  def test_get_long
    assert_equal(-5.99, @city2.long())
  end

  
#END OF CLASS
end
