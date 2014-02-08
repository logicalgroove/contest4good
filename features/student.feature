Feature: Student

  Scenario: Student register
    When I visit home page
    And I click "Register as a student"
    And I fill in "Email" with "student@g.com"
    And I fill in "Password" with "secret"
    And I fill in "Confirm password" with "secret"
    And I press "Register"
    And I should see "Welcome new student"

  Scenario: Student login
    When I visit home page
    And I click "Login as a student"
    And I fill in "Email" with "student@g.com"
    And I fill in "Password" with "secret"
    And I press "Login"
    And I should see "Welcome back student"
