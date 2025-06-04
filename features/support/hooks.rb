require_relative '../pages/login_page'
require_relative '../pages/cart_page'

Before('@cart') do
  @login = LoginPage.new
  @cart = CartPage.new
end


After do 
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

