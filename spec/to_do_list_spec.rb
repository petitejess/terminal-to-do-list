require_relative '../models/list_item'

describe ListItem do
	Default_Category = "general"
	before(:each) do
		@content = "cuddle the dog"
		@list_item = ListItem.new(@content)
	end
	describe 'Create/Read' do
		it 'should be created with content' do
			expect(@list_item.content).to eq(@content)
		end
		it 'should be created with default category' do
			expect(@list_item.category).to eq(Default_Category)
		end
		it 'should be created with default category' do
			category = "home"
			list_item = ListItem.new(@content, category)
			expect(list_item.category).to eq(category)
		end
	end
	describe 'Display' do
		it 'should return a well-formatted string for display' do
			expect(@list_item.to_s).to eq(@content)	
		end
	end
	describe 'Edit' do
		it 'should update content' do
			updated_content = "take a nap"
			@list_item.set_content(updated_content)
			expect(@list_item.content).to eq(updated_content)
		end
		it 'should update category' do
			updated_category = "home"
			@list_item.set_category(updated_category)
			expect(@list_item.category).to eq(updated_category)
		end
	end
end

require_relative '../controllers/list'

describe List do
	Default_Category = "general"
	before(:each) do
		@list = List.new
		@content = "cuddle the dog"
		@category = "general"
		@list_item = ListItem.new(@content)
	end
	describe 'Read items' do
		before(:each) do
			@list.add_item(@content, @category)
		end
		it 'should return list items for a given category with one match' do
			expect(@list.category(Default_Category).length).to be(1)
		end
		it 'should return list items for a given category with two matches' do
			content = "take a nap"
			@list.add_item(content, Default_Category)
			expect(@list.category(Default_Category).length).to be(2)
		end
		it 'should return list items for a given category with multiple categories' do
			content = "take a nap"
			category = "home"
			@list.add_item(content, category)
			expect(@list.category(Default_Category).length).to be(1)
		end
	end
	describe 'Add item' do
		it 'should add an item with content' do
			@list.add_item(@content, @category)
			expect(@list.length).to be(1)
			expect(@list.items[0].content).to eq(@content)
		end
		it 'should add an item with category' do
			category = "home"
			@list.add_item(@content, category)
			expect(@list.items[0].category).to eq(category)
		end
	end
	describe 'Delete item' do
		before(:each) do
			@list.add_item(@content, @category)
		end
		it 'should delete a list item' do
			expect(@list.length).to be(1)
			@list.delete_item(@list_item)
			expect(@list.length).to be(0)
		end
		it 'should not delete a list item if category does not match' do
			expect(@list.length).to be(1)
			category = "home"
			list_item = ListItem.new(@content, category)
			@list.delete_item(list_item)
			expect(@list.length).to be(1)
		end
		it 'should not delete a list item if content does not match' do
			expect(@list.length).to be(1)
			content = "take a nap"
			list_item = ListItem.new(content, @category)
			@list.delete_item(list_item)
			expect(@list.length).to be(1)
		end
	end
	describe 'Display' do
		before(:each) do
			@list.add_item(@content, @category)
		end
		it 'should return a list of categories' do
			categories = [@category]
			expect(@list.categories).to eq(categories)
		end
		it 'should return a list of categories with multiple' do
			content = "take a nap"
			category = "home"
			@list.add_item(content,category)
			categories = [@category,category]
			expect(@list.categories).to eq(categories)
		end
	end
end