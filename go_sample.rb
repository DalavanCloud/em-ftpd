#!/usr/bin/ruby

require 'ftpd.rb'
require 'backend.rb'
require 'sample_backend.rb'
require 'real_fs_backend.rb'

EventMachine::run do
  puts "Starting ftp server on port 2021"
  EventMachine::start_server("0.0.0.0", 2021, FTPServer, SampleBackend.new)
end

