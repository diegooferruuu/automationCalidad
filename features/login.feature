Feature: Login en SauceDemo

  Scenario: Iniciar sesión exitosamente con credenciales válidas
    Given que estoy en la página de inicio
    When ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    And hago clic en el botón de login
    Then debería ver la página de productos
