require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers-home')
      Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'destroyallsoftware-home')
      Bookmark.add(url: 'http://www.google.com', title: 'Google-home')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq('Makers-home')
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      bookmark_1 = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers-home')
      persisted_data = persisted_data(id: bookmark_1.id)

      expect(bookmark_1).to be_a Bookmark
      expect(bookmark_1.id).to eq persisted_data.first['id']
      expect(bookmark_1.url).to eq('http://www.makersacademy.com')
      expect(bookmark_1.title).to eq('Makers-home')
    end
  end
end
