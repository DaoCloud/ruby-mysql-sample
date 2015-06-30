require 'sinatra'
require 'mysql2'

get '/' do
  storage = Storage.new
  storage.populate()
  score = storage.score()
  print "Hello world, %d!" % score
end

class Storage
  def initialize()
    @db = Mysql2::Client.new(
      :host => ENV['RDS_HOSTNAME'],
      :username => ENV['RDS_USERNAME'],
      :password => ENV['RDS_PASSWORD'],
      :port => ENV['RDS_PORT'],
      :database => ENV['RDS_DB_NAME']
    )
    @db.query("CREATE TABLE IF NOT EXISTS scores(score INT)")
  end

  def populate
    @db.query("INSERT INTO scores(score) VALUES(1234)")
  end

  def score
    r = @db.query("SELECT * FROM scores")
    first = r.each_hash[0]
    print "#{f['scores']}"
  end
end
