def add_entry(title, entry)
  visit '/diary/add'
  fill_in 'title', with: title
  fill_in 'entry', with: entry
  click_button 'Submit'
end
