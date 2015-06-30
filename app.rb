require 'sinatra'
require 'mysql2'

module Sinatra
  class Base
    set :server, %w[thin mongrel webrick]
    set :bind, '0.0.0.0'
    set :port, 4567
  end
end

get '/' do
  storage = Storage.new
  storage.populate()
  score = storage.score()
  "Hello world, %d!" % score
end

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
    @db.query("SELECT * FROM scores").first['score']
  end
end
