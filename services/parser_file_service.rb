##
# This class represents analyzing data according to regex and sort the result.
#
class Generator

  # @param [array, #data] contents file log data
  # @param [String, #regex] contents Regular expression
  # @return hash the contents data
  #
  def generate(data,regex)
    result = []
    data.each do |log|
      parser = log.scan(regex)[0]
      if parser.nil?
        next
      end
      result << parser
    end
    result.tally.sort_by {|_, count| -count}.to_h
  end
end

##
# This class represents method Parser Unique data.
#
class ParserUnique < Generator
  def initialize(data)
    @data = data
  end

  def generate
    super(@data,/^\/[-a-zA-Z0-9._ ]*\/[0-9]*/)
  end
end

##
# This class represents method Parser Normal data.
#
class ParserNormal < Generator
  def initialize(data)
    @data = data
  end

  def generate
    super(@data,  /^\/[-a-zA-Z0-9]*/)
  end
end

GENERATORS = {
    'parser_unique' => ParserUnique,
    'Parser_normal' => ParserNormal
}

##
# This class represents Parser Service that take different types of parser type.
#
class ParserFileService

  def initialize(data, parser_type)
    @data = data
    @parser_type = parser_type
  end

  def call
    GENERATORS[@parser_type].new(@data).generate()
  end

end
