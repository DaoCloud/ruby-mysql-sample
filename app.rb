require 'sinatra'
require 'mysql2'

get '/' do
  storage = Storage.new
  storage.populate()
  score = storage.score()
  "Hello world, %d!" % score
end

      user   = os.getenv('MYSQL_USERNAME'),
      passwd = os.getenv('MYSQL_PASSWORD'),
      db     = os.getenv('MYSQL_INSTANCE_NAME'),
      host   = os.getenv('MYSQL_PORT_3306_TCP_ADDR'),
      port   = int(os.getenv('MYSQL_PORT_3306_TCP_PORT'))

class Storage
  def initialize()
    @db = Mysql2::Client.new(
      :host => ENV['MYSQL_PORT_3306_TCP_ADDR'],
      :username => ENV['MYSQL_USERNAME'],
      :password => ENV['MYSQL_PASSWORD'],
      :port => ENV['MYSQL_PORT_3306_TCP_PORT'],
      :database => ENV['MYSQL_INSTANCE_NAME']
    )
    @db.query("CREATE TABLE IF NOT EXISTS scores(score INT)")
  end

  def populate
    @db.query("INSERT INTO scores(score) VALUES(1234)")
  end

  def score
    r = @db.query("SELECT * FROM scores")
    first = r.each_hash[0]
    puts 11
    f['scores']
  end
end
