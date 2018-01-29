class Item < ActiveRecord::Base
  validates :title, :description, :price, :image, uniqueness: true, presence: true
  before_validation :set_price
  belongs_to :merchant
  belongs_to :category

  def set_price
    self.price = (unit_price / 100).to_f.round(2) if unit_price
  end

  def self.total_item_count
    count
  end

  def self.average_item_price
    average(:unit_price).to_f.round(2)
  end

  def self.most_recent_item
    Item.last
  end

  def self.oldest_item
    Item.first
  end

end