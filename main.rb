require_relative 'app'
require_relative 'lib/display'
require_relative 'lib/choice'
require_relative 'lib/list'

MENU = Display.new.options

def exit_app
  puts 'Exiting the app. Goodbye!'
  exit
end

def main
  app = App.new

  List.new.list_options(MENU)

  choice = gets.chomp.to_i

  Choice.new.handle_menu_choice(MENU, choice, app)

  # Loop until the user quits.
  while choice != 8
    List.new.list_options(MENU)

    puts 'Enter option: '

    choice = gets.chomp.to_i

    Choice.new.handle_menu_choice(MENU, choice, app)
  end
end
main
