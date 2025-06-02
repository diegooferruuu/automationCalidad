Feature: Cart counter
  In order to visualize how many items are in my cart
  As a user
  I want the cart counter to show the correct number of items

  Background:
    Given I am logged in as "standard_user" with password "secret_sauce"
  @cart
  Scenario: Add multiple products and verify cart counter
    When I add the following products to the cart:
      | Sauce Labs Backpack     |
      | Sauce Labs Onesie       |
    Then the cart counter should show "2"
