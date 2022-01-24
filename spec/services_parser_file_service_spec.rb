require '../services/parser_file_service'

RSpec.describe ParserFileService do

  let(:data) { ['/home', '/test', '/home/1'] }

  it "should test parser normal with sort" do
    expect(ParserFileService.new(data, 'Parser_normal').call).to eq ({"/home"=>2, "/test"=>1})
  end

  it "should test parserunique with sort" do
    expect(ParserFileService.new(data, 'parser_unique').call).to eq ({"/home/1"=>1})
  end

end