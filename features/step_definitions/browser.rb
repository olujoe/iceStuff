When (/^I wait for "(.*?)" seconds$/) do |time|
	sleep(time.to_i)
end

Given (/^ICETEA is already opened and logged in$/) do
	linkno = rand(1..2)
	if linkno == 1
		weblink = $config["icetea1"]
	elsif linkno == 2
		weblink = $config["icetea2"]
	end
			if $browser_type == "chrome"
				begin
						if $driver.current_url.include? $config["iceteaurl"]
							puts "Reuse exisitng Browser session"
						else
							 browser(weblink)
						end
				rescue
					newbrowser
					retry
				end
			else
				begin
					if $driver.current_url.include? $config["iceteaurl"]
			      puts "Reuse exisitng Browser session"
			    else
			       browser(weblink)
			       signin()
			       step 'I click Sign in'
			    end
				rescue
					newbrowser
					retry
				end
			end
  end

When (/^I run bat file "(.*?)"$/) do |batfile|
	commandp = "C:/WINDOWS/System32/cmd.exe"
	$windowsBAT = File.dirname(__FILE__) + "/../support/WindowsBAT/"
	filepath = "#{$windowsBAT}#{batfile}.bat"
	system('cmd.exe', '/C', filepath)

end

Given(/^I open browser to "([^"]*)"$/) do |site|
  case site.downcase
    when 'icetea1'
      weblink = $config["icetea1"]
    when 'icetea2'
      weblink = $config["icetea2"]
  end
  if $browser_type == "chrome"
    begin
      if $driver.current_url.include? $config["iceteaurl"]
        puts "Reuse exisitng Browser session"
      else
        browser(weblink)
      end
    rescue
      newbrowser
      retry
    end
  else
    begin
      if $driver.current_url.include? $config["iceteaurl"]
        puts "Reuse exisitng Browser session"
      else
        browser(weblink)
      end
    rescue
      newbrowser
      retry
    end
  end
end

Then(/^I close browser$/) do
  closebrowser
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |key, value|
    input = $wait.until {
    element = $driver.find_element(:name, key)
    element if element.displayed?
  }
  input.send_keys(value)
end

When(/^I click Sign in$/) do
  signinbutton()
end

When(/^I click Logout$/) do
  logoutbutton()
end

When (/^I use correct credentials to login$/) do
  steps %Q{
      When I fill in "username" with "ogunbo02"
      And I fill in "password" with "Olubbc067"
  }
end

When (/^I use incorrect credentials to login$/) do
  steps %Q{
      When I fill in "username" with "tsangb01"
      And I fill in "password" with "wrongpassword"
  }
end

Then(/^I should see "(.*?)" as H1 header$/) do |text|
  puts "Test Passed: #{text} appeared as H1 title" if $wait.until {
    $driver.find_element(:tag_name, 'h1').text == text
}
  #takescreenshot()
end

Then (/^I should see login fail message$/) do
  if $wait.until {
    $driver.find_element(:id, 'login-alert').text == 'Login failed'
    }
    #takescreenshot()
    puts "Test Passed - Login fail message appeared"
  else
    fail "Test failed - Unable to locate Login fail message"
  end
end

When(/^I click on link "(.*?)" in navbar$/) do |object|
	item = $wait.until {
	element = $driver.find_element(:link_text, object)
	element if element.displayed?
}
item.click
end

When (/^I click on "(.*?)" associated to "(.*?)"$/) do |option, page|

  case page.downcase
  when 'ticker'
		editlink = '/ticker/edit'
		viewlink = '/ticker'
  when 'breaking news'
    editlink = '/breaking-news/edit'
		viewlink = '/breaking-news'
  when 'split-screen'
		editlink = '/split-screen/edit'
		viewlink = '/split-screen'
  when 'menu'
		editlink = '/menu/edit'
		viewlink = '/menu'
  when 'division'
		editlink = '/division/edit'
		viewlink = '/division'
  when 'intro'
		editlink = '/intro/edit'
		viewlink = '/intro'
  end
      if option.downcase == 'view'
        view(viewlink)
      elsif option.downcase == 'edit'
        edit(editlink)
      else
        puts 'Option not defined, check feature file!'
      end
end

Then (/^"(.*?)" page should appear in VIEW mode$/) do |page|
  if page.downcase == 'ticker' ||  page.downcase == 'split-screen'  || page.downcase == 'division' || page.downcase == 'breaking news' || page.downcase == 'menu' || page.downcase == 'intro'
    fail "Test Failed: Unable to locate #{page} as H1 title, in VIEW mode" unless $driver.find_element(:tag_name, 'h1').text.include? page
    fail "Test Failed: Unable to loacte Edit Button, in VIEW mode" unless $driver.find_element(:class, 'btn-lg').text == 'Edit'
  else
    puts 'The page is not configured, refer to feature'
  end
end

