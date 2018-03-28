@division
Feature: Division Page
  In order to edit/create a Division graphic object.
  As a user, I want to navigate to Division page, using my login via the homepage
  So I can perform edit/view Division operations.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

    @division_view @C683393
    Scenario: View Division page via Navigation Pane
      Given ICETEA is already opened and logged in
      When I click on link "Division" in navbar
      Then I should see "Division (file dv01)" as H1 header
      And I click Logout

    @division_view_to_edit @C683394 @C683032
    Scenario: View Divisions page via Navigation Pane, enter edit mode via edit button, cancel goes back to view mode
      Given ICETEA is already opened and logged in
      And I click on link "Division" in navbar
      And I should see "Division (file dv01)" as H1 header
      When I click "Edit" button
      And "Division (file dv01)" page should appear in EDIT mode
      Then I click "Cancel" button
      And "Division (file dv01)" page should appear in VIEW mode
      And I click Logout

      @division_edit_save @C683395 @C685338
      Scenario: Edit Division page via home page, enter edit mode via edit button, enter text and save
        Given ICETEA is already opened and logged in
        And I click on link "Home" in navbar
        And I should see "Home" as H1 header
        When I click on "Edit" associated to "Division"
        And "Division (file dv01)" page should appear in EDIT mode
        #And I click "Clear All" button
        And I enter text "Test Division description line 1" in division text line "1"
        And I enter text "Test Division description line 2" in division text line "2"
        And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in division text line "3"
        And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in division text line "4"
        And I enter text "Test Division description line 5" in division text line "5"
        And I enter text "Test Division description line 6" in division text line "6"
        And I enter text "Test Division description line 7" in division text line "7"
        And I enter text "Test Division description line 8" in division text line "8"
        And I enter text "Test Division description line 9" in division text line "9"
        And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in division text line "10"
        And I enter text ",./;'#[]1234567890-=`¬!@£$^%^&*()_+{}:~<>?|" in division text line "11"
        And I enter text "Test Division description line 12" in division text line "12"
        #Then I click "Save" button
        Then I click "Send" button
        And I should see "Division" File Saved message for "send"
        And I expect "division" XML both node to match with:
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <rss>
            <text>Test Division description line 1
        Test Division description line 2
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        Test Division description line 5
        Test Division description line 6
        Test Division description line 7
        Test Division description line 8
        Test Division description line 9
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        Test Division description line 12</text>
        </rss>
        """
        And I click Logout

      @division_exit_during_edit @C690903
      Scenario: View Division via Navigation Pane, enter edit mode via edit button, attempt to navigate elsewhere via navigation bar and press cancel.
        Given ICETEA is already opened and logged in
        And I click on link "Home" in navbar
        And I click on link "Division" in navbar
        And I should see "Division (file dv01)" as H1 header
        When I click "Edit" button
        And "Division (file dv01)" page should appear in EDIT mode
        #And I click "Clear All" button
        And I enter text "changing text in line 1... cancel" in division text line "1"
        And I enter text "changing text in line 2... cancel" in division text line "2"
        And I enter text "changing text in line 3... cancel" in division text line "3"
        And I enter text "changing text in line 4... cancel" in division text line "4"
        And I click on link "Home" in navbar
        Then file lock for edit message should pop up
        And I click "Close" button from pop up
        And I click "Cancel" button
        And "Division (file dv01)" page should appear in VIEW mode
        And I expect "division" XML both node to match with:
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <rss>
            <text>Test Division description line 1
        Test Division description line 2
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        Test Division description line 5
        Test Division description line 6
        Test Division description line 7
        Test Division description line 8
        Test Division description line 9
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
        Test Division description line 12</text>
        </rss>
        """
        And I click Logout

  @division_edit_cancel @C683396
    Scenario: View Division via Navigation Pane, enter edit mode via edit button, enter text and press cancel.
      Given ICETEA is already opened and logged in
      And I click on link "Division" in navbar
      And I should see "Division (file dv01)" as H1 header
      When I click "Edit" button
      #And I click "Clear All" button
      And I enter text "changing text in line 1... cancel" in division text line "1"
      And I enter text "changing text in line 2... cancel" in division text line "2"
      And I enter text "changing text in line 3... cancel" in division text line "3"
      And I enter text "changing text in line 4... cancel" in division text line "4"
      And I enter text "changing text in line 5... cancel" in division text line "5"
      And I enter text "changing text in line 6... cancel" in division text line "6"
      And I enter text "changing text in line 7... cancel" in division text line "7"
      And I enter text "changing text in line 8... cancel" in division text line "8"
      And I enter text "changing text in line 9... cancel" in division text line "9"
      And I enter text "changing text in line 10... cancel" in division text line "10"
      And I enter text "changing text in line 11... cancel" in division text line "11"
      And I enter text "changing text in line 12... cancel" in division text line "12"
      Then I click "Cancel" button
      And I expect "division" XML both node to match with:
      """
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <rss>
          <text>Test Division description line 1
      Test Division description line 2
      ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
      ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
      Test Division description line 5
      Test Division description line 6
      Test Division description line 7
      Test Division description line 8
      Test Division description line 9
      ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
      ,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
      Test Division description line 12</text>
      </rss>
      """
      And I click Logout
 #     Then I close browser
