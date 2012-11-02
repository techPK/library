require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :name => "MyString",
      :subject => "MyText",
      :page_count => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path, :method => "post" do
      assert_select "input#book_name", :name => "book[name]"
      assert_select "textarea#book_subject", :name => "book[subject]"
      assert_select "input#book_page_count", :name => "book[page_count]"
    end
  end
end
