Given('I am on the login page') do
    @login_page.visit_login_page
end

Given('I enter username {string} and password {string}') do |username, password|
    @login_page.enter_credentials(username, password)
end

When('I click the Login button') do
    @login_page.click_login_button
end

Then('I should be redirected to the products page') do
    expect(@login_page.expected_title_displayed?('Products')).to be true
end

Then('I should see the title {string}') do |expected_title|
    actual_title = @login_page.get_page_title 
    expect(actual_title).to eq(expected_title), "Title mismatch. Expected: '#{expected_title}', Actual: '#{actual_title}'"
end

Given('I enter username {string} and incorrect password {string}') do |username,failed_password|
    @login_page.enter_credentials(username, failed_password)
end

Then('I should see an error message saying {string}') do |expected_error|
    actual_error = @login_page.get_error_message 
    expect(actual_error).to eq(expected_error), "Unexpected error message. Expected: '#{expected_error}', Actual: '#{actual_error}'"
end