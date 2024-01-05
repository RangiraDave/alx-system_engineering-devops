#!/usr/bin/env ruby
if ARGV.empty?
  puts "Usage: ./100-textme.rb <string>"
  exit(1)
end

input = ARGV[0]
pattern = /\b[a-zA-Z]+\b | \b+[0-9]{11}\b/
matched = input.scan(pattern)

if matches
  puts matches.join('')
end
