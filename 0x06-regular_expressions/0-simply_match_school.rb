#!/usr/bin/env ruby
input = ARGV[0]
pattern = /School+/
if input.scan(pattern)
  puts input.scan(pattern)
end
