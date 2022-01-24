##
# This class represents read file by pass path.
#  @return hash the contents data,masege
class ReadFileService

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    if check_file_path_existing?
      log_data = File.readlines @file_path
      {data: log_data, masege: "Success"}
    else
      {data: nil, masege: "Fail"}
    end
  end

  private

  def check_file_path_existing?
    unless File.exist?(@file_path)
      false
    else
      true
    end
  end

end