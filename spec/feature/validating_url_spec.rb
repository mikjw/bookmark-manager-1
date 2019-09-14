feature 'validating url' do
  scenario 'user enters an invalid URL' do

    visit('/bookmarks')
    click_button 'Add Bookmark'
    fill_in(:url, with: 'httg://invalid..tech')
    fill_in(:title, with: 'invalid bookmark')
    click_button('Add to bookmarks')

    expect(page).not_to have_content('invalid bookmark')
    expect(page).to have_content('Please enter a valid URL.')
  end
end
