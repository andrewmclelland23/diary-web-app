feature 'See list of all entries' do
  scenario 'I can see a list of all entries' do
    add_entry('test_title1', 'test_entry1')
    add_entry('test_title2', 'test_entry2')
    expect(page).to have_content 'test_title1'
    expect(page).to have_content 'test_title2'
  end
end
