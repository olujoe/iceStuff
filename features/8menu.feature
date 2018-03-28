@menu
Feature: Menu Page
  In order to edit/create a Menu graphic object.
  As a user, I want to navigate to Menu page, using my login via the homepage
  So I can perform edit/view Menu operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

  @menu_view @C683410
  Scenario: View Menu page via Navigation Pane
    Given I open browser to "ICETEA1"
    Given ICETEA is already opened and logged in
    When I click on link "Menu" in navbar
    Then I should see "Menu (file mu01)" as H1 header
    And I click Logout

  @menu_view_to_edit @C683411
  Scenario: View Menu page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
    Given ICETEA is already opened and logged in
    And I click on link "Menu" in navbar
    And I should see "Menu (file mu01)" as H1 header
    When I click "Edit" button
    And "Menu" page should appear in EDIT mode
    Then I click "Cancel" button
    And "Menu" page should appear in VIEW mode
    And I click Logout

  @menu_edit_save @C683412 @C685336
  Scenario: Edit Menu page via home page, enter edit mode via edit button, select date picker, set time via picker, enter text and save
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Menu"
    And "Menu" page should appear in EDIT mode
    And I select date "20-DEC-1990" from day&date picker
    And I select time "01:00" from time picker "1"
    And I select time "03:18" from time picker "2"
    And I select time "06:51" from time picker "3"
    And I select time "11:37" from time picker "4"
    And I select time "15:49" from time picker "5"
    And I select time "17:06" from time picker "6"
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
    Then I click "Save" button
    And I should see "mu01" File Saved message for "save"
    And I set testdata with "mu01"
    And I expect "mu01" XML both node to match with testdata
    And I click Logout

  @menu_exit_during_edit @C691361
  Scenario: View Menu via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I click on link "Menu" in navbar
    And I should see "Menu (file mu01)" as H1 header
    When I click "Edit" button
    And "Menu" page should appear in EDIT mode
    And I select date "13-NOV-2011" from day&date picker
    And I select time "06:11" from time picker "1"
    And I select time "17:31" from time picker "3"
    And I select time "07:19" from time picker "5"
    And I enter text "COPY MENU programme description line 1" in ProgrammeDesc "1"
    And I enter text "COPY MENU programme description line 2" in ProgrammeDesc "2"
    And I enter text "COPY MENU programme description line 3" in ProgrammeDesc "3"
    And I enter text "COPY MENU programme description line 4" in ProgrammeDesc "4"
    And I enter text "COPY MENU programme description line 5" in ProgrammeDesc "5"
    And I click on link "Home" in navbar
    Then file lock for edit message should pop up
    And I click "Close" button from pop up
    And I click "Cancel" button
    And "Menu" page should appear in VIEW mode
    And I set testdata with "mu01"
    And I expect "mu01" XML both node to match with testdata
    And I click Logout

  @menu_edit_cancel @C683413
  Scenario: View Menu via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Menu"
    And "Menu" page should appear in EDIT mode
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
    And "Menu" page should appear in VIEW mode
    And I set testdata with "mu01"
    And I expect "mu01" XML both node to match with testdata
    And I click Logout


  @menu_edit_save_other @C691330
  Scenario: View Menu via Navigation Pane, enter edit mode via edit button, select a menu via drop down, fill in detail and save
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Menu"
    And "Menu" page should appear in EDIT mode
    And I select "Menu 14" from menu dropdown
    And I select date "26-JAN-2019" from day&date picker
    And I select time "06:11" from time picker "1"
    And I select time "03:25" from time picker "2"
    And I enter text "NOW" in "menu" time placeholder "3"
    And I select time "23:02" from time picker "4"
    And I select time "07:19" from time picker "5"
    And I enter text "UP NEXT" in "menu" time placeholder "6"
    And I select time "16:49" from time picker "7"
    And I select time "04:37" from time picker "8"
    And I enter text "LATER" in "menu" time placeholder "9"
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
    Then I click "Save" button
    And I should see "mu14" File Saved message for "save"
    And I set testdata with "mu14"
    And I expect "mu14" XML both node to match with testdata
    And I click Logout

  @menu_edit_save_to_another_menu @C683417
  Scenario: View Menu via Navigation Pane, enter edit mode via edit button, select a menu via drop down, fill in detail to save and save it to another menu
    Given ICETEA is already opened and logged in
    And I click on link "Home" in navbar
    And I should see "Home" as H1 header
    When I click on "Edit" associated to "Menu"
    And "Menu" page should appear in EDIT mode
    And I select "Menu 9" from menu dropdown
    And I select date "11-AUG-2023" from day&date picker
    And I select time "06:11" from time picker "1"
    And I select time "04:37" from time picker "2"
    And I select time "17:31" from time picker "3"
    And I select time "03:25" from time picker "4"
    And I select time "07:19" from time picker "5"
    And I select time "18:06" from time picker "6"
    And I select time "16:49" from time picker "7"
    And I select time "23:02" from time picker "8"
    And I select time "00:40" from time picker "9"
    And I select time "12:26" from time picker "10"
    And I enter text "COPY MENU programme description line 1" in ProgrammeDesc "1"
    And I enter text "COPY MENU programme description line 2" in ProgrammeDesc "2"
    And I enter text "COPY MENU programme description line 3" in ProgrammeDesc "3"
    And I enter text "COPY MENU programme description line 4" in ProgrammeDesc "4"
    And I enter text "COPY MENU programme description line 5" in ProgrammeDesc "5"
    And I enter text "COPY MENU programme description line 6" in ProgrammeDesc "6"
    And I enter text "COPY MENU programme description line 7" in ProgrammeDesc "7"
    And I enter text "COPY MENU programme description line 8" in ProgrammeDesc "8"
    And I enter text "COPY MENU programme description line 9" in ProgrammeDesc "9"
    And I enter text "COPY MENU programme description line 10" in ProgrammeDesc "10"
    And I click "Save" button
    And I should see "mu09" File Saved message for "save"
    And I set testdata with "mu09"
    And I expect "mu09" XML both node to match with testdata
    Then I click "Edit" button
    And "Menu" page should appear in EDIT mode
    And I select "Menu 16" from save to menu dropdown
    And I click "Save" button
    And I should see "mu16" File Saved message for "save"
    And I set testdata with "mu16"
    And I expect "mu16" XML both node to match with testdata
    And I click Logout
#    Then I close browser
