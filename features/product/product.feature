Feature: Product Cart Management

  Background:
    Given I am on the product page

  Scenario: Add a product to the cart
    When I add the product "backpack" to the cart
    And I click the cart icon
    Then I should see "Sauce Labs Backpack" in the cart
    And the cart item count should be 1

  Scenario: Remove a product from the cart
    When I add the product "backpack" to the cart
    And I remove the product "backpack" from the cart
    Then the shopping cart should be empty

  Scenario: View product in product list after continuing shopping
    When I add the product "backpack" to the cart
    And I click the cart icon
    And I click the Continue Shopping button
    And I click the cart icon
    Then I should see "Sauce Labs Backpack" in the product list

  Scenario: Add multiple products and check count
    When I add the product "backpack" to the cart
    And I add the product "bike-light" to the cart
    Then the cart item count should be 2

  Scenario: Remove one of multiple products and check count
    When I add the product "backpack" to the cart
    And I add the product "bike-light" to the cart
    And I remove the product "bike-light" from the cart
    Then the cart item count should be 1
    And I should see "Sauce Labs Backpack" in the cart