Then (/^"(.*?)" page should appear in EDIT mode$/) do |page|
  case page.downcase
  when 'ticker'
    reg = /Ticker Text/
  when 'split-screen'
    reg = /Programme Description/
  when 'division'
    reg = /Division Text/
  when 'breaking news'
    reg = /Headline/
  when 'menu'
  #  reg = /Load Menu/
    reg = /Load From.../
  when 'intro'
    reg = /Intro Title/
  end
	#binding.pry
	if $browser_type == "chrome"
		sleep(1)
		fail "Test Failed: Cannot find Successfully locked file" unless $driver.find_element(:class, 'alert-success').text.include? "Successfully locked file (by user #{$config["username"]})"
	else
		sleep(1)
		fail "Test Failed: Cannot find Successfully locked file" unless $driver.find_element(:class, 'alert-success').text.include? "Successfully locked file (by user #{$config["fullname"]})"
	end
	fail "Test Fail: Unable to locate #{page} as H1 title, in EDIT mode" unless $driver.find_element(:tag_name, 'h1').text.include? page
#  fail "Test Fail: Unable to locate #{reg} in #{page}, in EDIT mode" unless reg.match($driver.page_source)
  fail "Test Fail: Unable to locate #{reg} in #{page}, in EDIT mode" unless $driver.page_source[/#{reg}/]
end

Then (/^I should see "(.*?)" appear in main page$/) do |text|
  puts "Test Passed: #{text} appeared in main page" if $wait.until {
   check = Regexp.new text
   check.match($driver.page_source)
 }
end

When(/^I click "(.*?)" button$/) do |function|
  clickbutton(function)
  sleep 2
end

When (/^I click "(.*?)" button from pop up$/) do |function|
  clickpopupbutton(function)
end

When(/^I enter text "([^"]*)" in ticker text$/) do |textinput|
  entertickertext(textinput)
end

When(/^I enter text "([^"]*)" in headline$/) do |textinput|
  enterheadline(textinput)
end

When(/^I enter text "([^"]*)" in description line "([^"]*)"$/) do |textinput, line|
  enterdescription(textinput, line)
end

When(/^I enter text "([^"]*)" in division text line "([^"]*)"$/) do |textinput, line|
  enterdivision(textinput, line)
end

When(/^I enter text "([^"]*)" in intro title$/) do |textinput|
  enterinputtitle(textinput)
end

When(/^I enter text "([^"]*)" in inputText field "([^"]*)"$/) do |textinput, line|
  enterinputText(textinput, line)
end

When(/^I enter text "([^"]*)" in ProgrammeDesc "([^"]*)"$/) do |textinput, line|
  enterinputProgrammeDesc(textinput, line)
end

When(/^I enter text "([^"]*)" in "([^"]*)" time placeholder "([^"]*)"$/) do |textinput, screen, line|
    if screen.downcase == "split-screen"
          if line.to_i.between?(1, 10)
            entertextintimeplaceholder(textinput, line)
          else
            fail "Only 10 time boxes are provided in Split-screen!!!"
          end
    elsif screen.downcase == "menu"
      if line.to_i.between?(1, 10)
        newline = line.to_i + 1
        entertextintimeplaceholder(textinput, newline)
      else
        fail "Only 10 time boxes are provided in Menu!!!"
      end
    end
  #sleep 5
end

When(/^I select "([^"]*)" from menu dropdown$/) do |menu|
  selectmenu(menu)
end

When(/^I select "([^"]*)" from save to menu dropdown$/) do |menu|
  selectsavetomenu(menu)
end

#only used when rsync is turned OFF!!!
Then(/^I expect "([^"]*)" XML on "([^"]*)" matches with:$/) do |filename, node, textinput|
case node.downcase
  when "node1"
     nodeloc = "x:\\#{filename}.xml"
  when "node2"
     nodeloc = "y:\\#{filename}.xml"
end
   file = File.new(nodeloc,'r')
   content = file.read
   file.close

   xml_doc = Nokogiri::XML(content)

	 puts "XMl retrieved from #{node} is below ....." + "\n" + "#{xml_doc}" + "\n" + "-----------------------------------------------------------------"
   xml_value = xml_doc.to_xml.strip

   if xml_value == textinput.strip
     puts "#{filename}.xml on #{node} matches INPUT below"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
   else
     fail "#{filename}.xml on #{node} FAILED TO MATCH"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
  end
end

Then(/^I expect "([^"]*)" XML both node to match with:$/) do |filename, textinput|
     nodeloc1 = "x:\\#{filename}.xml"
     nodeloc2 = "y:\\#{filename}.xml"

   file = File.new(nodeloc1,'r')
   content1 = file.read
   file.close

   xml_doc1 = Nokogiri::XML(content1)
	 puts "XMl retrieved from #{$config["icetea1"]} is below ....." + "\n" + "#{xml_doc1}" + "\n" + "-----------------------------------------------------------------"
  	xml_value1 = xml_doc1.to_xml.strip

   if xml_value1 == textinput.strip
     puts "#{filename}.xml is expected to match input below"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
   else
     fail "#{filename}.xml on #{$config["icetea1"]} FAILED TO MATCH"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
   end
