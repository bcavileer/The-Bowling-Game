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
    When I bowl a spare followed by two 1's
    Then my score should be 13

  Scenario: bowls a strike
    When I bowl a strike followed by two 1's
    Then my score should be 14

  Scenario: bowls a spare in the 10th frame
    When I bowl 18 zeroes
    And I bowl a spare followed by two 1's
    Then my score should be 13

  Scenario: bowls a strike in the 10th frame
    When I bowl 18 zeroes
    And I bowl a strike followed by two 1's
    Then my score should be 14
