require_relative '../pages/login_page'

class NavMenu
    include Capybara::DSL

    def initialize
        @login = LoginPage.new
    end

    def visit_nav_menu_page
        @login.visit_login_page
        @login.enter_credentials('standard_user', 'secret_sauce')
        @login.click_login_button
    end
    
    def click_menu_button
        find('#react-burger-menu-btn').click
    end

    def click_logout_button
        find('#logout_sidebar_link').click
    end

    def click_about_button
        find('#about_sidebar_link').click
    end

    def click_reset_app_state_button
        find('#reset_sidebar_link').click
    end

    def get_menu_title
        find('#header_container > div.header_secondary_container > span').text
    end

    def get_menu_items
        all('.bm-item-list > a').map(&:text)
    end
end


    