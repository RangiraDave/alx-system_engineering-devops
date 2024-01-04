#!/usr/bin/env ruby
if ARGV.empty?
  puts "Must put atleast one argment"
  exit(1)
end

input = ARGV[0]
pattern = /^[0-9]{10}$/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