#=begin
   file = File.new(nodeloc2,'r')
   content2 = file.read
   file.close

   xml_doc2 = Nokogiri::XML(content2)
	 puts "XMl retrieved from #{$config["icetea2"]} is below ....." + "\n" + "#{xml_doc2}" + "\n" + "-----------------------------------------------------------------"
   xml_value2 = xml_doc2.to_xml.strip

   if xml_value2 == textinput.strip
     puts "#{filename}.xml is expected to match input below"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
   else
     fail "#{filename}.xml on #{$config["icetea2"]} FAILED TO MATCH"  + "\n"  + "#{textinput.strip}" + "\n"  + "-----------------------------------------------------------------"
   end
#=end

end

#=begin
Then(/^I expect "([^"]*)" XML both node to match with testdata$/) do |filename|
     nodeloc1 = "x:\\#{filename}.xml"
     nodeloc2 = "y:\\#{filename}.xml"

   file = File.new(nodeloc1,'r')
   content1 = file.read
   file.close

   #binding.pry

   file = File.new("test_data/#{filename}.xml",'r')
   test_data = file.read
   file.close

   xml_doc1 = Nokogiri::XML(content1)
   puts "XMl retrieved from #{$config["icetea1"]} is below ....." + "\n" + "#{xml_doc1}" + "\n" + "-----------------------------------------------------------------"
    xml_value1 = xml_doc1.to_xml.strip

   xml_test_data_val = Nokogiri::XML(test_data)
   xml_test_data = xml_test_data_val.to_xml.strip

   if xml_value1 == xml_test_data
     puts "#{filename}.xml is expected to match input below"  + "\n"  + "#{xml_test_data}" + "\n"  + "-----------------------------------------------------------------"
   else
     fail "#{filename}.xml on #{$config["icetea1"]} FAILED TO MATCH"  + "\n"  + "#{xml_test_data}" + "\n"  + "-----------------------------------------------------------------"
   end
#=begin
   file = File.new(nodeloc2,'r')
   content2 = file.read
   file.close

   xml_doc2 = Nokogiri::XML(content2)
   puts "XMl retrieved from #{$config["icetea2"]} is below ....." + "\n" + "#{xml_doc2}" + "\n" + "-----------------------------------------------------------------"
   xml_value2 = xml_doc2.to_xml.strip

   if xml_value2 == xml_test_data
     puts "#{filename}.xml is expected to match input below"  + "\n"  + "#{xml_test_data}" + "\n"  + "-----------------------------------------------------------------"
   else
     fail "#{filename}.xml on #{$config["icetea2"]} FAILED TO MATCH"  + "\n"  + "#{xml_test_data}" + "\n"  + "-----------------------------------------------------------------"
   end
#=end
end
#=end

Then(/^I should see "([^"]*)" File Saved message for "([^"]*)"$/) do |filetype, action|
  if action == "save"
    case filetype.downcase
    when 'ticker'
      filename = 'ticker'
    when 'breaking news'
      filename = 'bn01'
    when 'division'
      filename = 'dv01'
    when 'splitscreen'
      filename = 'ss01'
    when 'introduction'
      filename = 'in01'
    when /mu/
      filename = filetype.downcase
    end
      puts "Test Passed: #{filetype} XML File has been Saved!" if $wait.until {
        $driver.find_element(:class, 'alert-success').text.include? "Successfully saved #{filename}"
      }    
  else
    case filetype.downcase
    when 'ticker'
      filename = 'ticker'
    when 'breaking news'
      filename = 'breaking_news'
    when 'division'
      filename = 'division'
    when 'splitscreen'
      filename = 'splitscreen'
    when 'introduction'
      filename = 'introduction'
    when /mu/
      filename = 'mu01'
    end
      puts "Test Passed: #{filetype} XML File has been Saved!" if $wait.until {
        $driver.find_element(:class, 'alert-success').text.include? "Successfully saved #{filename}"
      }       
  end
end

Then (/^file lock for edit message should pop up$/) do
puts "Test Passed: File lock message pop up!" if $wait.until {
     $driver.find_element(:class, 'modal-body').text.include? "You currently have this file locked for editing"
		 sleep(2)
}
end

Then (/^I select date "([^"]*)" from day&date picker$/) do |date|
  newdate = date.split('-')
  year = newdate[2]
  month = newdate[1]
  day = newdate[0]
  get_todays_date()

end

Then (/^I select time "([^"]*)" from time picker "([^"]*)"$/) do |time, picker|
  newtime = time.split(':')
  hour = newtime[0].to_i
  min = newtime[1]
  timeval = "time"+"#{picker}"
  descval = "inputProgrammeDesc"+"#{picker}"

  if picker.to_i.between?(1, 10)
    newpicker = picker.to_i + 2
    entertextintimeplaceholder(time,picker)
  else
    fail "Only 10 time boxes are provided in Menu Screen!!!"
  end
end


And (/^I set testdata with "([^"]*)"$/) do |value|
  screen_menu_dates(value)
end  


Given (/^I delete all output files in "([^"]*)"$/) do |icetea_server|
  delete_icetea_output(icetea_server)
end