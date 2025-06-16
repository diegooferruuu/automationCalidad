Feature: Checkout process
  As a customer
  I want to complete the checkout process
  so that I can purchase products and verify my order details

  Background:
    Given I am logged in as a standard user
    And I have added the product "Sauce Labs Backpack" to the cart

  @smoke
  Scenario: Complete the checkout successfully
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    And I confirm the purchase
    Then I should see a confirmation message "Thank you for your order!"

  @smoke
  Scenario: Product in overview matches added product
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    Then the overview should contain the product "Sauce Labs Backpack"

  @smoke
  Scenario: Price and tax in overview are correct
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    Then the item total should match the price of "Sauce Labs Backpack"
    And the tax should be correctly calculated and displayed

  Scenario: Cart is empty after purchase
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    And I confirm the purchase
    Then the cart should be empty