require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      bm1 = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      bm2 = Bookmarks.add_bookmark('http://www.destroyallsoftware.com', 'Destroy Software')

      bookmarks = list.display_all
      expect(bookmarks.first.title).to eq bm1.title
      expect(bookmarks.first.url).to eq bm1.url
      expect(bookmarks.first.id).to eq bm1.id
      expect(bookmarks.last.title).to eq bm2.title
      expect(bookmarks.last.url).to eq bm2.url
      expect(bookmarks.last.id).to eq bm2.id
    end
  end

  describe '#add_bookmark' do
    it 'Should add a bookmarks' do
      bookmark = list.add_bookmark('http://www.google.com', 'Google')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://www.google.com'
    end
  end

  describe '#delete_bookmark' do
    it 'should delete a bookmark from the database' do
      bm = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      Bookmarks.delete_bookmark(id: bm.id)
      expect(Bookmarks.display_all).to eq []
    end
  end
end
