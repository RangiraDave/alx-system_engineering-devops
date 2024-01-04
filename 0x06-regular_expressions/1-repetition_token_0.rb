#!/usr/bin/env ruby

if ARGV.empty?
  puts "Must have atleast one argument!"
  exit(1)
end

input = ARGV[0]
pattern = /hbt{2,5}n/
matches = input.scan(pattern)

if matches.empty?
  puts "No matches found."
else
  puts matches.join('')
end
