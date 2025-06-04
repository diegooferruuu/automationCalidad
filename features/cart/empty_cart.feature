Feature: Empty cart
  In order to remove all unwanted items
  As a user
  I want to be able to clear the cart

  Background:
    Given I am logged in as "standard_user" with password "secret_sauce"
    
  Scenario: Remove all items from the cart
    When I add the following products to the cart:
      | Sauce Labs Backpack     |
      | Sauce Labs Bike Light   |
    And I go to the cart
    And I remove "sauce labs backpack" from the cart
    And I remove "sauce labs bike light" from the cart
    Then the cart should be empty
