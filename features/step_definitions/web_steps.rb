When /^I wait for (?:ajax for a second|a second)$/ do
  sleep 1
end

When /^I wait for a while$/ do
  sleep 0.1
end

When /^I wait for (.*?) seconds$/ do |seconds|
  sleep seconds.to_i
end

When /^I wait for "(.*?)" content will be visible$/ do |content|
  wait_until(20) do
    page.has_content?(content)
  end
end

When /^I wait for "(.*?)" button will be visible$/ do |button|
  wait_until(20) do
    page.has_button?(button)
  end
end

When /^I wait for "(.*?)" will be visible$/ do |css|
  wait_until(20) do
    page.has_css?(css)
  end
end

When /^I press return on "(.*?)" field$/ do |field|
  input = find("##{field}")
  input.base.invoke('keypress', false, false, false, false, 13, 0);
end

Then /^I should be redirected to (?:root path|dashboard)$/ do
  current_path.should eql root_path
end

Then /^I should be redirected to find project page$/ do
  current_path.should eql project_templates_path
end
Then /^I should see (?:a|an) "(.*?)" message$/ do |message|
  page.should have_content message
end

Then /^I should see a successful "([^"]*)" deletion message$/ do |model_name|
  page.should have_content "#{model_name} was successfully deleted."
end

Then /^I should see a successful "([^"]*)" creation message$/ do |model_name|
  page.should have_content "#{model_name} was successfully created."
end

Then /^I should see a failed "(.*?)" creation message$/ do |model_name|
  page.should have_content "prohibited this #{model_name} from being saved"
end

Then /^I should see a successful "([^"]*)" update message$/ do |model_name|
  page.should have_content "#{model_name} was successfully updated."
end

Then /^I should see a failed "(.*?)" update message$/ do |model_name|
  page.should have_content "prohibited this #{model_name} from being updated"
end

Then /^I should see placeholder "(.*?)" for "(.*?)" field$/ do |placeholder_content, field_name|
  find_field(field_name)['placeholder'].should == placeholder_content
end

# Interacting with links and the page in general

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I click "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I click "([^"]*)" within dropdown menu$/ do |link|
  find('.btn-gear').click()

  step %{I click "#{link}"}
end

When /^I click "(.*?)" within "(.*?)"$/ do |link, element|
  within element do
    click_link link
  end
end

When /^(?:|I )(?:choose|select) "([^"]*)" (?:for|from) "([^"]*)" within "(.*?)"$/ do |value, field, element|
  within element do
    select(value, :from => field)
  end
end

When /^I click on the "([^"]*)" image$/ do |img_alt|
  find(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end

And "I refresh the page" do
  visit page.current_path
end

When "I visit home page" do
  visit root_path
end

# Filling out and interacting with forms
Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Given /^I fill in "([^"]*)" with "([^"]*)" within '(.*?)'$/ do |field, value, element|
  within element do
    fill_in(field, :with => value)
  end
end

Given /^I fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

Given /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^I check "([^"]*)"$/ do |checkbox|
  check(checkbox)
end

When /^I check "([^"]*)" within "(.*?)"$/ do |checkbox, element|
  within element do
    check(checkbox)
  end
end

When /^I uncheck "([^"]*)"$/ do |checkbox|
  uncheck(checkbox)
end

When /^I uncheck "([^"]*)" within "(.*?)"$/ do |checkbox, element|
  within element do
    uncheck(checkbox)
  end
end

When /^I do not check "([^"]*)"$/ do |checkbox|
  uncheck(checkbox)
end

When /^(?:|I )choose "([^"]*)"$/ do |field|
  choose(field)
end

When /^(?:|I )choose "([^"]*)" within "(.*?)"$/ do |field, element|
  within element do
    choose(field)
  end
end

When /^I choose "([^"]*)" even though it is hidden$/ do |value|
  page.field_labeled(value).find(:xpath, "./parent::*").click
