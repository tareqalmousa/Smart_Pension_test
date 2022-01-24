require '../services/read_file_service'

RSpec.describe ReadFileService do

  let(:log_file) { './webserverTest.log' }

  it "should return data not nil with Success masege" do
    expect(ReadFileService.new(log_file).call).to eq ({:data=>["/help_page/1 126.318.035.038\n", "/contact 184.123.665.067"], :masege=>"Success"})
  end

  it "should return data nil with Fail masege" do
    expect(ReadFileService.new('./test').call).to eq ({:data=>nil, :masege=>"Fail"})
  end

end