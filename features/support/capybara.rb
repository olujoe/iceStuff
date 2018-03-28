def wait_until(timeout_in_seconds = Capybara.default_wait_time)
  Timeout.timeout(timeout_in_seconds) do
    sleep(0.4) until value = yield
    value
  end
end

def wait_for_ajax
  return unless @scenario && javascript_scenario?

  wait_until do
    page.evaluate_script('jQuery.active') == 0
  end
end

def javascript_scenario?
  @scenario.source_tags.map(&:name).include?('@javascript')
end

=begin
module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform
  end
end
=end