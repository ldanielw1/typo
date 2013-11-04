Feature: Merge Articles
  As a blog administrator
  In order to distill my published articles
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    Given the following articles exist:
    | title | id | author | body         | published | allow_comments |
    | test1 | 1  | a1     | test1 - body | true      | true           |
    | test2 | 2  | a2     | test2 - body | true      | true           |

  Scenario: Successfully merge articles
    Given I am logged in as admin
    When I go to the home page
    When I am editting "test1"
    When I fill in "merge_with" with the id for "test2"
    And I press "Merge"
    Then I should be on the admin content page
    Then I should not see "test2"

  Scenario: Non-admin should not be able to merge articles
    Given I am logged in as not admin
    When I go to the home page
    When I am editting "test1"
    Then I should not see "Merge"

  Scenario: Merging articles should merge contents too
    Given I am logged in as admin
    When I go to the home page
    When I am editting "test1"
    When I fill in "merge_with" with the id for "test2"
    And I press "Merge"
    Then I should be on the admin content page
    Then I should not see "test2"
    When I am editting "test1"
    Then I should see "test1 - body"
    Then I should see "test2 - body"
    