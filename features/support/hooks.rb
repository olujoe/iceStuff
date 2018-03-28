#Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle

Before do
  # Do something before each scenario.
end

Before('@Ex_tag1, @Ex_tag2') do
  # This will only run before scenarios tagged
  # with @cucumis OR @sativus.
end

Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
    if $config['testrail'] == true
        @startT = Time.now
    end
end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.
  if $config['testrail'] == true
      @endT = Time.now
      elapsedseconds = @endT - @startT
      puts "Elapsed Time in (s): #{elapsedseconds}"
        #puts scenario.methods
        #puts scenario.source_tags.to_s
      finaltag = ""
      #scenario.source_tags.to_s.split(',').each do |data|
      scenario.tags.to_s.split(',').each do |data|
        puts data
        tag = data.to_s.split('::Tag "')[1].split('" (features')[0].strip
        #puts tag
        #puts tag[0,2]
        if tag.gsub(tag[0,2],"").isInteger?

          if (tag[0,2] == "@c" )

            newtag = tag.gsub("@c", "")
            begin
                finaltag = newtag.to_i
            rescue
                finaltag = ""
            end

          elsif (tag[0,2] == "@C")

            newtag = tag.gsub("@C", "")
            begin
                finaltag = newtag.to_i
            rescue
                finaltag = ""
            end

          else
              finaltag = ""
          end


          if finaltag == ""

              puts "Cannot Find Case ID, so not going to upload result to Testrail!!!"

          else
              #caseId = finaltag.gsub("@C", "")
              caseId = finaltag
              puts "Case id: #{caseId}"
              files = "//zgbwcfs3005.jupiter.bbc.co.uk/QA/Jenkins/Jupiter/ICETEArunid.txt"
              file = File.new(files,'r')
              runId = file.gets
              file.close
              puts "Run id: "+runId
              $runId = runId


              # Test fail do
              if scenario.failed?
                  statusId = "5"
                  if $config['debug'] == true
                      $driver.instance_variable_set(:@touched, false)
                      scenarioname = scenario.name.gsub(/\W/, '_')
                      time = Time.new
                      now = time.strftime("%Y-%m-%d %H:%M:%S").gsub(/\W/, '_')
                      filename = scenarioname + '_' + now
                      $driver.save_screenshot("reports/failed/#{filename}.png")
                      browser($config["unlockicetea1"])
                      browser($config["unlockicetea2"])
                      closebrowser
                  else
                      browser($config["unlockicetea1"])
                      browser($config["unlockicetea2"])
                      closebrowser
                  end
              else
                  # Test Pass do
                  statusId = "1"
              end
              posttestrail($runId, caseId, statusId, $versionId, elapsedseconds)
          end
        end
      end
  else
      puts "Not updating testrail, config set to false!"

        if scenario.failed?
            if $config['debug'] == true
                $driver.instance_variable_set(:@touched, false)
                scenarioname = scenario.name.gsub(/\W/, '_')
                time = Time.new
                now = time.strftime("%Y-%m-%d %H:%M:%S").gsub(/\W/, '_')
                filename = scenarioname + '_' + now
                $driver.save_screenshot("reports/failed/#{filename}.png")
                browser($config["unlockicetea1"])
                browser($config["unlockicetea2"])
                closebrowser
            else
                browser($config["unlockicetea1"])
                browser($config["unlockicetea2"])
                closebrowser
            end
        end
    
  end
end




AfterStep do
    sleep ($config['pause'] || 0).to_f
end

AfterStep('@Ex_tag1, @Ex_tag2') do
  # This will only run after steps within scenarios tagged
  # with @cucumis AND @sativus.
end
