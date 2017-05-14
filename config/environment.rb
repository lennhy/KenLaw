require 'bundler'

Bundler.require(:default, :development, :production)
ENV['SINATRA_ENV'] ||= "development"

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

config = YAML.load(File.read(File.expand_path('config/secrets.yml')))
config.each do |key, val|
  ENV[key] = val.to_s
end
configure :production do
  db =  URI.parse(ENV['DATABASE_URL'])
#  db =  'postgres://localhost/topofthemorning_development'

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'UTF8'

  )
end

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
set :public_folder, File.dirname(__FILE__) + '/public'
