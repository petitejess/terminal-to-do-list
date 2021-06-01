require 'stringio'
require_relative '../views/list_view'
require_relative '../models/list_item'
require_relative '../models/list'

describe ListView do
	before(:all) do
		@list = List.new
		@content = "cuddle the dog"
		@category = "general"
		@list_item = ListItem.new(@content)
		@list_view = ListView.new(@list)
	end

	it 'should display options' do
		expect(@list_view.options).to be(nil)
	end

	it 'should display invalid input message' do
		expect {@list_view.invalid_input}.to output("That is not a valid option. Please choose 1-5\n").to_stdout
	end

	it 'should say_goodbye' do
		expect {@list_view.say_goodbye}.to output("See you next time!\n").to_stdout
	end
end

describe 'ListView input tests' do
	let(:input) { StringIO.new('2') }
	before(:all) do 
		@list = List.new
		@content = "cuddle the dog"
		@category = "general"
		@list_item = ListItem.new(@content)
		@list_view = ListView.new(@list)
	end

	it 'should get integer from get_option' do
		$stdin = input
		expect(@list_view.get_option).to be_an_instance_of(Integer)
		$stdin = STDIN
	end

	it 'should get_item' do
		$stdin = input
		expect {@list_view.get_item}.to output("Enter the list item:\n").to_stdout
		$stdin = STDIN
	end

	it 'should define get_delete_choice' do
		$stdin = input
		expect{@list_view.get_delete_choice}.to_not raise_error
		$stdin = STDIN
	end

	it 'should define get_category' do
		$stdin = input
		expect{@list_view.get_category}.to output("Enter category (default is general):\n").to_stdout
		$stdin = STDIN
	end

	it 'should define show_items' do
		$stdin = input
		expect{@list_view.show_items}.to_not raise_error
		$stdin = STDIN
	end

	it 'should define show_categories' do
		$stdin = input
		expect{@list_view.show_categories}.to_not raise_error
		$stdin = STDIN
	end

	it 'should define show_category' do
		$stdin = input
		expect{@list_view.show_category("general")}.to_not raise_error
		$stdin = STDIN
	end
end