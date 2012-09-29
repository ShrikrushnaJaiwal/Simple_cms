class Section < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name,:position,:page_id, :content, :visible, :content_type
  belongs_to :page
  has_many :section_edits
  has_many :editors,:through => :section_edits,:class_name =>"AdminUser"
end
