#!/usr/local/bin/ruby

require_relative './services/parser_file_service'
require_relative './services/read_file_service'

def main
  unless ARGV[0]
    puts "Usage: ./script.rb argument"
    exit
  end

  data_log = ReadFileService.new(ARGV[0]).call
  puts "Normal page views"
  puts (ParserFileService.new(data_log[:data], 'Parser_normal').call)
  puts "Unique page views"
  puts ParserFileService.new(data_log[:data], 'parser_unique').call

end

main