end

When /^(?:|I )(?:choose|select) "([^"]*)" (?:for|from) "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )(?:unchoose|deselect) "([^"]*)" from "([^"]*)"$/ do |value, field|
  unselect(value, :from => field)
end

When /^I attach "([^"]*)" to "([^"]*)"$/ do |file, target|
  path = File.join(::Rails.root, 'features', 'support', 'files', file)
  page.execute_script("$('##{target}').parent().removeClass('hidden_upload');")
  attach_file(target, path)
end

When /^I attach "([^"]*)" temporary file to "([^"]*)"$/ do |filename, target|
  tempfile = @temporary_files[filename]
  page.execute_script("$('##{target}').parent().removeClass('hidden_upload');")
  attach_file(target, tempfile.path)
end

When /^I attach "([^"]*)" to the uploadify for "([^"]*)"$/ do |file, id|
  page.execute_script("$('##{id}').show()")
  step %{I attach "#{file}" to "##{id}"}
  page.execute_script("$('##{id}').uploadifyUpload()")
end


# Testing form values

Then /^these fields should be ([^:]*):$/ do |checked_unchecked, values|
  values.raw.each do |option|
    step %{"#{option[0]}" should be #{checked_unchecked}}
  end
end

Then /^"([^"]*)" should be (?:checked|selected)$/ do |fieldname|
  page.find_field(fieldname).should be_checked
end

Then /^"([^"]*)" should (?:not be checked|be unchecked)$/ do |fieldname|
  page.find_field(fieldname).should_not be_checked
end

Then /^I should see the following (checkboxes|radios):$/ do |type, values|
  values.raw.each do |option|
    label = option[0]
    page.find(:field, label)[:type].should == type.gsub(/e?s/,"")
  end
end

Then /^I should see the following (checkboxes|radios), in order:$/ do |type, table|
  expected_order = table.raw.flatten
  type.gsub!(/e?s/,"")
  actual_order = page.all("input[type=#{type}]").collect{|input| input.find(:xpath, 'following-sibling::label[1]').text }
  actual_order.should == expected_order
end

Then /^I should see the following list of checkboxes with spans:$/ do |table|
  table.hashes.each do |row|
    label = row['label']
    span_body = row['span body']
    span_class = row['span class']
    checkbox = page.first(:field, label)
    checkbox[:type].should == "checkbox"
    span = checkbox.find(:xpath, '../span')
    span.text.should == span_body
    span[:class].should == span_class
  end
end

Then /^I should see the following list with spans:$/ do |table|
  table.hashes.each do |row|
    text = row['text']
    span_body = row['span body']
    span_class = row['span class']
    span = page.find(:css, "span.#{span_class}", text: span_body)
    li = span.find(:xpath, '..')
    li.text.should include(text)
  end
end

Then /^I should see an? "([^"]*)" field$/ do |fieldname|
  page.should have_field(fieldname)
end
Then /^I should not see an? "([^"]*)" field$/ do |fieldname|
  page.should_not have_field(fieldname)
end

Then /^"([^"]*)" should be selected for "([^"]*)"$/ do |value, field|
  id = page.find_field(field)["id"]
  page.should have_xpath "//select[@id = '#{id}']//option[text() = \"#{value}\" and @selected]"
end

Then /^nothing should be selected for "([^"]*)"$/ do |field|
  id = page.find_field(field)["id"]
  page.should_not have_xpath "//select[@id = '#{id}']/option[@selected]"
end

Then /^I should see (only|exactly) the following options for "(.*?)":$/ do |specificity, field, values|
  id = page.find_field(field)["id"]
  values.raw.each do |option|
    step %{"#{option[0]}" should be an option for "#{field}"}
  end
  expected_count = (specificity == "exactly") ? values.raw.length : values.raw.length + 1
  page.should have_xpath "//select[@id = '#{id}' and count(option)=#{expected_count}]"
end

