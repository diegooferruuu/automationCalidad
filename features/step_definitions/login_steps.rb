require_relative '../pages/login_page'

login = LoginPage.new


Given('I am on the login page') do
    login.visit_login_page
end

Given('I enter username {string} and password {string}') do |username, password|
    login.enter_credentials(username, password)
end

When('I click the Login button') do
    login.click_login_button
end

Then('I should be redirected to the products page') do
    expect(login.expected_title_displayed?('Products')).to be true
end

Then('I should see the title {string}') do |expected_title|
    actual_title = login.get_page_title
    if actual_title == expected_title
        puts "The title is correct: #{actual_title}"
    else
        raise "Title mismatch. Expected: #{expected_title}, Actual: #{actual_title}"
    end
end

Given('I enter username {string} and incorrect password {string}') do |username,failed_password|
    login.enter_credentials(username, failed_password)
end

Then('I should see an error message saying {string}') do |expected_error|
    actual_error = login.get_error_message
    if actual_error == expected_error
        puts "The error message is correct: #{actual_error}"
    else
        raise "Unexpected error message. Expected: '#{expected_error}', Actual: '#{actual_error}'"
    end
end

