Feature: Cart operations

  Background:
    Given I am logged in as "standard_user" with password "secret_sauce"

  
  Scenario: Add multiple products to cart
    When I add the following products to the cart:
      | Sauce Labs Backpack     |
      | Sauce Labs Bolt T-Shirt |
    And I go to the cart
    Then I should see the following products in the cart:
      | Sauce Labs Backpack     |
      | Sauce Labs Bolt T-Shirt |


  Scenario: Remove a product from the cart
    When I add the following products to the cart:
      | Sauce Labs Backpack     |
      | Sauce Labs Bike Light   |
    And I go to the cart
    And I remove "Sauce Labs Bike Light" from the cart
    Then I should see the following products in the cart:
      | Sauce Labs Backpack     |
    And I should not see "Sauce Labs Bike Light" in the cart


  Scenario: Product details in the cart are correct
    When I add "Sauce Labs Onesie" to the cart
    And I go to the cart
    Then the product "Sauce Labs Onesie" should have:
      | description                        | Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel. |
      | price                              | $7.99 |
