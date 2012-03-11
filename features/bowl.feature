Feature: Bowl a Game
  In order to have a fun game of bowling
  As a bowler
  I want to bowl a game and get my score

  Background:
    Given I have a lane

  Scenario: bowls an all zeroes game
    When I bowl all zeroes
    Then my score should be 0

  Scenario: bowls an all ones game
    When I bowl all ones
    Then my score should be 20

  Scenario: bowls a spare
    When I bowl a spare
    And I bowl a one
    Then my score should be 13

  Scenario: bowls a strike
    When I bowl a strike
    And I bowl 2 ones
    Then my score should be 14

  Scenario: bowls a spare in the 10th frame
    When I bowl 18 zeroes
    And I bowl a spare
    And I bowl a one
    Then my score should be 12

  Scenario: bowls a strike in the 10th frame
    When I bowl 18 zeroes
    And I bowl a strike
    And I bowl 2 ones
    Then my score should be 12

  Scenario: bowls a perfect game
    When I bowl a perfect game
    Then my score should be 300
