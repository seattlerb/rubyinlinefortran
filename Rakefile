# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/inline/fortran.rb'

Hoe.new('InlineFortran', Inline::Fortran::VERSION) do |p|
  p.rubyforge_name = 'rubyinline'
  p.summary = 'A RubyInline extension for Fortran'
  p.description = p.paragraphs_of('README.txt', 2..5).join("\n\n")
  p.url = p.paragraphs_of('README.txt', 0).first.split(/\n/)[1..-1]
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.extra_deps << "RubyInline"

  p.developer "Ryan Davis", "ryand-ruby@zenspider.com"
end

# vim: syntax=Ruby
