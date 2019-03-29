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
    it 'should return array of diary objects from db' do
      entry1 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      entry2 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      expect(DiaryEntry.list[0].title).to eq entry1.title
      expect(DiaryEntry.list[0].entry).to eq entry1.entry
      expect(DiaryEntry.list[0].id).to eq entry1.id
      expect(DiaryEntry.list[1].title).to eq entry2.title
      expect(DiaryEntry.list[1].entry).to eq entry2.entry
      expect(DiaryEntry.list[1].id).to eq entry2.id
    end
  end

  describe '.find' do
    it 'should find and return diary object using id' do
      entry1 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      entry2 = DiaryEntry.add(title: 'test_title', entry: 'test_entry')
      expect(DiaryEntry.find(id: '2').title).to eq entry2.title
      expect(DiaryEntry.find(id: '2').entry).to eq entry2.entry
      expect(DiaryEntry.find(id: '2').id).to eq entry2.id
    end
  end
end
