class AdminUser < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :first_name, :username, :last_name
  has_and_belongs_to_many :pages 
  has_many :section_edits
  has_many :sections, :through => :section_edits 
end
