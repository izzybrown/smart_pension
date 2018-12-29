require "spec_helper"
require "log_file"

RSpec.describe LogInfo do
  describe '#initialize' do

    it 'it should contain a url' do
      response = described_class.new(url: '/home', ip: '6.77.88.9')
      expect(response.url).to eq('/home')
    end

    it 'it should contain an ip' do
      response = described_class.new(url: '/home', ip: '6.77.88.9')
      expect(response.ip).to eq('6.77.88.9')
    end
  end
end
