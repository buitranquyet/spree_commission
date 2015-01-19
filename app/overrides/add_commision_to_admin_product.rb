Deface::Override.new(virtual_path: 'spree/admin/products/_form',
                     name: 'add_commission_to_admin_products',
                     insert_bottom: "[data-hook='admin_product_form_additional_fields']",
                     text: " <p>
                            <%= f.label :commission %>
                            <%= f.text_field :commission %>
                            </p>",
                     disabled: false)
