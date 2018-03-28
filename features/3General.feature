@general
Feature: ICETEA General
  In order to explore ICETEA functionality
  As a national user, I want to navigate to each ICETEA's page, using my login

Background:
  Given I open browser to "ICETEA1"

@general_delete_xml @C683392
Scenario: ssh test
  Given I delete all output files in "icetea1"
  Given I delete all output files in "icetea2"

@ignore @loginfail @C690935
Scenario: login Fail
  #Given I open browser to "ICETEA1"
  When I use incorrect credentials to login
  And I click Sign in
  Then I should see login fail message

@ignore @login @C683013
Scenario: View home page by login
  #Given I open browser to "ICETEA1"
  When I use correct credentials to login
  And I click Sign in
  Then I should see "Home" as H1 header

@ticker_main @C683016
Scenario: View Ticker page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Ticker" in navbar
  Then I should see "Ticker" as H1 header

@breaking_main @C683017
Scenario: View Breaking News page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Breaking News" in navbar
  Then I should see "Breaking News (file bn01)" as H1 header

@splitscreen_main @C683018
Scenario: View split screen page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Split-Screen" in navbar
  Then I should see "Split-Screen (file ss01)" as H1 header

@menu_main @C683019
Scenario: View Menu page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Menu" in navbar
  Then I should see "Menu (file mu01)" as H1 header

@division_main @C683020
Scenario: View Division page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Division" in navbar
  Then I should see "Division (file dv01)" as H1 header

@intro_main @C683021
Scenario: View Intro page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Intro" in navbar
  Then I should see "Intro (file in01)" as H1 header

@general_home @C683015
Scenario: View Home page via Navigation Pane
  Given ICETEA is already opened and logged in
  When I click on link "Home" in navbar
  Then I should see "Home" as H1 header

#@ignore @logout @C683333
#Scenario: Logout via Navigation Pane
#  Given ICETEA is already opened and logged in
#  When I click on link "Logout" in navbar
#  Then I should see "Sign in to continue to BBC Parliament Text ICE Editor" as H1 header
  And I close browser