Then /^"([^"]*)" should be an option for "([^"]*)"$/ do |value, field|
  id = page.find_field(field)["id"]
  page.should have_xpath "//select[@id = '#{id}']/option[text() = \"#{value}\"]"
end

Then /^"([^"]*)" should not be an option for "([^"]*)"$/ do |value, field|
  id = page.find_field(field)["id"]
  page.should have_no_xpath "//select[@id = '#{id}']/option[text() = '#{value}']"
end

Then /^I should see the following fields with values:$/ do |table|
  table.raw.each do |content|
    step %{the "#{content[0]}" field should contain "#{content[1]}"}
  end
end

Then /^the "([^"]*)" field should contain "([^"]*)"$/ do |field, value|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  if field_value.respond_to? :should
    field_value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_value)
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should not contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should not contain anything$/ do |field, selector|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    field_value.should be_blank
  end
end

Then /^I should see the following file upload options:$/ do |table|
  table.raw.each do |content|
    page.should have_field(content[0])
  end
end

# Error and alert messages
Then /^I should see the error message "([^"]*)"$/ do |text|
  selector = "//*[@class='error' and contains(text(),\"#{text}\")]"
  page.should have_xpath(selector)
end

Then /^I should see the error message "([^"]*)" on "([^"]*)"$/ do |text, field|
  selector = "//div/label[contains(text(),'#{field}') or contains(@for,'#{field}')]/..//span[@class='error' and contains(text(),\"#{text}\")]"
  page.should have_xpath(selector)
end

# Testing page content

Then /^the page should have the following css:$/ do |table|
  table.hashes.each do |row|
    selector = row['selector']
    property = row['property']
    expected_value = row['value']
    result = page.driver.evaluate_script("$('#{selector}').css('#{property}');") # "rgb(221, 221, 221)"
    if rgb = result.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
      result = "#" + rgb[1].to_i.to_s(16) + rgb[2].to_i.to_s(16) + rgb[3].to_i.to_s(16);
    else
      result = result.gsub("\"","").gsub("&#39;", "'")
    end
    if property == 'background-image'
      # to compensate for changing port numbers
      result.should include(expected_value)
    else
      result.should == expected_value
    end
  end
end

Then /^(?:|I )should see the following:$/ do |table|
  table.raw.each_with_index do |content, row|
    page.should have_content(content[0])
  end
end

Then /^(?:|I )should see the following list:$/ do |table|
  table.raw.each_with_index do |content, row|
    page.should have_xpath("//ul/li[#{row+1}][contains(normalize-space(.), '#{content[0]}')] | //ol/li[#{row+1}][contains(normalize-space(.), '#{content[0]}')] ")
  end
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I should see '([^']*)'$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "([^"]*)"$/ do |content|
  page.should have_no_content(content)
end

Then /^I should see a(?:n)? ([^\s]*) (?:tag )?with (.*) "(.*?)"$/ do |element, attr, value|
  selector = "#{element}[#{attr}='#{value}']"
  page.should have_css(selector)
end

Then /^I should see a(?:n)? "([^"]*)" tag containing "([^"]*)"$/ do |tag, contents|
  page.should have_css(tag, text: contents)
end

Then /^I should see the css "([^"]*)"$/ do |css|
  page.should have_css(css)
end
Then /^Element "([^"]*)" should be visible$/ do |css|
  page.should have_css(css, :visible => true)
end
Then /^Element "([^"]*)" should be hidden$/ do |css|
  page.should_not have_css(css, :visible => true)
end

Then /^I should see the heading "(.*?)"$/ do |text|
  page.should have_css('h1, h2, h3', text: text)
end

Then /^I should see (?:|a )"(.*?)" within "(.*?)"$/ do |text, element|
  within(element) do
    page.should have_content text
  end
end

Then /^I should not see (?:|a )"(.*?)" within "(.*?)"$/ do |text, element|
  within(element) do
    page.should_not have_content text
  end
