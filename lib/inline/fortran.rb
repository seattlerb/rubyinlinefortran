#!/usr/bin/env ruby

require 'rubygems'
require 'inline'

module Inline
  class Fortran

    VERSION = '1.0.0'

    def initialize(mod)
      @mod = mod
      @functions = {}
    end

    def subroutine(subroutine_name, c_signature, src)
      @functions[subroutine_name] = [c_signature, src]
    end

    def load_cache
      return false
    end

    def build
      c_builder = Inline::C.new(@mod)

      src_name = "#{Inline.directory}/#{@mod}.f90"
      File.open(src_name, "w") do |f|
        @functions.each do |name, (signature, src)|

          src.sub!(/#{name}/, "f_#{name}")
          
          args = []
          call_args = []
          return_type = signature.shift

          signature.each_with_index do |arg_type, i|
            args << "#{arg_type} arg#{i}"
            call_args << "&arg#{i}"
          end
          
          c_func = "#{return_type} #{name}(#{args.join(', ')})"
          c_builder.c <<-EOF
            #{c_func} {
              f_#{name}(#{call_args.join(', ')});
            }
          EOF

          f.puts src
          f.puts
        end
      end

      Dir.chdir File.dirname(src_name) do
        cmd = "g95 -c -fno-underscoring #{File.basename(src_name)}"
        $stderr.puts cmd if $DEBUG
        system cmd
        c_builder.add_link_flags "#{@mod}.o"
        c_builder.add_link_flags "-lf95"
        c_builder.build
        c_builder.load
      end
    end
    def load
    end
  end
end
