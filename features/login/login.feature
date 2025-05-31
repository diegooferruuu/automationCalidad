Feature: Login
  In order to access my account and purchase products
  As a registered user
  I want to log in successfully


  Scenario Outline: Successful login with multiple users
    Given I am on the login page
    And I enter username "<username>" and password "<password>"
    When I click the Login button
    Then I should be redirected to the products page
    And I should see the title "Products"

  Examples:
    | username               | password     |
    | standard_user          | secret_sauce |
    | problem_user           | secret_sauce |
    | performance_glitch_user| secret_sauce |
    | error_user             | secret_sauce |
    | visual_user            | secret_sauce |

  @this
  Scenario: Login with locked out user
    Given I am on the login page
    And I enter username "locked_out_user" and password "secret_sauce"
    When I click the Login button
    Then I should see an error message saying "Epic sadface: Sorry, this user has been locked out."

  @only
  Scenario: Login with incorrect credentials
    Given I am on the login page
    And I enter username "standard_user" and incorrect password "secretUser"
    When I click the Login button
    Then I should see an error message saying "Epic sadface: Username and password do not match any user in this service"
