require 'pry-byebug'
require 'pg'
require_relative '../db/sqlrunner'

class Destination

  attr_reader :id
  attr_accessor :is_visited, :city_id

  def initialize(  options  )
    @id = options['id'].to_i if options['id']
    options['is_visited'].to_s == 'true' ? @is_visited  = true : @is_visited = false
    @city_id = options['city_id'].to_i
  end

  #CRUD functions
    def save()
      sql = "INSERT INTO destinations
      (
        is_visited,
        city_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@is_visited, @city_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def update()
      sql = "UPDATE destinations
        SET is_visited = $1,
        city_id = $2
        WHERE id = $3"
      values = [@is_visited, @city_id, @id]
      SqlRunner.run(sql, values)
    end

    def self.find( id )
      sql = "SELECT * FROM destinations
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Destination.new( results.first )
    end

    def self.all()
      sql = "SELECT * FROM destinations"
      results = SqlRunner.run( sql )
      return results.map { |hash| Destination.new( hash ) }
    end

    def self.delete(id)
      sql = "DELETE FROM destinations
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def self.delete_all
      sql = "DELETE FROM destinations"
      SqlRunner.run( sql )
    end
  #END CRUD functions

  def city
    sql = "SELECT ci.* FROM cities ci
    INNER JOIN destinations d
      ON d.city_id = ci.id
    WHERE d.id = $1"
    values = [@id]
    results = SqlRunner.run(  sql, values  )
    return City.new(  results.first  )

  end

#END OF CLASS
end
