Inline::Fortran by Ryan Davis
    http://www.rubyforge.org/projects/rubyinline

== DESCRIPTION:
  
Just because we can... Inline::Fortran.

== FEATURES/PROBLEMS:
  
* Very rudimentary right now. Needs some love.

== SYNOPSYS:

    inline :Fortran do |builder|
      builder.subroutine('print_integer', ["void", "int"], <<-END)
        subroutine print_integer( integer )
          integer, intent(in) :: integer
          print *, 'integer: ', integer
        end
      END
    end

== REQUIREMENTS:

+ RubyInline
+ g95 - should support more compilers later.

== INSTALL:

+ sudo gem install InlineFortran

== LICENSE:

(The MIT License)

Copyright (c) 2006 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
