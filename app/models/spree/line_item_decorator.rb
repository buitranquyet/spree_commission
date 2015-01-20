Spree::LineItem.class_eval do
  # override the options assignment in line_item
  def options=(options={})
    return unless options.present?

    opts = options.dup # we will be deleting from the hash, so leave the caller's copy intact

    currency = opts.delete(:currency) || order.try(:currency)

    if currency
      self.currency = currency
      self.price    = variant.price_in(currency).amount +
                      variant.price_modifier_amount_in(currency, opts)
    else
      self.price    = variant.price +
                      variant.price_modifier_amount(opts)
    end
    self.get_commission_price
    
    self.assign_attributes opts
  end

  def get_commission_price
    commission = variant.product.try(:commission) || 
                 Spree::CommissionConfiguration.new.commission
    self.price = self.price * (1 + commission / 100)
  end
end