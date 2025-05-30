Feature: Login
  In order to acceder a mi cuenta y comprar productos
  As an usuario registrado
  I want to iniciar sesión exitosamente
  
  Scenario Outline: Login exitoso con varios usuarios
    Given que estoy en la página de login
    And ingreso el usuario "<username>" y la contraseña "<password>"
    When hago clic en el botón Login
    Then debería ser redirigido a la página de productos
    And debería ver el título "Products"

  Examples:
    | username      | password     |
    | standard_user | secret_sauce |
    | problem_user  | secret_sauce |
    | performance_glitch_user | secret_sauce |
    | error_user    | secret_sauce |
    | visual_user   | secret_sauce |

  @this
  Scenario: Login con usuario bloqueado
    Given que estoy en la página de login
    And ingreso el usuario "locked_out_user" y la contraseña "secret_sauce"
    When hago clic en el botón Login
    Then debería ver un mensaje de error que diga "Sorry, this user has been locked out."

  @only
  Scenario: Login con credenciales incorrectas
    Given que estoy en la página de login
    And ingreso el usuario "standard_user" y una contraseña incorrecta "secretUser"
    When hago clic en el botón Login
    Then debería ver un mensaje de error que diga "Username and password do not match any user in this service"
