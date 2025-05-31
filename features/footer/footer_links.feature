Feature: Footer links
  As a user
  I want to access Sauce Labs' social media pages
  So that I can follow updates from the company

  Background:
    Given I am logged in

  Scenario: Twitter link redirects correctly
    When I click the Twitter link
    Then I should be redirected to the Twitter page

  Scenario: Facebook link redirects correctly
    When I click the Facebook link
    Then I should be redirected to the Facebook page

  Scenario: LinkedIn link redirects correctly
    When I click the LinkedIn link
    Then I should be redirected to the LinkedIn page
