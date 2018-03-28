require 'Capybara'
require 'Capybara/cucumber'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'open-uri'
require 'uri'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium'
require 'clipboard'
require 'net/ssh'

# binding.pry config
Pry.config.input = STDIN
Pry.config.output = STDOUT
ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil

# YAML contfig load
$config = YAML.load(File.read('features/config/config.yml'))

$browser_type = $config['browser']


=begin
      begin
        proxy = Selenium::WebDriver::Proxy.new(:http => ENV['HTTP_PROXY'] || ENV['http_proxy'])
        ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil #important to override proxy setting for selenium browser
        #DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        #capabilities.setCapability("chrome.switches", Arrays.asList("--ignore-certificate-errors"));
        #driver = webdriver.Chrome(chrome_options=options)
        $driver = Selenium::WebDriver.for(:"#{$browser_type}")
        $driver.manage().window().maximize()
        $driver.manage.timeouts.implicit_wait = 5
        $wait = Selenium::WebDriver::Wait.new(:timeout => $config['wait'].to_i)
      rescue Exception => e
        #puts e.message
        Process.exit(0)
      end
=end