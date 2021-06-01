require_relative '../models/list_item'
require_relative '../models/list'

class ListView
  def initialize(list)
    @list = list
  end

  def options
    puts "\nPlease choose an option (1-5)"
    puts "(1) Show list"
    puts "(2) Show category"
    puts "(3) Add an item"
    puts "(4) Delete an item"
    puts "(5) Quit"
  end

  def invalid_input
    puts "That is not a valid option. Please choose 1-5\n"
  end

  def say_goodbye
    puts "See you next time!\n"
  end

  def get_option
    gets.strip.to_i
  end

  def get_item
    puts "Enter the list item:\n"
    gets.strip.downcase
  end

  def get_category
    puts "Enter category (default is general):\n"
    gets.strip.downcase
  end

  def get_delete_choice
    puts "Select the entry by number to delete:"
    @list.items.each_with_index do |list_item, index|
      puts "(#{index + 1}) #{list_item}\n"
    end
    entry = gets.strip.to_i
    @list.delete_item(@list.items[entry - 1])
  end

  def show_items
    puts "\nTo do"
    puts "------"
    puts @list.items
  end

  def show_categories
    puts "\nCategories"
    puts "----------"
    @list.categories.each {|cat| puts cat}
  end

  def show_category(category)
    puts "\nList for #{category}"
    puts "---------------"
    puts @list.category(category)
  end
end