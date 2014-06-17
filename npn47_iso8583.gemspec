# -*- mode: ruby; encoding: utf-8; tab-width: 2; indent-tabs-mode: nil -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "iso8583/version"
 
Gem::Specification.new do |s|
  s.name        = "npn47_iso8583"
  s.version     = ISO8583::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tim Becker", "Slava Kravchenko", "Neeraj PN"]
  s.email       = ["tim.becker@kuriositaet.de","cordawyn@gmail.com", "neerajpn47@gmail.com"]
  s.homepage    = "http://github.com/neerajpn47/8583/"
  s.summary     = "Ruby implementation of ISO 8583 financial messaging"
  s.description = "Ruby implementation of ISO 8583 financial messaging"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "npn47_iso8583"
  s.has_rdoc                  = true
  
  s.requirements << "none"
  
  s.files        = Dir.glob("{lib,test}/**/*")
  s.require_path = 'lib'
end
