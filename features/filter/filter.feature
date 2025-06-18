Feature: Product Filters
  As a user on the products page
  I want to correctly apply sorting filters
  so that I can view products in a specific order

  Background:
    Given I am on the login page
    And I enter username "standard_user" and password "secret_sauce"
    When I click the Login button
    Then I should be redirected to the products page

  Scenario: Filter products by Name (A to Z)
    When I click the sorting options menu button
    And I select "Name (A to Z)" from the sorting filter
    Then the first displayed product should be "Sauce Labs Backpack"
    And the last displayed product should be "Test.allTheThings() T-Shirt (Red)"

  Scenario: Filter products by Name (Z to A)
    When I click the sorting options menu button
    And I select "Name (Z to A)" from the sorting filter
    Then the first displayed product should be "Test.allTheThings() T-Shirt (Red)"
    And the last displayed product should be "Sauce Labs Backpack"

  Scenario: Filter products by Price (low to high)
    When I click the sorting options menu button
    And I select "Price (low to high)" from the sorting filter
    Then the first displayed product should be "Sauce Labs Onesie"
    And the last displayed product should be "Sauce Labs Fleece Jacket"

  Scenario: Filter products by Price (high to low)
    When I click the sorting options menu button
    And I select "Price (high to low)" from the sorting filter
    Then the first displayed product should be "Sauce Labs Fleece Jacket"
    And the last displayed product should be "Sauce Labs Onesie"