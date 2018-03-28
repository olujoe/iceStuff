def takescreenshot()
  time = Time.new
  filename = time.strftime("%Y-%m-%d %H:%M:%S").gsub(/\W/, '_')
    $driver.save_screenshot("reports/pass/#{filename}.png")
end

def signin()
enterusername = $config["username"]
enterpassword = $config["password"]
inputfield = {
  "username" => enterusername,
  "password" => enterpassword
}
    inputfield.each do |key, value|
          input = $wait.until {
          element = $driver.find_element(:name, key)
          element if element.displayed?
          }
          input.send_keys(value)
    end
end

def signinbutton()
  $driver.find_element(:class, 'btn-block').click
end

def logoutbutton
  $driver.find_element(:css, "a[href*='/logout']").click
end

def browser(weblink)
  #binding.pry
  $driver.get weblink
  puts "Conneting to #{weblink}"
end


def view(viewlink)
  item = $wait.until {
    element = $driver.find_element(:css, "a[href*='#{viewlink}']")
    element if element.displayed?
  }
  item.click
end

def edit(editlink)
  item = $wait.until {
    element = $driver.find_element(:css, "a[href*='#{editlink}']")
    element if element.displayed?
  }
  item.click
end

def closebrowser()
  $driver.close
end

def clickbutton(function)
  case function
    when "Live"
      click = false
      $driver.find_elements(:class, "liveSwitch").each do |item|
        #binding.pry
        if item.text.include? function.upcase
          item.click
          click = true
          break
        end
      end
      fail "Cannot find #{function} button" unless click
=begin
    when "Clear All"
      click = false
      $driver.find_elements(:class, "liveSwitch").each do |item|
        #binding.pry
        if item.text.include? function.upcase
          item.click
          click = true
          break
        end
      end
      fail "Cannot find #{function} button" unless click
=end
=begin
    when "Send"
      click = false
      $driver.find_elements(:class, "sendBtn").each do |item|
        puts item.text
        #binding.pry
        if item.text.include? function
          item.click
          click = true
          break
        end
      end
      fail "Cannot find #{function} button" unless click
=end
    else
      click = false
      $driver.find_elements(:class, "btn-lg").each do |item|
        #puts item.text
        #binding.pry
        if item.text.include? function
          item.click
          click = true
          break
        end
      end
      fail "Cannot find #{function} button" unless click
    end
end

def clickpopupbutton(function)
click = false
  $driver.find_elements(:class, "btn").each do |item|
    if item.text.include? function
      item.click
      click = true
      sleep(1)
      break
    end
  end
  fail "Cannot find #{function} button" unless click
end

def checkelement(reg)
found = false
  $driver.find_elements(:tag_name, "legend").each do |item|
    if item.text.include? reg
        puts "Found!!!"
        found = true
      break
    end
  end
  fail "Cannot find element - #{reg}" unless found
end

def selectmenu(menu)
      select_list = $wait.until {
        element = $driver.find_element(:id, "loadMenu")
        element if element.displayed?
    }
    options=select_list.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text.downcase == menu.downcase
      g.click
      break
      end
    end
end

def selectsavetomenu(menu)
      select_list = $wait.until {
        element = $driver.find_element(:id, "select")
        element if element.displayed?
      }
      options=select_list.find_elements(:tag_name => "option")
      options.each do |g|
        if g.text.downcase == menu.downcase
        g.click
        break
        end
  end
end


