require_relative '../models/list_item'
require_relative '../models/list'
require_relative '../views/list_view'

class ListController
  def initialize(list_model, list_view)
    @list_model = list_model
    @list_view = list_view
  end

  def run
    loop do
      # Print options
      @list_view.options

      # Get option input
      case input = @list_view.get_option
      when 1
        @list_view.show_items
      when 2
        @list_view.show_categories
      when 3
        input_content = @list_view.get_item
        input_category = @list_view.get_category
        @list_model.add_item(input_content, input_category)
        @list_view.show_items
      when 4
        @list_view.get_delete_choice
        @list_view.show_items
      when 5
        @list_view.say_goodbye
        break
      else
        @list_view.invalid_input
      end
    end
  end
end