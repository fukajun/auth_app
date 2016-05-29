require 'rails_helper'

feature 'Access home page' do
  scenario '' do
    visit '/'
    expect(current_path).to eq '/'
  end

  scenario '', js: true do
    visit '/'
    expect(current_path).to eq '/'
  end
end
