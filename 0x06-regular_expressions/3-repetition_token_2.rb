#!/usr/bin/env ruby
if ARGV.empty?
  puts "You have to add atleast one argment"
  exit(1)
end

input = ARGV[0]
pattern = /hbt+n/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
