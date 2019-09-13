require 'database_connection'

describe DatabaseConnection do
  describe '.set_up' do
    it 'sets up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      
      DatabaseConnection.set_up('bookmark_manager_test')
    end

  describe '.query' do
    it 'executes a query on a database connection' do
      connection = DatabaseConnection.set_up('bookmark_manager_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
  
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
