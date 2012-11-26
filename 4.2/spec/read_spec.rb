require 'pry'

describe 'File' do
  describe '#read' do
    it 'read 4th character' do
      contents = File.read('./fixtures/data.txt')
      contents[3,1].should == "d"
    end
  end
end
