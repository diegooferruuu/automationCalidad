Feature: Cart persistence
  In order to not lose my selected items
  As a user
  I want the cart to preserve items when I navigate to other pages

  Background:
    Given I am logged in as "standard_user" with password "secret_sauce"
  
  Scenario: Cart retains items after visiting another page
    When I add "Sauce Labs Backpack" to the cart
    And I go to the cart
    And I go back to the products page
    And I go to the cart again
    Then I should see the following products in the cart:
      | Sauce Labs Backpack |