end

Then /^I should not see anything within "(.*?)"$/ do |element|
  within(element) do
    page.should_not have_selector '*'
  end
end

Then /^I should not see any element with the selector "(.*?)"$/ do |klass|
  page.has_selector?(klass).should be_false
end

## Links

Then /^I should not see links to:$/ do |table|
  table.raw.each do |item|
    step %{I should not see a "#{item[0]}" link}
  end
end

And /^I should not see a(?:n)? "([^"]*)" link$/ do |link_text|
  page.should have_no_xpath("//a[contains(normalize-space(.),'#{link_text}')]")
end

And /^I should see a(?:n)? "([^"]*)" link$/ do |link_text|
  page.should have_xpath("//a[contains(normalize-space(.),'#{link_text}')]")
end

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  page.current_path.split('/').last.should == filename
end

## Images

Then /^I should see the following images with alt text:$/ do |table|
  table.raw.each do |content|
    page.should have_xpath("//img[contains(@src,'#{content[0]}') and @alt='#{content[1]}']")
  end
end

Then /^I should see the following images:$/ do |table|
  table.raw.each do |content|
    step %{I should see the image: "#{content[0]}"}
  end
end

Then /^I should see the image: "(.+)"$/ do |image|
  page.should have_xpath("//img[contains(@src,'#{image}')]")
end

Then /^I should see the image "(.+)" within "(.*?)"$/ do |alt, element|
  within element do
    page.should have_xpath("//img[contains(@alt,'#{alt}')]")
  end
end

Then /^I should not see the image "(.+)" within "(.*?)"$/ do |alt, element|
  within element do
    page.should_not have_xpath("//img[contains(@alt,'#{alt}')]")
  end
end

## Tables

Then /^I should see the following table for "(.*?)":$/ do |table_css, table|
  actual_table = table_at(table_css).to_a
  table.diff! actual_table
end

## Dialogs

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept if Capybara.current_driver == :selenium
end

When /^I should see a warning modal dialog$/ do
  step 'I confirm popup'
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss if Capybara.current_driver == :selenium
end

When /^I rate for (.*?) stars$/ do |rate|
  within '#star' do
    find(:xpath, "//img[@alt=#{rate}]").click
  end
end

Then /^"([^"]*)" select should not contain "([^"]*)" option$/ do |dropdown, text|
  page.has_select?(dropdown, :options => [text]).should_not eq true
end

Then /^"(.*?)" should be inside of any "(.*?)" element$/ do |text, element_class|
  find(:xpath, XPath::HTML.content(text)) do |node|
    node.should have_css element_class
  end
end

Then /^"(.*?)" should not be inside of any "(.*?)" element$/ do |text, element_class|
  find(:xpath, XPath::HTML.content(text)) do |node|
    node.should_not have_css element_class
  end
end

Then /^the "([^\"]*)" field should be disabled$/ do |field|
  page.find_field(field)['disabled'].should == 'true'
end

Then /^the "([^\"]*)" field should be enabled$/ do |field|
  page.find_field(field)['disabled'].should be_nil
end

Then /^"([^\"]*)" button should be disabled$/ do |button|
  page.find_button(button)['class'].should match /disabled/
end

Then /^"([^\"]*)" button should be enabled$/ do |button|
  page.find_button(button)['class'].should_not match /disabled/
end

When /^make interactions list scrollable$/ do
  page.execute_script %{
    $(".outreach_program_sidebar .box").css('height', '15px');
  }
end

Then /^I should see "(.*?)" before "(.*?)"$/ do |first_element, second_element|
  page.body.should =~ /#{first_element}.*#{second_element}/m
end

Then /^I should receive a file of type "(.*?)"/ do |type|
 page.response_headers['Content-Type'].should == type
end

Then /^"(.*?)" field should display an error/ do |field|
  page.find_field(field)['class'].should match /wrong/
end