def entertickertext(textinput)
  input = $wait.until {
#    element = $driver.find_element(:id, "textArea")
#    element = $driver.find_element(:id, "textArea1")
    element = $driver.find_element(:id, "textArea0")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys(:return)
  input.send_key(:backspace)
  sleep 2
  input.send_keys("#{textinput}")
end


def enterheadline(textinput)
  input = $wait.until {
    element = $driver.find_element(:id, "inputHeadline")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end

def enterdescription(textinput, line)
  input = $wait.until {
    element = $driver.find_element(:id, "inputDescription#{line}")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end

def enterdivision(textinput, line)
  input = $wait.until {
    element = $driver.find_element(:id, "inputDivisionText #{line}")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end


def enterinputtitle(textinput)
  input = $wait.until {
    element = $driver.find_element(:id, "introTitle")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end


def enterinputText(textinput, line)
  input = $wait.until {
    element = $driver.find_element(:id, "inputText#{line}")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end

def enterinputProgrammeDesc(textinput, line)
  input = $wait.until {
    element = $driver.find_element(:id, "inputProgrammeDesc#{line}")
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
end


def entertextintimeplaceholder(textinput, line)
  input = $wait.until {
    #binding.pry
    element = $driver.find_elements(:class, 'form-control')[line.to_i + 2]
    element if element.displayed?
  }
  input.click
  input.clear
  input.send_keys("#{textinput}")
  input.click
end

def entertextmenutimeplaceholder(textinput, line)
  input = $wait.until {
    element = $driver.find_elements(:class, 'form-control')[line.to_i]
    element if element.displayed?
  }
  input.send_keys("#{textinput}")
end

def get_todays_date()
  time = Time.now
  @todays_date = time.strftime("%A %d %B %Y")
  #Clipboard.copy @todays_date
  #Clipboard.paste
  $driver.find_element(:id, "dayDate").click
  $driver.find_element(:id, "dayDate").clear
  $driver.find_element(:id, "dayDate").send_keys @todays_date
  puts @todays_date
  $driver.find_element(:id, "dayDate").click
end

def setyear(year)
    found = false
    attempt = 0
#    $driver.find_element(:class, 'switch').click
    $driver.find_element(:class, 'rdtSwitch').click
    $driver.find_element(:class, 'rdtSwitch').click
    begin
      $driver.find_elements(:class, "rdtYears").each do |item|
        item = item.text
        item = item.split(" ")[3..14]
        #item = item.map(&:to_i)
        #if item.text == year
        if item.include?(year)
              puts "#{year} Found!!! " + "in #{item}"
              found = true
              @itemyear = item
              puts "i am going to try to click #{item.index(year)}"
              #binding.pry
              item.index(year).click
              #item.click
              #$driver.find_elements(:class, 'rdtYear').text.include?"1997".click
              #$driver.find_elements(:class, 'rdtYear').inspect.split(",")
            break
        end
        @itemyear = item
        puts @itemyear
      end
      fail "Cannot find year - #{year}" unless found
    rescue
      #binding.pry
      if attempt.between?(0, 14)
          if @itemyear.last <= year
            $driver.find_element(:class, "rdtNext").click
            attempt += 1
            retry
          elsif @itemyear.first >= year
            $driver.find_element(:class, "rdtPrev").click
            attempt += 1
            retry
          end
      else
        fail "Cannot find year - #{year} attempted #{attempt} times"
      end
    end
end


def setmonth(month)
found = false
  $driver.find_elements(:class, "rdtMonths").each do |item|
    if item.text.downcase == month.downcase
          #puts "Found!!!"
          found = true
          item.click
        break
      end
  end
  fail "Cannot find month - #{month}" unless found
end

def setday(day)
found = false
  $driver.find_elements(:class, "rdtDays").each do |item|
    if item.text.to_i == day.to_i
        #puts "Found!!!"
        found = true
        item.click
      break
    end
  end
  fail "Cannot find day - #{day}" unless found
end


def sethour(hour, newpicker)
  found = false
  attempt = 0
  begin
    item = $driver.find_elements(:class, "timepicker-hour")[newpicker]
        if item.text.to_i == hour.to_i
            puts "Found Hour!!!"
            found = true
        else
          @itemhour = item.text.to_i
          fail "Cannot find hour - #{hour}" unless found
        end
    rescue
      if attempt.between?(0, 23)
        timepickerarray = Array.new([[0,1], [2,3], [4,5], [6,7], [8,9], [10,11], [12,13], [14,15], [16,17], [18,19]])
        hourpicker = timepickerarray[newpicker][0]
          if @itemhour <= hour.to_i
              item = $driver.find_elements(:class, "glyphicon-chevron-up")[hourpicker]
              item.click if item.displayed?
            attempt += 1
            retry
          elsif @itemhour >= hour.to_i
              item = $driver.find_elements(:class, "glyphicon-chevron-down")[hourpicker]
              item.click if item.displayed?
              attempt += 1
            retry
          end
      else
        fail "Cannot find hour - #{hour} attempted #{attempt} times"
      end
    end
end


def setmin(min, newpicker)
  found = false
  attempt = 0
  begin
    item = $driver.find_elements(:class, "timepicker-minute")[newpicker]
        if item.text == min
            puts "Found Minute!!!"
            found = true
            begin
              $driver.find_elements(:class, 'bootstrap-datetimepicker-widget')[newpicker].find_element(:xpath, "..").click
              #$driver.find_elements(:class, 'glyphicon-time')[newpicker].click
            rescue
              if newpicker >= -2
                newpicker -= 1
                retry
              else
                fail "Avoiding inifinte loop!!!"
              end
            end
        else
          @itemmin = item.text
          fail "Cannot find min - #{min}" unless found
        end
  rescue
      if attempt.between?(0, 59)
        timepickerarray = Array.new([[0,1], [2,3], [4,5], [6,7], [8,9], [10,11], [12,13], [14,15], [16,17], [18,19]])
        minpicker = timepickerarray[newpicker][1]
          if @itemmin <= min
              item = $driver.find_elements(:class, "glyphicon-chevron-up")[minpicker]
              item.click if item.displayed?
              attempt += 1
              retry
          elsif @itemmin >= min
              item = $driver.find_elements(:class, "glyphicon-chevron-down")[minpicker]
              item.click if item.displayed?
              attempt += 1
              retry
          end
      else
        fail "Cannot find hour - #{min} attempted #{attempt} times"
      end
  end
end


def newbrowser
  begin
    proxy = Selenium::WebDriver::Proxy.new(:http => ENV['HTTP_PROXY'] || ENV['http_proxy'])
    ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil #important to override proxy setting for selenium browser
    $driver = Selenium::WebDriver.for(:"#{$browser_type}")
    $driver.manage().window().maximize()
    $driver.manage.timeouts.implicit_wait = 8
    $wait = Selenium::WebDriver::Wait.new(:timeout => $config['wait'].to_i)
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
end

class String
    def isInteger? 
      [                          # In descending order of likeliness:
        /^[-+]?[1-9]([0-9]*)?$/, # decimal
        /^0[0-7]+$/,             # octal
        /^0x[0-9A-Fa-f]+$/,      # hexadecimal
        /^0b[01]+$/              # binary
      ].each do |match_pattern|
        return true if self =~ match_pattern
      end
      return false
    end
end

def screen_menu_dates(file)
  time = Time.now
  @todays_date = time.strftime("%A %d %B %Y")
  puts @todays_date  

  if file == "splitscreen"

    val_doc = """<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<rss>
    <text>Test programme description line 1
Test programme description line 2
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
Test programme description line 4
Test programme description line 5
Test programme description line 6
Test programme description line 7
Test programme description line 8
Test programme description line 9
Test programme description line 10</text>
    <time>""#{@todays_date}""

NOW
03:18
06:51
COMING UP
15:49
UP NEXT
19:28
21:37
23:40
00:59</time>
</rss>
"""    
    #val_doc2 = Nokogiri::XML(val_doc)
    #val = val_doc2.to_xml.strip
    val = val_doc.strip
  elsif file == "mu01"
    val_doc = """<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<rss>
    <text>Test programme description line 1
Test programme description line 2
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
Test programme description line 4
Test programme description line 5
Test programme description line 6
Test programme description line 7
Test programme description line 8
Test programme description line 9
Test programme description line 10</text>
    <time>""#{@todays_date}""

01:00
03:18
06:51
11:37
15:49
17:06
19:28
21:37
23:40
00:59</time>
</rss>
"""    
    #val_doc2 = Nokogiri::XML(val_doc)
    #val = val_doc2.to_xml.strip
    val = val_doc.strip
  elsif file == "mu14"
    val_doc = """<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<rss>
    <text>change programme description line 1
Retesting programme description line 2
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
Test programme description line 4
Test programme description line 5
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
Test programme description line 7
Test programme description line 8
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|
,./;'#[]1234567890-=`¬!@£$^%^&amp;*()_+{}:~&lt;&gt;?|</text>
    <time>""#{@todays_date}""

06:11
03:25

23:02
07:19

16:49
04:37

12:26</time>
</rss>
"""
    #val_doc2 = Nokogiri::XML(val_doc)
    #val = val_doc2.to_xml.strip
    val = val_doc.strip
  elsif file == "mu09"
    val_doc = """<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<rss>
    <text>COPY MENU programme description line 1
COPY MENU programme description line 2
COPY MENU programme description line 3
COPY MENU programme description line 4
COPY MENU programme description line 5
COPY MENU programme description line 6
COPY MENU programme description line 7
COPY MENU programme description line 8
COPY MENU programme description line 9
COPY MENU programme description line 10</text>
    <time>""#{@todays_date}""

06:11
04:37
17:31
03:25
07:19
18:06
16:49
23:02
00:40
12:26</time>
</rss>
"""
    #val_doc2 = Nokogiri::XML(val_doc)
    #val = val_doc2.to_xml.strip
    val = val_doc.strip
  elsif file == "mu16"
    val_doc = """<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>
<rss>
    <text>COPY MENU programme description line 1
COPY MENU programme description line 2
COPY MENU programme description line 3
COPY MENU programme description line 4
COPY MENU programme description line 5
COPY MENU programme description line 6
COPY MENU programme description line 7
COPY MENU programme description line 8
COPY MENU programme description line 9
COPY MENU programme description line 10</text>
    <time>""#{@todays_date}""

06:11
04:37
17:31
03:25
07:19
18:06
16:49
23:02
00:40
12:26</time>
</rss>
"""
    #val_doc2 = Nokogiri::XML(val_doc)
    #val = val_doc2.to_xml.strip
    val = val_doc.strip

  end
  file = File.open("test_data/#{file}.xml", 'w') { |file| file.write(val_doc) }
end


def delete_icetea_output(icetea_server)
  if icetea_server == "icetea1"
     host = "zgbwcIceT7001.jupiter.bbc.co.uk"
   else
     host = "zgbwcIceT7002.jupiter.bbc.co.uk"
  end
puts host
result = ''  
# Start SSH connection
Net::SSH.start(host, 'npf', password: "npf") do |ssh|  
  # Open a channel
  channel = ssh.open_channel do |channel, success|
    # Callback to receive data. It will read the data and store it in result var or send the password if it's required.
    channel.on_data do |channel, data|
      if data =~ /^\[sudo\] password for /
        # Send the password
        channel.send_data "npf\n"
      else
        # Store the data
        result += data.to_s
      end
    end
    # Request a pseudo TTY
    channel.request_pty
    # Execute the command
    channel.exec("ls -l /etc/ice-tea/output/; sudo rm /etc/ice-tea/output/ticker.xml; ls -l /etc/ice-tea/output/")
    # Wait for response
    channel.wait
  end
  # Wait for opened channel
  channel.wait
end  
puts result
end

