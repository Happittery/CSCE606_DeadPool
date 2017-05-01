Given(/^User is on the import history page$/) do
  visit '/evaluation/import_history'
end

Then(/^User should be on the import history page$/) do
  current_path.should == "/evaluation/import_history"
end

When(/^User selects excel file$/) do
  page.attach_file("data_file", Rails.root + 'spec/fixtures/HistoricalReport.xlsx')
end

When(/^User selects a non-excel file$/) do
  page.attach_file("data_file", Rails.root + 'spec/fixtures/ruby-capybara.zip')
end

Then(/^User should see ([0-9]+) new evaluations imported. ([0-9]+) evaluations updated.$/) do |numNew, numUpdate|
  expect(page).to have_content("#{numNew} new evaluations imported. #{numUpdate} evaluations updated.")
end

Then(/^User should see message stating (.+)$/) do |message|
  expect(page).to have_content(message)
end
