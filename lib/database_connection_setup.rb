require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  connection = PG.connect(dbname: 'bookmark_manager_test')
else
  connection = PG.connect(dbname: 'bookmark_manager')
end
