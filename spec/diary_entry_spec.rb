require 'diary_entry'

describe DiaryEntry do
  describe '.add' do
    it 'should add a diary entry to db when called' do
      entry = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      expect(entry.id).to eq '1'
      expect(entry.title).to eq 'test_title'
      expect(entry.entry).to eq 'test_entry'
    end
  end
  describe '.list' do
    it 'should return list of titles in entries table' do
      entry1 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      entry2 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      expect(DiaryEntry.list).to eq [entry1.title, entry2.title]
    end
  end
end
