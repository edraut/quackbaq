class BidPackage
  attr_accessor :id, :quantity, :price, :active
  
  def initialize(attributes)
    @attributes = attributes
    @id = @attributes[:id]
    @quantity = @attributes[:quantity]
    @price = @attributes[:price]
    @active = @attributes[:active]
  end
  
  def self.setup
    @@packages ||= []
    unless @@packages.any?
      @@packages.push self.new(:id => 1, :price => Money.new(1000), :quantity => 10, :active => true)
      @@packages.push self.new(:id => 2, :price => Money.new(2000), :quantity => 25, :active => true)
      @@packages.push self.new(:id => 3, :price => Money.new(3000), :quantity => 50, :active => true)
    end
  end
  
  def self.find(id)
    @@packages.detect{|p| p.id == id}
  end
  
  def price_per_bid
    self.price / self.quantity
  end
  
  def self.all
    @@packages
  end
  self.setup
end