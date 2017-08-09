When(/^I provide full session details for a child-age cohort$/) do
  visit '/'
  click_link 'Create new form'
  choose 'Under 12 years old'
  click_button 'Continue'

  @methodologies = [:interview, :usability]
  @methodologies.each do |methodology|
    check "methodologies[]-#{methodology}"
  end
  click_button 'Continue'

  @recording_methods = [:audio, :video, :written]
  @recording_methods.each do |method|
    check "recording_methods[]-#{method}"
  end
  click_button 'Continue'

  @focus = <<~TEXT_WITH_DOUBLE_AND_SINGLE_LINEBREAK
    Fresnel lenses and the under-5s
    This line break follows a br

    Whereas this becomes its own p
  TEXT_WITH_DOUBLE_AND_SINGLE_LINEBREAK

  fill_in 'What is the focus of your research project?',
          with: @focus
  click_button 'Continue'

  within '[name="first-researcher"]' do
    fill_in 'Full name', with: 'Rachel Researcher'
    fill_in 'Telephone number', with: '012345678'
    fill_in 'Email', with: 'rachel@researcher.com'
  end

  within '[name="second-researcher"]' do
    fill_in 'Full name', with: 'Steve Secondresearcher'
  end
  click_button 'Continue'

  choose 'incentive-1'

  choose 'payment_type-cash'
  fill_in 'Incentive value', with: '10.50'

  click_button 'Continue'
end

Then(/^I should see the session review page$/) do
  step 'I should see confirmation that this is a preview'
end

Given(/^I have arrived at the methodologies step$/) do
  visit '/'
  click_link 'Create new form'
  choose 'Under 12 years old'
  click_button 'Continue'
end

And(/^I should see an 'Other' checkbox for (.*) with a space to fill this in$/) do |attr|
  attr = attr.downcase.tr(' ', '_')
  expect(page).to have_tag('label', with: { for: "#{attr}[]-other" })
  expect(page).to have_tag('input', with: { id: "#{attr}[]-other" })
  expect(page).to have_tag('input', with: { id: "#{attr}[]-other" })
end

When(/^I provide an 'Other' methodology$/) do
  check 'methodologies[]-other'

  @other_methodology = 'A.N. Other Methodology'
  fill_in 'What is the other methodology?', with: @other_methodology
end

When(/^I provide an 'Other' recording method$/) do
  check 'recording_methods[]-other'

  @other_recording_method = 'A.N. Other Recording Method'
  fill_in 'What is the other recording method?', with: @other_recording_method
end

And(/^I fill in the remaining steps$/) do
  @focus = <<~TEXT_WITH_DOUBLE_AND_SINGLE_LINEBREAK
    Fresnel lenses and the under-5s
    This line break follows a br

    Whereas this becomes its own p
  TEXT_WITH_DOUBLE_AND_SINGLE_LINEBREAK

  fill_in 'What is the focus of your research project?',
          with: @focus
  click_button 'Continue'

  within '[name="first-researcher"]' do
    fill_in 'Full name', with: 'Rachel Researcher'
    fill_in 'Telephone number', with: '012345678'
    fill_in 'Email', with: 'rachel@researcher.com'
  end

  within '[name="second-researcher"]' do
    fill_in 'Full name', with: 'Steve Secondresearcher'
  end
  click_button 'Continue'

  choose 'incentive-1'

  choose 'payment_type-cash'
  fill_in 'Incentive value', with: '10.50'

  click_button 'Continue'
end
