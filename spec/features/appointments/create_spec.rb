require 'spec_helper'

describe 'Creating appointments' do
  it 'redirects to the appointment show page on success' do
    visit '/appointments'
    click link 'New Appointment'
    expect(page).to have content('New appointment')
  end
end
