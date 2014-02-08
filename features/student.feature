Feature: Student

  Scenario: Student register
    When I visit home page
    And I click "Sign up"
    And I fill in "Name" with "Jim"
    And I fill in "Email" with "student@g.com"
    And I fill in "Password" with "secret_secret"
    And I fill in "Password confirmation" with "secret_secret"
    And I press "Sign up"
    And I should see "A message with a confirmation link has been sent"

  Scenario: Student login
    Given I exist as a student
    When I visit home page
    And I click "Sign in"
    And I fill in "Email" with "student@g.com"
    And I fill in "Password" with "secret_secret"
    And I press "Sign in"
    And I should see "Welcome back student"
