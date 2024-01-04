#!/usr/bin/env ruby
if ARGV.empty?
  puts "You must have atleast one argument!"
  exit(1)
end

input = ARGV[0]
pattern = /^h[a-zA-Z0-9]n$/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
