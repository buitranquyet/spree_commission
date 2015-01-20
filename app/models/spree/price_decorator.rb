Spree::Price.class_eval do
  def money
    return unless variant
    commission = variant.product.try(:commission) || 
             Spree::CommissionConfiguration.new.commission
    Spree::Money.new(amount * (1 + commission / 100) || 0, { currency: currency })
  end
end