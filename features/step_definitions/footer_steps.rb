require_relative '../pages/footer_page'

Given('I am logged in') do
  visit('/')
  fill_in 'user-name', with: 'standard_user'
  fill_in 'password', with: 'secret_sauce'
  click_button 'Login'
  expect(page).to have_content('Products')
end

When('I click the Twitter link') do
  @footer = FooterPage.new
  @original_window = window_handle
  @footer.click_twitter
end

When('I click the Facebook link') do
  @footer = FooterPage.new
  @original_window = window_handle
  @footer.click_facebook
end

When('I click the LinkedIn link') do
  @footer = FooterPage.new
  @original_window = window_handle
  @footer.click_linkedin
end

Then('I should be redirected to the Twitter page') do
  switch_to_new_window
  expect(page).to have_current_path(/x\.com/, url: true)
end

Then('I should be redirected to the Facebook page') do
  switch_to_new_window
  expect(page).to have_current_path(/facebook\.com/, url: true)
end

Then('I should be redirected to the LinkedIn page') do
  switch_to_new_window
  expect(page).to have_current_path(/linkedin\.com/, url: true)
end


def window_handle
  page.driver.browser.window_handle
end

def switch_to_new_window
  new_window = page.driver.browser.window_handles.find { |handle| handle != @original_window }
  page.driver.browser.switch_to.window(new_window)
end
