require "spec_helper"
require "parser"


RSpec.describe Parser do
  subject { Parser.new(File.expand_path(__dir__)+"/manual_test.log") }

  describe 'initialize' do
    it 'should contain the filepath and an empty hash' do
      expect(subject.entry).to eq({})
    end
  end

  describe '#parse' do
    let(:manual_test) do
      {
        '/contact'   => ['1.1.1.0'],
        '/target' => ['20.130.140.1'],
        '/home_2'   => ['897.280.786.156'],
        '/help_page' => ['4.5.6.7'],
        '/about' => ['66.77.88.9']
      }
    end

    it 'should iterate over the file and push into empty log array' do
      subject.parse
      expect(subject.entry).to eq(manual_test)
    end
  end

  describe '#page_views' do
    it 'should group the visits by the different urls' do
      expect(subject.page_views).to eq(5)
    end
  end


  describe '#unique_views' do
    it 'should order url views with unique ip count' do
      expect(subject.unique_views).to eq(5)
    end
  end
end
