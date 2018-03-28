@split_screen
Feature: Split-Screen Page
  In order to edit/create a Split-Screen graphic object.
  As a user, I want to navigate to Split-Screen page, using my login via the homepage
  So I can perform edit/view Split-Screen operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

  @split_view @C683403
  Scenario: View Split-Screen page via Navigation Pane
    Given ICETEA is already opened and logged in
    When I click on link "Split-Screen" in navbar
    Then I should see "Split-Screen (file ss01)" as H1 header
    And I click Logout

  @split_view_to_edit @C683404 @C683028
  Scenario: View Split-Screen page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
    Given ICETEA is already opened and logged in
    And I click on link "Split-Screen" in navbar
    And I should see "Split-Screen (file ss01)" as H1 header
    When I click "Edit" button
    And "Split-Screen (file ss01)" page should appear in EDIT mode
    Then I click "Cancel" button
    And "Split-Screen (file ss01)" page should appear in VIEW mode
    And I click Logout


  @split_edit_save @C683405 @C685335 @standalone
  Scenario: Edit Split-Screen page via home page, enter edit mode via edit button, select date picker, set time via picker, enter text and save
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Split-Screen"
    And "Split-Screen (file ss01)" page should appear in EDIT mode
    And I select date "01-JUL-2017" from day&date picker
    And I enter text "NOW" in "split-screen" time placeholder "1"
    And I select time "03:18" from time picker "2"
    And I select time "06:51" from time picker "3"
    And I enter text "COMING UP" in "split-screen" time placeholder "4"
    And I select time "15:49" from time picker "5"
    And I enter text "UP NEXT" in "split-screen" time placeholder "6"
    And I select time "19:28" from time picker "7"
    And I select time "21:37" from time picker "8"
    And I select time "23:40" from time picker "9"
    And I select time "00:59" from time picker "10"
    And I enter text "Test programme description line 1" in ProgrammeDesc "1"
    And I enter text "Test programme description line 2" in ProgrammeDesc "2"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "3"
    And I enter text "Test programme description line 4" in ProgrammeDesc "4"
    And I enter text "Test programme description line 5" in ProgrammeDesc "5"
    And I enter text "Test programme description line 6" in ProgrammeDesc "6"
    And I enter text "Test programme description line 7" in ProgrammeDesc "7"
    And I enter text "Test programme description line 8" in ProgrammeDesc "8"
    And I enter text "Test programme description line 9" in ProgrammeDesc "9"
    And I enter text "Test programme description line 10" in ProgrammeDesc "10"
    Then I click "Send" button
    And I should see "splitscreen" File Saved message for "send"
    And I set testdata with "splitscreen"
    And I expect "splitscreen" XML both node to match with testdata
    And I click Logout

  @split_exit_during_edit @C691360
  Scenario: View Split-Screen via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I click on link "Split-Screen" in navbar
    And I should see "Split-Screen (file ss01)" as H1 header
    When I click "Edit" button
    And "Split-Screen" page should appear in EDIT mode
    And I select date "15-JUN-2018" from day&date picker
    And I enter text "NOW" in "split-screen" time placeholder "1"
    And I select time "03:18" from time picker "2"
    And I enter text "COMING UP" in "split-screen" time placeholder "4"
    And I select time "15:49" from time picker "5"
    And I enter text "UP NEXT" in "split-screen" time placeholder "6"
    And I select time "19:28" from time picker "7"
    And I enter text "Test programme description line 1" in ProgrammeDesc "1"
    And I enter text "Test programme description line 2" in ProgrammeDesc "2"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "3"
    And I enter text "Test programme description line 7" in ProgrammeDesc "7"
    And I enter text "Test programme description line 8" in ProgrammeDesc "8"
    And I click on link "Home" in navbar
    Then file lock for edit message should pop up
    And I click "Close" button from pop up
    Then I click "Cancel" button
    And "Split-Screen" page should appear in VIEW mode
    And I set testdata with "splitscreen"
    And I expect "splitscreen" XML both node to match with testdata
    And I click Logout

  @split_edit_cancel @C683406
  Scenario: View Split-Screen via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Split-Screen"
    And "Split-Screen" page should appear in EDIT mode
  #  And I click "Clear All" button
    And I select date "26-JAN-2019" from day&date picker
    And I select time "06:11" from time picker "1"
    And I select time "03:25" from time picker "2"
    And I select time "17:31" from time picker "3"
    And I select time "23:02" from time picker "4"
    And I select time "07:19" from time picker "5"
    And I select time "18:06" from time picker "6"
    And I select time "16:49" from time picker "7"
    And I select time "04:37" from time picker "8"
    And I select time "00:40" from time picker "9"
    And I select time "12:26" from time picker "10"
    And I enter text "change programme description line 1" in ProgrammeDesc "1"
    And I enter text "Retesting programme description line 2" in ProgrammeDesc "2"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "3"
    And I enter text "Test programme description line 4" in ProgrammeDesc "4"
    And I enter text "Test programme description line 5" in ProgrammeDesc "5"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "6"
    And I enter text "Test programme description line 7" in ProgrammeDesc "7"
    And I enter text "Test programme description line 8" in ProgrammeDesc "8"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "9"
    And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in ProgrammeDesc "10"
    Then I click "Cancel" button
    And "Split-Screen" page should appear in VIEW mode
    And I set testdata with "splitscreen"
    And I expect "splitscreen" XML both node to match with testdata
    And I click Logout



#@split_test 
#  Scenario: Edit Split-Screen page via home page, enter edit mode via edit button, select date picker, set time via picker, enter text and save
#    And I set testdata with "splitscreen"
#    And I expect "splitscreen" XML both node to match with testdata
#    And I click Logout