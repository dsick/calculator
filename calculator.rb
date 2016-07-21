require_relative 'controllers/menu_controller' 

menu = MenuController.new

system "clear"
puts "Welcome to String Calulator!"
menu.main_menu