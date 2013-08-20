class Item < ActiveRecord::Base
  #attr_accessible :name,:price, :real, :weight, :description
  
  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description, presence: true

   has_and_belongs_to_many :carts
  # belongs_to :category 
  
  after_initialize { } # Iteme.new; Item.first, item.find
  after_save       { } # Item.save, Item.create, item.update_attributes
  after_create     { }  # ItemMailer.new_item_created(self).deliver - mailer -- caterogy.inc(:items_count, 1)
  after_update     { }
  after_destroy    { } # Item.destroy -- caterogy.inc(:items_count, 1)
  
end
