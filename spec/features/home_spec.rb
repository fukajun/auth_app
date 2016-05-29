require 'rails_helper'

feature 'Access home page' do
  scenario '', js: true do
    visit '/'
    expect(current_path).to eq '/'
  end
end
