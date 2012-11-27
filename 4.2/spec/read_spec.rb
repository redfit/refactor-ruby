require 'pry'

describe 'File' do
  describe '#read' do
    it 'read 4th character' do
      contents = File.read('./fixtures/data.txt')
      contents[3,1].should == "d"
    end
    it 'read with a length specified' do
      contents = File.read('./fixtures/data.txt', 15)
      contents.should == "Bradman 99.94 5"
    end
    it 'read empty file returns empty string' do
      File.open('./fixtures/empty_data.txt', 'w'){}
      contents = File.read('./fixtures/empty_data.txt')
      contents.should == ""
    end
    it 'read an out of bounds length causes no error' do
      File.open('./fixtures/empty_data.txt', 'w'){ |file| file << "simple file"}
      contents = File.read('./fixtures/empty_data.txt', 100)
      contents.should == "simple file"
    end
    it 'read raises error when file not fount' do
      expect { File.read('aaa') }.to raise_error(/No such file or directory/)
    end
  end
end
