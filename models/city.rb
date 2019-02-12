require 'pry-byebug'
require_relative '../db/sqlrunner'
require_relative 'country'

class City

  attr_reader :id, :country_id
  attr_accessor :name, :lat, :long

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @lat = options['lat']
    @long = options['long']
    @country_id = options['country_id'].to_i
  end

  #CRUD functions
    def save()
      sql = "INSERT INTO cities
      (
        name,
        lat,
        long,
        country_id
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING id"
      values = [@name, @lat, @long, @country_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def update()
      sql = "UPDATE cities
        SET name = $1,
        lat = $2,
        long = $3,
        country_id = $4
        WHERE id = $5"
      values = [@name, @lat, @long, @country_id, @id]
      SqlRunner.run(sql, values)
    end

    def self.find( id )
      sql = "SELECT * FROM cities
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return City.new( results.first )
    end

    def self.all()
      sql = "SELECT * FROM cities"
      results = SqlRunner.run( sql )
      return results.map { |hash| City.new( hash ) }
    end

    def self.delete(id)
      sql = "DELETE FROM cities
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all
      sql = "DELETE FROM cities"
      SqlRunner.run( sql )
    end
  #END CRUD functions

  def country
    sql = "SELECT co.* FROM countries co
    INNER JOIN cities ci
      ON ci.country_id = co.id
    WHERE ci.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Country.new(  results.first  )
  end

#END OF CLASS
end
