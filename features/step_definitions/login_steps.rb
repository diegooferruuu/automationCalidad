Given('que estoy en la página de login') do
    page.driver.browser.manage.window.maximize
    visit('/')
end

Given('ingreso el usuario {string} y la contraseña {string}') do |user, password|
    fill_in 'user-name', :with => user
    fill_in 'password', :with => password
end

When('hago clic en el botón Login') do
    click_button("login-button") 
end

Then('debería ser redirigido a la página de productos') do
    expect(page).to have_selector('#header_container > div.header_secondary_container > span', text: 'Products')
end

Then('debería ver el título {string}') do |expected_title|
    actual_title = find(:css,'#header_container > div.header_secondary_container > span').text 
    if actual_title == expected_title
        puts "El título es correcto: #{actual_title}"
    end
end

Given('ingreso el usuario {string} y una contraseña incorrecta {string}') do |user,passwordFail|
    fill_in 'user-name', :with => user
    fill_in 'password', :with => passwordFail
end

Then('debería ver un mensaje de error que diga {string}') do |errorMessage|
    error = find(:css, '#login_button_container > div > form > div.error-message-container.error > h3').text
    if error == errorMessage
        puts "El mensaje de error es correcto: #{error}"
    end
end

