#!/usr/bin/env ruby

require './run_loop'
require './globals'
require 'delegate'

def usage
  puts "Usage: #{$0} <filename>"
  exit 1
end

filename = ARGV.first

usage unless filename && !filename.empty?

RunLoop.new.tap do |l|
  DelegateClass(Globals).new(Globals.new(l)).instance_eval(File.read(filename))
end.start
