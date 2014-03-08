class TodoItem < ActiveRecord::Base
  attr_accessible :completed, :title
  validates :title, :presence => true
end
