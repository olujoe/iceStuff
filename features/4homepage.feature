@home
Feature: ICETEA Home Page
  In order to navigate to other ICETEA pages
  As a user, I want to navigate to each ICETEA's page, using my login via the homepage
  So I can perform edit/view operation.

Background:
  Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in

@Logout @C683333
Scenario: Logout
  Given I open browser to "ICETEA1"
  And ICETEA is already opened and logged in
  Then I click Logout

@TickerView @C683025
Scenario: View Ticker page via Home page link View
  Given I open browser to "ICETEA1"
  And ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Ticker"
  Then "Ticker" page should appear in VIEW mode
  And I should see "Ticker Text" appear in main page
  And I click Logout

@TickerEdit @C683024
Scenario: Edit Ticker page via Home page link Edit
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "Edit" associated to "Ticker"
  Then "Ticker" page should appear in EDIT mode
  And I click "Cancel" button
  And "Ticker" page should appear in VIEW mode
  And I click Logout

@BreakingNewsView @C683027
Scenario: View BreakingNews page via Home page link View
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Breaking News"
  Then "Breaking News (file bn01)" page should appear in VIEW mode
  And I should see "Headline" appear in main page
  And I click Logout

#@BreakingNewsEdit @C683026
#Scenario: Edit BreakingNews page via Home page link Edit
#  Given ICETEA is already opened and logged in
#  And I click on link "Home" in navbar
#  And I should see "Home" as H1 header
#  When I click on "Edit" associated to "Breaking News"
#  Then "Breaking News (file bn01)" page should appear in EDIT mode
#  And I click "Cancel" button
#  And "Breaking News" page should appear in VIEW mode
#  And I click Logout

@SplitScreenView @C683029
Scenario: View SplitScreen page via Home page link View
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Split-Screen"
  Then "Split-Screen (file ss01)" page should appear in VIEW mode
  And I should see "Day &amp; Date" appear in main page
  And I click Logout

#@SplitScreenEdit @C683028
#Scenario: Edit SplitScreen page via Home page link Edit
#  Given ICETEA is already opened and logged in
#  And I click on link "Home" in navbar
#  And I should see "Home" as H1 header
#  When I click on "Edit" associated to "Split-Screen"
#  Then "Split-Screen (file ss01)" page should appear in EDIT mode
#  And I click "Cancel" button
#  And "Split-Screen (file ss01)" page should appear in VIEW mode
#  And I click Logout

@MenuView @C683031
Scenario: View Menu page via Home page link View
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Menu"
  Then "Menu (file mu01)" page should appear in VIEW mode
  #And I should see "Load Menu" appear in main page
  And I should see "Load From..." appear in main page
  And I click Logout

@MenuEdit @C683030
Scenario: Edit Menu page via Home page link Edit
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "Edit" associated to "Menu"
  Then "Menu" page should appear in EDIT mode
  And I click "Cancel" button
  And "Menu (file mu01)" page should appear in VIEW mode
  And I click Logout


@DivisionView @C683033
Scenario: View Division page via Home page link View
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Division"
  Then "Division (file dv01)" page should appear in VIEW mode
  And I should see "Division Text" appear in main page
  And I click Logout

#@DivisionEdit @C683032
#Scenario: Edit Division page via Home page link Edit
#  Given ICETEA is already opened and logged in
#  And I click on link "Home" in navbar
#  And I should see "Home" as H1 header
#  When I click on "Edit" associated to "Division"
#  Then "Division (file dv01)" page should appear in EDIT mode
#  And I click "Cancel" button
#  And "Division (file dv01)" page should appear in VIEW mode
#  And I click Logout

@IntroView @C683035
Scenario: View Intro page via Home page link View
  Given ICETEA is already opened and logged in
  And I click on link "Home" in navbar
  And I should see "Home" as H1 header
  When I click on "VIEW" associated to "Intro"
  Then "Intro" page should appear in VIEW mode
  And I should see "Intro Title" appear in main page
  And I click Logout

#@IntroEdit @C683034
#Scenario: Edit Intro page via Home page link Edit
#  Given ICETEA is already opened and logged in
#  And I click on link "Home" in navbar
#  And I should see "Home" as H1 header
#  When I click on "Edit" associated to "Intro"
#  Then "Intro (file in01)" page should appear in EDIT mode
#  And I click "Cancel" button
#  And "Intro (file in01)" page should appear in VIEW mode
#  And I click Logout
#  Then I close browser
