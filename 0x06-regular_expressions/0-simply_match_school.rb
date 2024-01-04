#!/usr/bin/env ruby
input = ARGV[0]
pattern = /School+/
match = input.scan(pattern)
if match
  puts match.join('')
end
