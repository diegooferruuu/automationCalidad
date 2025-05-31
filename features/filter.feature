Feature: Filtros de productos
    Para poder visualizar los productos en un orden específico
    Como usuario en la página de productos
    Quiero aplicar filtros de ordenamiento correctamente

    Background:
    Given que estoy en la página de login
    And ingreso el usuario "standard_user" y la contraseña "secret_sauce"
    When hago clic en el botón Login
    Then debería ser redirigido a la página de productos

    Scenario: Filtrar productos por Nombre (A a la Z)
        When hago clic en el botón del menú de opciones de ordenamiento
        And selecciono "Name (A to Z)" en el filtro de ordenamiento
        Then el primer producto mostrado debería ser "Sauce Labs Backpack"
        And el último producto mostrado debería ser "Test.allTheThings() T-Shirt (Red)"

    Scenario: Filtrar productos por Nombre (Z a la A)
        When hago clic en el botón del menú de opciones de ordenamiento
        And selecciono "Name (Z to A)" en el filtro de ordenamiento
        Then el primer producto mostrado debería ser "Test.allTheThings() T-Shirt (Red)"
        And el último producto mostrado debería ser "Sauce Labs Backpack"

    Scenario: Filtrar productos por Precio (menor a mayor)
        When hago clic en el botón del menú de opciones de ordenamiento
        And selecciono "Price (low to high)" en el filtro de ordenamiento
        Then el primer producto mostrado debería ser "Sauce Labs Onesie"
        And el último producto mostrado debería ser "Sauce Labs Fleece Jacket"

    Scenario: Filtrar productos por Precio (mayor a menor)
        When hago clic en el botón del menú de opciones de ordenamiento
        And selecciono "Price (high to low)" en el filtro de ordenamiento
        Then el primer producto mostrado debería ser "Sauce Labs Fleece Jacket"
        And el último producto mostrado debería ser "Sauce Labs Onesie"
