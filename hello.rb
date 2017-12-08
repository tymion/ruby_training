#!/usr/bin/ruby -w

puts "Hello, Ruby!";

print <<EOT
   This is the first way of creating
   here document ie. multiple line string.
EOT

print <<"EOF";
   This is the second way of creating
   here document ie. multiple line string.
EOF

print <<`EOC`
    echo hi there
    echo lo there
EOC
=begin
print <<"foo", <<"bar"  # you can stack them
    I said foo.
foo
    I said bar.
bar
=end
BEGIN {
    puts "Initializing Ruby Program"
}

END {
    puts "Deinitializing Ruby Program"
}
