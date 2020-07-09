# Print the string "Hello, world."

puts("Hello, world.")
puts('=============')

# For the string “Hello, Ruby,” find the index of the word “Ruby.”

puts("Hello, Ruby".index("Ruby"))
puts('=============')

# print your name ten times 
puts("your name \n" * 10)
puts('=============')

# Print the string "This is sentence number 1," where the number 1 changes from 1 to 10.
puts( (1..10).map { |n| "This is sentence number #{n}" }.join("\n"))
puts('=============')

# Run a Ruby program from a file.
# ruby day1.rb

=begin
Bonus problem: If you’re feeling the need for a little more, write a program 
that picks a random number. Let a player guess the number,
telling the player whether the guess is too low or too high.
=end

print "Welcome to the Guessing game\n"
print "Enter a number :"
number = gets.to_i

random_number = rand 100

loop do
  if number < random_number
    puts "Guess a bigger number"
    number = gets.to_i
  elsif number > random_number
    puts "Guess a smaller number"
    number = gets.to_i
  else
    puts "Correct Guess."
    break
  end
end


