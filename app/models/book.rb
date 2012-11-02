class Book < ActiveRecord::Base
  attr_accessible :name, :page_count, :subject
end
