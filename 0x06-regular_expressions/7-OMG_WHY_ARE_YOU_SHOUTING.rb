#!/usr/bin/env ruby
if ARGV.empty?
  puts "Muts have atleast one argument"
  exit('')
end

input = ARGV[0]
pattern = /[A-Z]+/
matches = input.scan(pattern)

if matches
  puts matches.join('')
end
