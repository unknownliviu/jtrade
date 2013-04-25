class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price,:photo
  belongs_to :user

  validates :name , presence: true, length:{minimum: 3}
  validates :description, presence: true, length:{minimum: 5}
  validates :price, numericality: {greater_than_or_equal_to: 0, less_than: 2000000}

    has_attached_file :photo,                                                  
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",    
      :url => "/system/:attachment/:id/:style/:filename"  

  default_scope order: 'items.created_at DESC'
	validates_attachment :photo,
  :content_type => { content_type:["image/jpg","image/png","image/jpeg"] },
  :size => { :in => 0..1025.kilobytes }
end
