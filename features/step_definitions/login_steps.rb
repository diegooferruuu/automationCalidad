Given('que estoy en la página de inicio') do
  visit('/')
end

When('ingreso el usuario {string} y la contraseña {string}') do |usuario, contrasena|
  fill_in('user-name', with: usuario)
  fill_in('password', with: contrasena)
end

When('hago clic en el botón de login') do
  click_button('login-button')
end

Then('debería ver la página de productos') do
  expect(page).to have_content('Products')
end
