require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class.new }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = list.display_all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end
  describe '#add_bookmark' do
    it 'Should add a bookmarks' do
      list.add_bookmark('http://www.google.com')
      expect(list.display_all).to include('http://www.google.com')
    end
  end
end
