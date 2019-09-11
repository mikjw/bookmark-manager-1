feature 'bookmarks' do
  scenario 'The bookmarks page shows bookmarks' do

    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers-home')
    Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'destroyallsoftware-home')
    Bookmark.add(url: 'http://www.google.com', title: 'Google-home')

    visit('/bookmarks')

    expect(page).to have_link('Makers-home', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google-home', href: 'http://www.google.com')
    expect(page).to have_link('destroyallsoftware-home', href: 'http://www.destroyallsoftware.com')
  end
end
