class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  belongs_to :user

  validates :name , presence: true, length:{minimum: 3}
  validates :description, presence: true, length:{minimum: 5}
  validates :price, numericality: {greater_than_or_equal_to: 0, less_than: 2000000}

  default_scope order: 'items.created_at DESC'

end
