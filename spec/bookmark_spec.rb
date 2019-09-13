require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.add(url: 'http://www.wikipedia.org', title: 'Wikipedia')
      Bookmark.add(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq('Makers')
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq('http://www.makersacademy.com')
      expect(bookmark.title).to eq('Makers')
    end

    it 'does not create a bookmark with invalid URL' do
      Bookmark.add(url: 'httg://invalid..tech', title: 'invalid bookmark')
      expect(Bookmark.all).not_to include('invalid bookmark')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the database' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')

      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a bookmark with user input' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.bakers.tech', title: 'Bakers')
      
      expect(bookmark).to be_a Bookmark
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq(bookmark.id)
      expect(updated_bookmark.url).to eq('http://www.bakers.tech')
      expect(updated_bookmark.title).to eq('Bakers')
    end
  end

  describe '.find' do
    it 'returns a bookmark object' do
      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')

      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.id).to eq(bookmark.id)
      expect(result.url).to eq('http://www.makersacademy.com')
      expect(result.title).to eq('Makers')
    end
  end
end
