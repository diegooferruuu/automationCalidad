Feature: Navigation menu in Sauce Demo

  As a logged-in user
  I want to interact with the side navigation menu
  So that I can access options like logout, about, and reset app state

  Background:
    Given I am on the navigation menu page

  Scenario: Viewing the close button in the menu
    When I click the menu button
    Then I should see the close menu button


  Scenario: Viewing all available menu items
    When I click the menu button
    Then I should see the following menu items:
      | All Items        |
      | About            |
      | Logout           |
      | Reset App State  |

  Scenario: Redirecting after clicking Logout
    When I click the menu button
    And I click the Logout button
    Then I should be redirected to the login page

  Scenario: Redirecting after clicking About
    When I click the menu button
    And I click the About button
    Then I should be redirected to the Sauce Labs website

  Scenario: Resetting the app state
    When I click the menu button
    And I click the Reset App State button
    Then the shopping cart should be empty
