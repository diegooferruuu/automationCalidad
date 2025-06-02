require_relative '../pages/nav_menu_page'
nav_menu = NavMenu.new

Given('I am on the navigation menu page') do
    nav_menu.visit_nav_menu_page
end

When('I click the menu button') do
    nav_menu.click_menu_button
end

When('I click the Logout button') do
    nav_menu.click_logout_button
end

When('I click the About button') do
    nav_menu.click_about_button
end

When('I click the Reset App State button') do
    nav_menu.click_reset_app_state_button
end

Then('I should see the close menu button') do
  expect(page).to have_selector('#react-burger-cross-btn', visible: true)
end

Then('I should see the following menu items:') do |table|
    expected_items = table.raw.flatten
    actual_items = nav_menu.get_menu_items
    expect(actual_items).to match_array(expected_items)
end
Then('I should be redirected to the login page') do
    expect(page).to have_selector('#login-button', visible: true)
end

Then('I should see the menu items:') do |table|
    expected_items = table.raw.flatten
    actual_items = nav_menu.get_menu_items
    expect(actual_items).to match_array(expected_items)
end

Then('I should be redirected to the Sauce Labs website') do
  expect(page).to have_current_path(/saucelabs\.com/, url: true)
end

Then('the shopping cart should be empty') do
  expect(page).to have_no_selector('.shopping_cart_badge')
end

