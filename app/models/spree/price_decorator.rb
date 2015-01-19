Spree::Price.class_eval do
  def price=(price)
    commission = variant.product.try(:commission) || 
                 Spree::CommissionConfiguration.new.commission
    self[:amount] = Spree::LocalizedNumber.parse(price.to_d * (1 + commission/100))
  end
end