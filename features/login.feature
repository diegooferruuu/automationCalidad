Feature: Login
  In order to acceder a mi cuenta y comprar productos
  As an usuario registrado
  I want to iniciar sesión exitosamente

  @this
  Scenario: Login exitoso
    Given que estoy en la página de login
    And ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    When hago clic en el botón Login
    Then debería ser redirigido a la página de productos
    And debería ver el título "Products"

  @only
  Scenario: Login con credenciales incorrectas
    Given que estoy en la página de login
    And ingreso el usuario "standard_user" y una contraseña incorrecta "secretUser"
    When hago clic en el botón Login
    Then debería ver un mensaje de error que diga "Username and password do not match any user in this service"
