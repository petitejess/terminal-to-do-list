require_relative '../models/list_item'
require_relative '../models/list'

describe ListItem do
  before(:each) do
    @content = "to do"
    @category = "category"
    @list_item = ListItem.new(@content, @category)
  end

  it "should return formatted list of item" do
    expect(@list_item.to_s.class).to eq(String)
  end

  it "should update the content" do
    add_content = "to do too"
    @list_item.set_content(add_content)
    expect(@list_item.content).to eq(add_content)
  end

  it "should update the category" do
    add_category = "category too"
    @list_item.set_category(add_category)
    expect(@list_item.category).to eq(add_category)
  end
end

describe List do
  before(:each) do
    @content = "new content"
    @category = "new category"
    @list_item = ListItem.new(@content, @category)
    @list = List.new
  end

  it "should add list item with content" do
    @list.add_item(@content)
    expect(@list.length).to be(1)
    expect(@list.items[0].content).to eq(@content)
  end

  it "should add list item with category" do
    @list.add_item(@content, @category)
    expect(@list.length).to be(2)
    expect(@list.items[0].category).to eq(@category)
  end

  it "should return the array of list items" do
    content_1 = "to do 1"
    category_1 = "category 1"
    content_2 = "to do 2"
    category_2 = "category 2"
    @list.add_item(content_1, category_1)
    @list.add_item(content_2, category_2)
    expect(@list.class).to eq(Array)
  end

  it "should return the length of the list" do
    expect(@list.length).to be(4)
  end

  it "should delete list item with given item content" do
    item_to_delete = "to do 1"
    expect(@list.length).to eq(4)
    @list.delete_item(item_to_delete)
    expect(@list.length).to be(3)
    @list
  end

  it "should not delete list item if category not matched" do
    item_to_delete = "to do 2"
    category_to_delete = "category 1"
    expect(@list.length).to eq(3)
    @list.delete_item(item_to_delete, category_to_delete)
    expect(@list.length).to be(3)
    @list
  end

  it "should return array of categories (string)" do
    expect(@list.categories.class).to eq(Array)
    expect(@list.categories[0]).to eq(String)
  end

  it "should return array of list items in the given category" do
    category = "category 2"
    expect(@list.category(category).class).to eq(Array)
  end
end