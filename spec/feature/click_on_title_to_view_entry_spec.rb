feature 'Click on title to see entry' do
  scenario 'From the list page, I can click on a title to view the associated entry' do
    add_entry('test_title1', 'test_entry1')
    add_entry('test_title2', 'test_entry2')
    click_link 'test_title2'
    expect(page).to have_content 'test_entry2'
  end
end
