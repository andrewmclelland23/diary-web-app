require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      Bookmarks.add_bookmark('http://www.destroyallsoftware.com', 'Destroy Software')

      bookmarks = list.display_all
      expect(bookmarks).to eq ["<a name='Makers' href='http://www.makersacademy.com'>Makers</a>", "<a name='Destroy Software' href='http://www.destroyallsoftware.com'>Destroy Software</a>"]
    end
  end
  describe '#add_bookmark' do
    it 'Should add a bookmarks' do
      list.add_bookmark('http://www.google.com', 'Google')
      expect(list.display_all).to eq(["<a name='Google' href='http://www.google.com'>Google</a>"])
    end
  end

  describe '#create_link_html' do
    it 'should take a title and url and convert this into an html link' do
      link_html = list.new('BBC', 'http://www.bbc.co.uk').create_link_html
      expect(link_html).to eq "<a name='BBC' href='http://www.bbc.co.uk'>BBC</a>"
    end
  end

  describe '#delete_bookmark' do
    it 'should delete a bookmark from the database' do
      Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      Bookmarks.add_bookmark('http://www.destroyallsoftware.com', 'Destroy Software')

      Bookmarks.delete_bookmark('Makers')
      expect(Bookmarks.display_all).to_not include('Makers')
    end
  end
end
