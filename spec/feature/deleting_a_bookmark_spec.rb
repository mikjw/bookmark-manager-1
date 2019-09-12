feature 'deleting a bookmark' do
  scenario 'user can delete a bookmark' do
    Bookmark.add(url: 'http://www.makers.tech', title: 'Makers')
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makers.tech')
    
    first('.bookmark').click_button('Delete')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Makers', href: 'http://www.makers.tech')
  end
end
