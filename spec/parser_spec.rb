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
        '/contact'   => ['1.1.1.0', '126.318.035.038'],
        '/target' => ['20.130.140.1'],
        '/home_2'   => ['897.280.786.156', '655, 909, 543, 566'],
        '/help_page' => ['4.5.6.7'],
        '/about' => ['66.77.88.9', '456.094,.765.345', '897.280.786.156']
      }
    end

    it 'should iterate over the file and push into empty log array' do
      subject.parse
      expect(subject.entry).to eq(manual_test)
    end
  end

  describe '#page_views' do
    before { subject.parse}

      let(:page_view_results) do
      {
        '/about'   => 3,
        '/target' => 1,
        '/contact'    => 2,
        '/home_2'   => 2,
        '/help_page' => 1
      }
    it 'should group the visits by the different urls' do
      expect(subject.page_views).to eq(page_view_results)
    end
  end


  describe '#unique_views' do
    it 'should order url views with unique ip count' do
      let(:unique_view_results) do
        {
        '/about'   => 3,
        '/contact'    => 2,
        '/home_2'   => 2,
        '/target' => 1,
        '/help_page' => 1
        }
      expect(subject.unique_views).to eq(unique_view_results)
    end
  end
end
