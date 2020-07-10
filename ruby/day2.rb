# Print the contents of an array of sixteen numbers, four numbers at a time, using just each.

my_arr = [];
(1..20).each do |x| 
  my_arr << x
  if my_arr.length() == 4 
    puts "#{my_arr.join(' ')}"
    my_arr.clear
  end
end
puts('=============')

# Now, do the same with each_slice in Enumerable

(1..20).each_slice(4) {|x| puts "#{x * ' '}"}
puts('=============')

=begin
The Tree class was interesting, but it did not allow you to specify a new
tree with a clean user interface. Let the initializer accept a nested
structure of hashes. You should be able to specify a tree like this:
{'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
'child 4' => {} } } }.
=end

class Tree 
  attr_accessor :children, :name

  def initialize(hash)
    @children = []
    @name = hash.keys.first
    hash[@name].each { |k,v| @children << Tree.new(k => v)}
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block)}
  end

  def visit(&block)
    block.call self
  end

end

relations = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
'child 4' => {} } } })
relations.visit_all { |n| puts n.name }

puts("==============")

=begin

Write a simple grep that will print the lines of a file having any occur-
rences of a phrase anywhere in that line. You will need to do a simple
regular expression match and read lines from a file. (This is surprisingly
simple in Ruby.) If you want, include line numbers.

=end
# We can use $. global variable to access line number or attribute lineno

def grep(filename, search_term)
  File.open(filename) do |f| 
    f.each {|line| puts "#{$.} - #{line}" if line.include? search_term }
  end
end

grep('file.txt', 'day')

