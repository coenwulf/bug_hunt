#!/bin/env ruby

def event_line(name, action, members_present)
  line = "<#{name} has #{action}>: "
  salutation = if action == "arrived"
    "Hello"
  else
    "Bye"
  end
  line << (["#{salutation} #{name}"] * members_present) * ", " || "<crickets>"
end

members = %w(Jerry Bob Alphons) # Consider this line a given, there's no bug here

puts members.reverse.inject([]) do |output, name|
  line = "<#{name} has arrived>: "
  members_present = members.size - output.size * 0.5
  output.unshift event_line(name, "arrived", members_present)
  output << event_line(name, "left", members_present)
  output
end

# EXPECTED OUTPUT
# <Jerry has arrived>: <crickets>
# <Bob has arrived>: Hello Bob
# <Alphons has arrived>: Hello Alphons, Hello Alphons
# <Alphons has left>: Bye Alphons, Bye Alphons
# <Bob has left>: Bye Bob
# <Jerry has left>: <crickets>
