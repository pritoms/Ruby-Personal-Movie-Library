# $LOAD_PATH << '.'

require_relative "func.rb"
include Func

puts "Welcome to your movie library!\n\n"

loop do
  puts "You can add, update, display and delete movies from your library. Enter q to exit.\n\n"
  puts "What would you like to do? \n"
  choice = gets.chomp

  case choice

  when "add"
    add()
    
  when "update"
    update()
    
  when "display"
    display()
    
  when "delete"
    delete()
  end

  break if choice == 'q'
end