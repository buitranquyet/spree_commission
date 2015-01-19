Deface::Override.new(virtual_path: 'spree/admin/shared/_configuration_menu',
                     name: 'add_commission_to_admin_general_settings',
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     text: '<%= configurations_sidebar_menu_item "Spree Commission", edit_admin_commission_settings_path %>',
                     disabled: false)
