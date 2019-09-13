# require './lib/database_connection.rb'

# if ENV['ENVIRONMENT'] == 'test'
#   connection = PG.connect(dbname: 'bookmark_manager_test')
# else
#   connection = PG.connect(dbname: 'bookmark_manager')
# end

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.set_up('bookmark_manager_test')
else
  DatabaseConnection.set_up('bookmark_manager')
end
