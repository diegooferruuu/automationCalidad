Feature: Checkout process

  Background:
    Given I am logged in as a standard user
    And I have added a product to the cart

  Scenario: Complete the checkout successfully
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    And I confirm the purchase
    Then I should see a confirmation message "Thank you for your order!"

  Scenario: Product in overview matches added product
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    Then the overview should contain the product I added

  Scenario: Price in overview is correct
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    Then the item total should match the product price

  Scenario: Cart is emptied after purchase
    When I proceed to checkout
    And I enter my information:
      | first_name  | Beto   |
      | last_name   | Tester |
      | postal_code | 12345  |
    And I confirm the purchase
    Then the cart should be empty after purchase

