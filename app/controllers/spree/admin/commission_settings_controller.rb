class Spree::Admin::CommissionSettingsController < Spree::Admin::BaseController

  def edit
    @config_keys = [:commission]
    @config = Spree::CommissionConfiguration.new
    @store = current_store
  end

  def update
    config = Spree::CommissionConfiguration.new
    params.each do |name, value|
      next unless config.has_preference? name
      config[name] = value
    end
    Spree::Product.update_all(updated_at: Time.now)
    redirect_to edit_admin_commission_settings_path
  end
end
