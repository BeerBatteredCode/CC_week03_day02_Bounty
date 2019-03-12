require('pg')

class Bounty
  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @homeworld = options['homeworld']
  end

  def save()
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = 'INSERT INTO space_cowboys_bounties (name, species, bounty_value, homeworld) VALUES ($1, $2, $3, $4) RETURNING * ;'
    values = [@name, @species, @bounty_value, @homeworld]
    db.prepare('bounty result', sql)
    arr_hashes = db.exec_prepared('bounty result', values)
    @id = arr_hashes[0]['id'].to_i
    db.close()
  end

  def Bounty.all
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = 'SELECT * FROM space_cowboys_bounties'
    db.prepare('all', sql)
    space_hashes = db.exec_prepared('all')
    db.close()
    return space_hashes.map { |hash| Bounty.new(hash) }
  end

  def Bounty.find_by_name(name)
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = "SELECT name FROM space_cowboys_bounties WHERE name =  'Selma';"
    db.prepare('find bounty', sql)
    name_hashes = db.exec_prepared('find bounty')
    db.close()
    return name_hashes.find {|hash| Bounty.new(hash)}
  end

  def Bounty.find_by_id(name)
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = "SELECT id FROM space_cowboys_bounties WHERE name = 'Selma';"
    db.prepare('find bounty id', sql)
    name_hashes = db.exec_prepared('find bounty id')
    db.close()
    return name_hashes.find {|hash| Bounty.new(hash)}
  end

  def update()
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = 'UPDATE space_cowboys_bounties SET (name, species, bounty_value, homeworld) = ($1, $2, $3, $4) WHERE id = $5;'
    values = [@name, @species, @bounty_value, @homeworld, @id]
    db.prepare('bounty update', sql)
    db.exec_prepared('bounty update', values)
    db.close()
  end

  def delete()
    db = PG.connect({ dbname: 'space_cowboys_bounties', host: 'localhost' })
    sql = 'DELETE FROM space_cowboys_bounties WHERE id = $1;'
    values = [@id]
    db.prepare('delete bounty', sql)
    db.exec_prepared('delete bounty', values)
    db.close()
  end
end
