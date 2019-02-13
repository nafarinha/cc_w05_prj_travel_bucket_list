require 'pry-byebug'
require_relative '../db/sqlrunner'

class Country

  attr_reader :id
  attr_accessor :name, :continent

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @continent = options['continent']
  end

#CRUD functions
  def save()
    sql = "INSERT INTO countries
    (
      name,
      continent
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @continent]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE countries
      SET name = $1, continent = $2
      WHERE id = $3"
    values = [@name, @continent, @id]
    SqlRunner.run(sql, values)
  end

  def self.find( id )
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Country.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM countries"
    results = SqlRunner.run( sql )
    return results.map { |hash| Country.new( hash ) }
  end

  def self.delete(id)
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM countries"
    SqlRunner.run( sql )
  end
#END CRUD functions

  def cities
    sql = "SELECT * FROM cities
    WHERE country_id = $1"
    values = [@id]
    results = SqlRunner.run(  sql, values  )
    return results.map { |city| City.new(city)  }
  end

#END OF CLASS
end
