class AddCommisionToProduct < ActiveRecord::Migration
  def self.up
    if table_exists?('products')
      add_column :products, :commission, :decimal, precision: 8, scale: 2
    elsif table_exists?('spree_products')
      add_column :spree_products, :commission, :decimal, precision: 8, scale: 2
    end
  end

  def self.down
    if table_exists?('products')
      remove_column :products, :commission
    elsif table_exists?('spree_products')
      remove_column :spree_products, :commission
    end
  end
end
