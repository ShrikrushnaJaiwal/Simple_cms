class Subject < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :name,:position,:visible,:created_at, :hashed_password, :salt

  attr_protected :hashed_password, :salt

  validates_presence_of :name ,:message => "can't be empty"
 
  validates_length_of :name, :maximum => 255
  
  has_many :pages
  scope :visible, where(:visible =>true)
  scope :invisible, where(:visible =>false)
  scope :search, lambda {|query| where (["name LIKE ?","%#{query}%"])}
  
end
