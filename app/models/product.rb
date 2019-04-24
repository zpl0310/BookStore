class Product<ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_no_line_item_child
  validates :name, :description, :image, presence:true
  validates :price, numericality: {greater_than_or_equal_to:0.01}
  validates :name, uniqueness:true
  validates :image, allow_blank:true,
  format: {with: %r{\.(gif|jpg|png)\Z}i,message:'must be GIF,JPG,PNG images'}

  private
  def ensure_no_line_item_child
    if line_items.empty?
      return true
    else
      errors.add(:base,'Line Items present')
      return false
    end
  end
end



#class Product < ApplicationRecord
#end
