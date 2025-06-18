Feature: Empty cart
  As a user
  I want to be able to clear the cart
  so that I can remove all unwanted items

  Background:
    Given I am logged in as "standard_user" with password "secret_sauce"
    
  Scenario: Remove all items from the cart
    When I add the following products to the cart:
      | Sauce Labs Backpack   |
      | Sauce Labs Bike Light |
    And I go to the cart
    And I remove "Sauce Labs Backpack" from the cart
    And I remove "Sauce Labs Bike Light" from the cart
    Then the cart should be empty