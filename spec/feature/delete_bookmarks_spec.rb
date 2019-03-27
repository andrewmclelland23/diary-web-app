feature 'deleting bookmarks' do
  scenario 'A user can delete a bookmarks and see that its gone' do
    add_2_bookmarks
    visit '/delete_bookmark'
    fill_in 'title', with: 'BBC'
    click_button 'Submit'

    expect(page).to_not have_content "BBC"
    expect(page).to have_content "Google"

  end
end
