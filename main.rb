require_relative 'app'
require_relative 'lib/display.rb'

MENU = Display.new().display_options
puts MENU

def handle_menu_choice(choice, app)
  action = MENU[choice]
  if action
    puts "\n========== #{action} =========="
    app.send(action)
  else
    puts 'Invalid choice. Please try again.'
  end
end

def exit_app
  puts 'Exiting the app. Goodbye!'
  exit
end

def list
  puts "\n========== Libary App =========="
  puts '+--------------------------------------+'
  puts '|              DISPLAY MENU             |'
  puts '+--------------------------------------+'
  MENU.each do |choice, action|
    puts "| #{choice}. #{action} |"
  end
end

def main
  app = App.new

  list

  print 'Enter option: '

  choice = gets.chomp.to_i

  handle_menu_choice(choice, app)

  # Loop until the user quits.
  while choice != 8
    list
    puts 'Enter option: '

    choice = gets.chomp.to_i

    handle_menu_choice(choice, app)
  end
end
main
