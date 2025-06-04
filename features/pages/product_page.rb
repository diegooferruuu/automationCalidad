require_relative '../pages/login_page'

class Product
    include Capybara::DSL
    
    def initialize
        @login = LoginPage.new
    end

    def visit_product_page
        @login.visit_login_page
        @login.enter_credentials('standard_user', 'secret_sauce')
        @login.click_login_button
    end
    
    def click_add_to_cart_button(product_name)
        find("button[name='add-to-cart-sauce-labs-#{product_name}']").click
    end

    def click_remove_button(product_name)
        find("button[name='remove-sauce-labs-#{product_name}']").click
    end

    def get_product_title(product_name)
        find("div.inventory_item_name", text: product_name).text
    end
    
    def get_product_price(product_name)
        find("div.inventory_item_price", text: product_name).text
    end

    def get_cart_item_count
        find('.shopping_cart_badge').text.to_i
    end

    def click_cart_icon
        find('.shopping_cart_link').click
    end
    
    def click_continue_shopping_button
        find('#continue-shopping').click
    end
end