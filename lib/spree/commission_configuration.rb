class Spree::CommissionConfiguration < Spree::Preferences::Configuration
  preference :commission, :decimal, default:  10
end