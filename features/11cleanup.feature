@cleanup
Feature: Clean up
  Run post-test clean up, remove mount via Windows bat script.

  Scenario: Remove mount
    When I run bat file "unmount"
