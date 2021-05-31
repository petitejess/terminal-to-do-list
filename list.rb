require_relative './models/list_item'

class List
  def initialize
    @list = []
  end

  def add_item(content, category)
    @list << ListItem.new(content, category)
  end

  def category(category)
    @list.filter {|list_item| list_item.category == category}
  end

  def categories
    categories = []
    @list.each do |item|
      categories << item.category unless categories.include?(item.category)
    end

    categories
  end

  def items
    @list
  end

  def length
    @list.length
  end

  def delete_item(list_item)
    @list.delete_if do |item|
      (item.category == list_item.category) && (item.content == list_item.content)
    end
  end
end