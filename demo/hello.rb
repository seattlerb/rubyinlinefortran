#!/usr/local/bin/ruby -w

require 'rubygems'
require 'inline/fortran'

class FortranTest
  inline :Fortran do |builder|
    builder.subroutine('print_integer', ["void", "int"], <<-END)
      subroutine print_integer( integer )
        integer, intent(in) :: integer
        print *, 'integer: ', integer
      end
    END
  end
end

blah = FortranTest.new
blah.print_integer(6)
