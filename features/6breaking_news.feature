@breaking_news
Feature: Breaking News Page
  In order to edit/create a Breaking News graphic object.
  As a user, I want to navigate to Breaking News page, using my login via the homepage
  So I can perform edit/view Breaking News operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

  @breaking_view @C683336 @C683026
  Scenario: View Breaking News page via Navigation Pane
    #Given I open browser to "ICETEA1"
    Given ICETEA is already opened and logged in
    When I click on link "Breaking News" in navbar
    Then I should see "Breaking News (file bn01)" as H1 header
    And I click Logout

  @breaking_view_to_edit @C683360
  Scenario: View Breaking News page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
    Given ICETEA is already opened and logged in
    And I click on link "Breaking News" in navbar
    And I should see "Breaking News (file bn01)" as H1 header
    When I click "Edit" button
    And "Breaking News (file bn01)" page should appear in EDIT mode
    Then I click "Cancel" button
    And "Breaking News (file bn01)" page should appear in VIEW mode
    And I click Logout

  @breaking_edit_save @C683361 @C685334
  Scenario: Edit Breaking News page via home page, enter edit mode via edit button, enter text and save
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Breaking News"
    And "Breaking News (file bn01)" page should appear in EDIT mode
    #And I click "Clear All" button
    And I enter text "Test Breaking News Headline" in headline
    And I enter text "Test Breaking News Line One" in description line "1"
    And I enter text "Test Breaking News Line Two" in description line "2"
    And I enter text "Test Breaking News Line Three" in description line "3"
    #Then I click "Save" button
    Then I click "Send" button
    And I should see "Breaking News (file bn01)" File Saved message for "send"
    And I expect "breaking_news" XML both node to match with:
    """
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <rss>
        <text>Test Breaking News Line One
    Test Breaking News Line Two
    Test Breaking News Line Three</text>
        <time>Test Breaking News Headline</time>
    </rss>
    """
    And I click Logout

  @breaking_exit_during_edit @C690939
  Scenario: View Brekaing News via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I click on link "Breaking News" in navbar
    And I should see "Breaking News (file bn01)" as H1 header
    When I click "Edit" button
    #And I click "Clear All" button
    And I enter text "RETEST Breaking News Headline" in headline
    And I enter text "RETest Breaking News Line One" in description line "1"
    And I enter text "RETest Breaking News Line Two" in description line "2"
    And I enter text "RETest Breaking News Line Three" in description line "3"
    And I click on link "Home" in navbar
    Then file lock for edit message should pop up
    And I click "Close" button from pop up
    And I click "Cancel" button
    And "Breaking News (file bn01)" page should appear in VIEW mode
    And I expect "breaking_news" XML both node to match with:
    """
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <rss>
        <text>Test Breaking News Line One
    Test Breaking News Line Two
    Test Breaking News Line Three</text>
        <time>Test Breaking News Headline</time>
    </rss>
    """
   And I click Logout

  @breaking_edit_cancel @C683362
  Scenario: View Breaking News via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Breaking News" in navbar
    And I should see "Breaking News (file bn01)" as H1 header
    When I click "Edit" button
    And I enter text " ... this is a new line, should clear after cancel" in headline
    And I enter text " ... this is a new line, should clear after cancel" in description line "1"
    And I enter text " ... this is a new line, should clear after cancel" in description line "2"
    Then I click "Cancel" button
    And I expect "breaking_news" XML both node to match with:
    """
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <rss>
        <text>Test Breaking News Line One
    Test Breaking News Line Two
    Test Breaking News Line Three</text>
        <time>Test Breaking News Headline</time>
    </rss>
    """
    And I click Logout
#    Then I close browser
