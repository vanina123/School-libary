require_relative 'app'
def display
  {
    1 => 'list_all_books',
    2 => 'list_all_people',
    3 => 'create_a_teacher',
    4 => 'create_a_student',
    5 => 'create_a_book',
    6 => 'create_a_rental',
    7 => 'list_rentals_for_a_person',
    8 => 'quit'
  }
end

def handle_menu_choice(choice, app)
  menu_options = display
  action = menu_options[choice]
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
  menu_options = display
  puts "\n========== Libary App =========="
  puts '+--------------------------------------+'
  puts '|              DISPLAY MENU             |'
  puts '+--------------------------------------+'
  menu_options.each do |choice, action|
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
