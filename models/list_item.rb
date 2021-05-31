class ListItem
  attr_reader :content, :category

  def initialize(content, category = "general")
    @content = content
    @category = category
  end

  def set_content(updated_content)
    @content = updated_content
  end

  def set_category(updated_category)
    @category = updated_category
  end

  def to_s
    "#{@content}"
  end
end