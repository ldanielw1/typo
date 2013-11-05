Feature: Categories
  As a blog user
  In order to see classify articles
  I want to be able to create article categories on my blog

  Background:
    Given the blog is set up
    Given the following categories exist:
    | title     | keyword | permalink | description |
    | category1 | keyword | permalink | description |
    | category2 | keyword | permalink | description |

  Scenario: Fail to edit categories that don't exist
    Given I am logged in as admin
    Then I should not be able to edit a non-existent category

  Scenario: Successfully create new categories as admin
    Given I am logged in as admin
    When I am creating a new category
    When I fill in "category_name" with "category3"
    When I fill in "category_description" with "description3"
    When I fill in "category_permalink" with "permalink3"
    When I fill in "category_keywords" with "keyword3"
    And I press "Save"
    Then I should be on the new categories page
    Then I should see "category3"
    Then I should see "description3"
    Then I should see "permalink3"
    Then I should see "keyword3"

  Scenario: Successfully create new categories as non-admin
    Given I am logged in as not admin
    When I am creating a new category
    When I fill in "category_name" with "category4"
    When I fill in "category_description" with "description4"
    When I fill in "category_permalink" with "permalink4"
    When I fill in "category_keywords" with "keyword4"
    And I press "Save"
    Then I should be on the new categories page
    Then I should see "category4"
    Then I should see "description4"
    Then I should see "permalink4"
    Then I should see "keyword4"

  Scenario: Successfully edit categories as admin
    Given I am logged in as admin
    When I am editting category "category1"
    When I fill in "category_description" with "description1"
    When I fill in "category_permalink" with "permalink1"
    When I fill in "category_keywords" with "keyword1"
    And I press "Save"
    Then I should be on the new categories page
    Then I should see "category1"
    Then I should see "description1"
    Then I should see "permalink1"
    Then I should see "keyword1"

  Scenario: Successfully edit categories as non-admin
    Given I am logged in as not admin
    When I am editting category "category1"
    When I fill in "category_description" with "description1"
    When I fill in "category_permalink" with "permalink1"
    When I fill in "category_keywords" with "keyword1"
    And I press "Save"
    Then I should be on the new categories page
    Then I should see "category1"
    Then I should see "description1"
    Then I should see "permalink1"
    Then I should see "keyword1"
