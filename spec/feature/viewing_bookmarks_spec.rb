feature 'displaying bookamrks' do
  scenario 'The bookmarks page shows a list bookmarks' do

    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.add(url: 'http://www.wikipedia.org', title: 'Wikipedia')
    Bookmark.add(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Wikipedia', href: 'http://www.wikipedia.org')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
