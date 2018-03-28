@intro
Feature: Intro Page
  In order to edit/create a Intro graphic object.
  As a user, I want to navigate to Intro page, using my login via the homepage
  So I can perform edit/view Intro operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

    @intro_view @C683398
    Scenario: View Intro page via Navigation Pane
      Given ICETEA is already opened and logged in
      When I click on link "Intro" in navbar
      Then I should see "Intro (file in01)" as H1 header
      And I click Logout

    @intro_view_to_edit @C683399
    Scenario: View Intro page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
      Given ICETEA is already opened and logged in
      And I click on link "Intro" in navbar
      And I should see "Intro (file in01)" as H1 header
      When I click "Edit" button
      And "Intro (file in01)" page should appear in EDIT mode
      Then I click "Cancel" button
      And "Intro (file in01)" page should appear in VIEW mode
      And I click Logout


    @intro_edit_save @C683400 @C685339 @C683034
    Scenario: Edit Intro page via home page, enter edit mode via edit button, enter text and save
      Given ICETEA is already opened and logged in
      And I click on link "Home" in navbar
      And I should see "Home" as H1 header
      When I click on "Edit" associated to "Intro"
      And "Intro (file in01)" page should appear in EDIT mode
      #And I click "Clear All" button
      And I enter text "Test Intro title input" in intro title
      And I enter text "Test Intro text input line 1" in inputText field "1"
      And I enter text "Test Intro text input line 2" in inputText field "2"
      And I enter text "Test Intro text input line 3" in inputText field "3"
      And I enter text "Test Intro text input line 4" in inputText field "4"
      And I enter text "Test Intro text input line 5" in inputText field "5"
      And I enter text "Test Intro text input line 6" in inputText field "6"
      And I enter text "Test Intro text input line 7" in inputText field "7"
      And I enter text "Test Intro text input line 8" in inputText field "8"
      And I enter text "Test Intro text input line 9" in inputText field "9"
      And I enter text "Test Intro text input line 10" in inputText field "10"
      #And I enter text "Test Intro text input line 11" in inputText field "11"
      #And I enter text "Test Intro text input line 12" in inputText field "12"
      #Then I click "Save" button
      Then I click "Send" button
      And I should see "introduction" File Saved message for "send"
#      And I expect "introduction" XML both node to match with:
      And I expect "in01" XML both node to match with:
      """
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <rss>
          <text>Test Intro title input

      Test Intro text input line 1
      Test Intro text input line 2
      Test Intro text input line 3
      Test Intro text input line 4
      Test Intro text input line 5
      Test Intro text input line 6
      Test Intro text input line 7
      Test Intro text input line 8
      Test Intro text input line 9
      Test Intro text input line 10</text>
      </rss>
      """
      And I click Logout

  @intro_exit_during_edit @C690936
    Scenario: View Intro via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
      Given ICETEA is already opened and logged in
      And I click on link "Home" in navbar
      And I click on link "Intro" in navbar
      And I should see "Intro (file in01)" as H1 header
      When I click "Edit" button
      #And I click "Clear All" button
      And I enter text "....retest cancel input" in intro title
      And I enter text "....retest cancel input line 1" in inputText field "1"
      And I enter text "....retest cancel input line 2" in inputText field "2"
      And I enter text "....retest cancel input line 3" in inputText field "3"
      And I enter text "....retest cancel input line 4" in inputText field "4"
      And I enter text "....retest cancel input line 5" in inputText field "5"
      And I enter text "....retest cancel input line 6" in inputText field "6"
      And I enter text "....retest cancel input line 7" in inputText field "7"
      And I enter text "....retest cancel input line 8" in inputText field "8"
      And I enter text "....retest cancel input line 9" in inputText field "9"
      And I enter text "....retest cancel input line 10" in inputText field "10"
      #And I enter text "....retest cancel input line 11" in inputText field "11"
      #And I enter text "....retest cancel input line 12" in inputText field "12"
      And I click on link "Home" in navbar
      Then file lock for edit message should pop up
      And I click "Close" button from pop up
      And I click "Cancel" button
      And "Intro (file in01)" page should appear in VIEW mode
#      And I expect "introduction" XML both node to match with:
      And I expect "in01" XML both node to match with:
      """
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <rss>
          <text>Test Intro title input

      Test Intro text input line 1
      Test Intro text input line 2
      Test Intro text input line 3
      Test Intro text input line 4
      Test Intro text input line 5
      Test Intro text input line 6
      Test Intro text input line 7
      Test Intro text input line 8
      Test Intro text input line 9
      Test Intro text input line 10</text>
      </rss>
      """
      And I click Logout

  @intro_edit_cancel @C683401
    Scenario: View Intro via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
      Given ICETEA is already opened and logged in
      And I click on link "Intro" in navbar
      And I should see "Intro (file in01)" as H1 header
      When I click "Edit" button
      #And I click "Clear All" button
      And I enter text "....retest cancel input" in intro title
      And I enter text "....retest cancel input line 1" in inputText field "1"
      And I enter text "....retest cancel input line 2" in inputText field "2"
      And I enter text "....retest cancel input line 3" in inputText field "3"
      And I enter text "....retest cancel input line 4" in inputText field "4"
      And I enter text "....retest cancel input line 5" in inputText field "5"
      And I enter text "....retest cancel input line 6" in inputText field "6"
      And I enter text "....retest cancel input line 7" in inputText field "7"
      And I enter text "....retest cancel input line 8" in inputText field "8"
      And I enter text "....retest cancel input line 9" in inputText field "9"
      And I enter text "....retest cancel input line 10" in inputText field "10"
      #And I enter text "....retest cancel input line 11" in inputText field "11"
      #And I enter text "....retest cancel input line 12" in inputText field "12"
      Then I click "Cancel" button
#      And I expect "introduction" XML both node to match with:
      And I expect "in01" XML both node to match with:
      """
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <rss>
          <text>Test Intro title input

      Test Intro text input line 1
      Test Intro text input line 2
      Test Intro text input line 3
      Test Intro text input line 4
      Test Intro text input line 5
      Test Intro text input line 6
      Test Intro text input line 7
      Test Intro text input line 8
      Test Intro text input line 9
      Test Intro text input line 10</text>
      </rss>
      """
      And I click Logout
 #     Then I close browser
