@ticker
Feature: Ticker Page
  In order to edit/create a ticker graphic object.
  As a user, I want to navigate to ticker page, using my login via the homepage
  So I can perform edit/view ticker operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

@ticker_view @C683346
Scenario: View Ticker page via Navigation Pane
  Given I open browser to "ICETEA1"
  Given ICETEA is already opened and logged in
  When I click on link "Ticker" in navbar
  Then I should see "Ticker" as H1 header
  And I click Logout

  @ticker_view_to_edit @C683334
Scenario: View Ticker page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
  Given ICETEA is already opened and logged in
  And I click on link "Ticker" in navbar
  And I should see "Ticker" as H1 header
  When I click "Edit" button
  And "Ticker" page should appear in EDIT mode
  Then I click "Cancel" button
  And "Ticker" page should appear in VIEW mode
  And I click Logout

@ticker_edit_save @C683347 @C685333
Scenario: Edit Ticker page via home page, enter edit mode via edit button, enter text and save
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "Edit" associated to "Ticker"
  And "Ticker" page should appear in EDIT mode
  #And I click "Clear All" button
  And I enter text "Test edit ticker save" in ticker text
  And I click "Live" button
  Then I click "Save" button
  And I should see "Ticker" File Saved message for "save"
  And I expect "ticker" XML both node to match with:
  """
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <rss>
      <text>Test edit ticker save</text>
  </rss>
  """
  And I click Logout


@ticker_exit_during_edit @C690940
Scenario: View ticker via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I click on link "Ticker" in navbar
  And I should see "Ticker" as H1 header
  When I click "Edit" button
  And I enter text " ... this is a new line, should clear after cancel" in ticker text
  And I click on link "Home" in navbar
  Then file lock for edit message should pop up
  And I click "Close" button from pop up
  And I click "Cancel" button
  And "Ticker" page should appear in VIEW mode
  And I expect "ticker" XML both node to match with:
  """
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <rss>
      <text>Test edit ticker save</text>
  </rss>
  """
  And I click Logout


  @ticker_edit_cancel @C683335
Scenario: View Ticker page via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
  Given ICETEA is already opened and logged in
  And I click on link "Ticker" in navbar
  And I should see "Ticker" as H1 header
  When I click "Edit" button
 # And I click "Clear All" button
  And I enter text " ... this is a new line, should clear after cancel" in ticker text
  Then I click "Cancel" button
  And "Ticker" page should appear in VIEW mode
  And I expect "ticker" XML both node to match with:
  """
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <rss>
      <text>Test edit ticker save</text>
  </rss>
  """
  And I click Logout
#  Then I close browser
