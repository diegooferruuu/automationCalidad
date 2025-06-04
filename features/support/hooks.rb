require_relative '../pages/login_page'
require_relative '../pages/cart_page'
require_relative '../pages/checkout_page'
require_relative '../pages/filter_page'
require_relative '../pages/footer_page'
require_relative '../pages/nav_menu_page'
require_relative '../pages/product_page'


Before do |scenario|
  page.driver.browser.manage.window.maximize if Capybara.current_driver == :selenium_chrome

  @login_page = LoginPage.new
  @cart_page = CartPage.new
  @checkout_page = CheckoutPage.new
  @filter_page = FilterPage.new
  @footer_page = FooterPage.new
  @nav_menu_page = NavMenu.new
  @product_page = Product.new

end

After do 
    Capybara.current_session.driver.quit
end


