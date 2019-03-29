feature 'Adding a diary entry' do
  scenario 'I can enter a title and some text and submit it' do
    visit '/'
    fill_in 'title', with: 'test_title'
    fill_in 'entry', with: 'test_entry'
    click_button 'Submit'
    expect(page).to have_content 'test_title'
  end
end
