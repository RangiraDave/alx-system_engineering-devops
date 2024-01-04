#!/usr/bin/env ruby
if ARGV.empty?
  puts "You have to provide atleast one argument."
  exit(1)
end

input = ARGV[0]
pattern = /hbt*n/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
