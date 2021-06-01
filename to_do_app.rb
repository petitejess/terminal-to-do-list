require_relative './models/list'
require_relative './views/list_view'
require_relative './controllers/list_controller'

list_model = List.new
list_view = ListView.new(list_model)
list_controller = ListController.new(list_model, list_view)
list_controller.run