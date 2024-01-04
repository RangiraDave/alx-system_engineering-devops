#!/usr/bin/env ruby
if ARGV.empty?
  puts "You have to pass an argument"
  exit(1)
end

input = ARGV[0]
pattern = /hb{0,1}tn/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
