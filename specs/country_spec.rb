require 'minitest/autorun'
require 'minitest/rg'
require'pry-byebug'
require_relative '../models/country'

class TestCountry < Minitest::Test

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
  end

  def test_get_name
    assert_equal(  "Spain", @country1.name()  )
  end

  def test_get_continent
    assert_equal(  "Europe", @country2.continent()  )
  end


#END OF CLASS
end
